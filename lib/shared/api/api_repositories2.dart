import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/features/auth/data/requests/doctor.dart';
import 'package:health_app/features/auth/data/requests/pharmacist.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart'
    show
        DoctorAsPatientResponse,
        DoctorProfileResponse,
        GeneralResponse,
        LoginResponse,
        PatientProfileResponse,
        PharmacistAsPatientResponse,
        PharmacistProfileResponse,
        PatientRegisteredResponse;
import 'package:health_app/features/auth/domain/models/account.dart'
    show PatientAccount, DoctorAccount, PharmacistAccount;
import 'package:health_app/features/auth/domain/models/auth_state.dart'
    show AuthRecord;
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Patient, Doctor, Pharmacist;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/doctor/data/requests/home.dart'
    show RecentPatient;
import 'package:health_app/features/doctor/data/responses/insights.dart';
import 'package:health_app/features/home/data/responses/initialize_profile_response.dart';
import 'package:health_app/features/home/data/responses/patient_full_profile.dart';
import 'package:health_app/features/pharmacist/data/requests/profile.dart';
import 'package:health_app/features/pharmacist/data/responses/drugs_interaction.dart';
import 'package:health_app/features/pharmacist/data/responses/prescription.dart';
import 'package:health_app/features/pharmacist/data/responses/queue_item.dart'
    show PrescriptionQueueItem;
import 'package:health_app/shared/api/api_service2.dart' show ApiService;
import 'package:health_app/shared/ex.dart';

import '../../features/home/data/responses/patient_medical_records.dart';

class AppRepositories {
  final ApiService api;
  final AppStorage storage;

  AppRepositories({required this.api, required this.storage});

  Dio getDio() {
    return api.factory.getDio();
  }

  // ===============================================================
  // TOKEN REFRESH HANDLER
  // ===============================================================

  Future<ErrorOr<T>> handleDioRequest<T>({
    required Future<dynamic> Function() request,
    required T Function(dynamic) fromJson,
    bool throwError = false,
  }) async {
    try {
      final response = await request();

      // xlog('response $response');
      final res = response;
      // if (throwError) {
      //   throw DioException(
      //     requestOptions: response.requestOptions,
      //     response: Response(requestOptions: RequestOptions(), statusCode: 401),
      //   );
      // }
      if (res.runtimeType == Response) {
        if (response.statusCode == 401) {
          throw DioException(
            requestOptions: response.requestOptions,
            response: (res as Response),
          );
        }

        // throw DioException(requestOptions: )
      }
      return ErrorOr.success(data: fromJson(response));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        xlog('Token expired, attempting to refresh...');

        final refreshResult = await refreshToken();

        return refreshResult.when(
          success: (success) async {
            if (success) {
              xlog(
                'Token refreshed successfully, retrying original request...',
              );
              try {
                final retryResponse = await request();
                return ErrorOr.success(data: fromJson(retryResponse));
              } catch (retryError) {
                xlog('Retry failed after token refresh: $retryError');
                return ErrorOr.error(
                  error: ServerError(
                    msg: 'Request failed after token refresh: $retryError',
                  ),
                );
              }
            } else {
              xlog('Token refresh failed');
              await clearLocalData();
              return ErrorOr.error(
                error: ServerError(msg: 'Session expired. Please login again.'),
              );
            }
          },
          error: (error) {
            xlog('Token refresh error: $error');
            clearLocalData();
            return ErrorOr.error(
              error: ServerError(msg: 'Session expired. Please login again.'),
            );
          },
        );
      }

      xlog('DioException: ${e.message}');
      return ErrorOr.error(
        error: ServerError(msg: e.message ?? 'Network error occurred'),
      );
    } catch (e) {
      xlog('Unexpected error: salah $e');
      return ErrorOr.error(
        error: ServerError(msg: 'An unexpected error occurred:salah $e'),
      );
    }
  }

  Future<ErrorOr<bool>> addMedicalRecord(Map<String, dynamic> data) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final res = await api.addMedicalRecord(data);
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Add medical record error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to add medical record: $e'),
      );
    }
  }

  Future<ErrorOr<bool>> addPrescription(Map<String, dynamic> data) async {
    return handleDioRequest(
      request: () => api.addPrescription(data),
      fromJson: (data) => data['success'] ?? false,
    );
  }

  Future<ErrorOr<bool>> refreshToken() async {
    try {
      final refreshToken = storage.getUserRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        xlog('No refresh token available');
        return ErrorOr.error(
          error: ServerError(msg: 'No refresh token available'),
        );
      }

      xlog('Attempting to refresh token...');
      final response = await api.refreshToken(refreshToken);

      if (response['success'] == true || response['accessToken'] != null) {
        final newAccessToken = response['accessToken'];
        final newRefreshToken = response['refreshToken'] ?? refreshToken;

        await storage.setUserToken(newAccessToken);
        await storage.setUserRefreshToken(newRefreshToken);

        final currentAuth = storage.getAuthRecord();
        if (currentAuth != null) {
          final updatedAuth = AuthRecord(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
            role: currentAuth.role,
            userId: currentAuth.userId,
          );
          await storage.setAuthRecord(updatedAuth);
        }

        xlog('Token refreshed successfully');
        return ErrorOr.success(data: true);
      } else {
        xlog('Token refresh failed: ${response['message']}');
        return ErrorOr.error(
          error: ServerError(
            msg: response['message'] ?? 'Token refresh failed',
          ),
        );
      }
    } on DioException catch (e) {
      xlog('DioException during token refresh: ${e.message}');
      if (e.response?.statusCode == 401) {
        // await clearLocalData();
      }
      return ErrorOr.error(
        error: ServerError(msg: e.message ?? 'Token refresh failed'),
      );
    } catch (e) {
      xlog('Unexpected error during token refresh: $e');
      return ErrorOr.error(error: ServerError(msg: 'Token refresh failed: $e'));
    }
  }

  // ===============================================================
  // AUTHENTICATION
  // ===============================================================

  Future<ErrorOr<AuthRecord>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final res = await api.login(identifier, password);
      final response = LoginResponse.fromJson(res);

      final role = response.role ?? '';
      final isValid =
          role == 'patient' ||
          role == 'doctor' ||
          role == 'pharmacist' ||
          role == 'admin';

      if (response.wasSuccesfull && isValid) {
        await storage.setUserToken(response.accessToken ?? '');
        await storage.setUserRefreshToken(response.refreshToken ?? '');

        final auth = AuthRecord(
          accessToken: response.accessToken ?? '',
          refreshToken: response.refreshToken ?? '',
          role: role,
          userId: response.userId ?? 0,
        );
        storage.setAuthRecord(auth);

        await _getProfile(role);
        return ErrorOr.success(data: auth);
      } else {
        return ErrorOr.error(
          error: ServerError(msg: response.message ?? 'Login failed'),
        );
      }
    } catch (e) {
      // debugPrint(e.toString());
      return ErrorOr.error(error: ServerError(msg: 'Login failed: $e'));
    }
  }

  Future<ErrorOr<PatientRegisteredResponse>> registerPatient(
    Map<String, dynamic> data,
  ) async {
    try {
      final json = await api.registerPatient(data);
      final res = PatientRegisteredResponse.fromJson(json);
      if (res.success.isN()) {
        return ErrorOr.success(data: res);
      }
      return ErrorOr.error(error: ServerError(msg: res.message ?? 'faild'));
    } catch (e) {
      debugPrint('Patient registration error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Registration failed: $e'));
    }
  }

  Future<ErrorOr<GeneralResponse>> registerDoctor(
    DoctorRegisterRequest data,
  ) async {
    try {
      final res = await api.registerDoctor(FormData.fromMap(data.toJson()));
      final res2 = GeneralResponse.fromJson(res);
      if (res2.success.isN()) {
        return ErrorOr.success(data: res2);
      }
      return ErrorOr.error(error: ServerError(msg: res2.message ?? 'faild'));
    } catch (e) {
      debugPrint('Doctor registration error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Registration failed: $e'));
    }
  }

  Future<ErrorOr<GeneralResponse>> registerPharmacist(
    PharmacistRegisterRequest data,
  ) async {
    try {
      final res = await api.registerPharmacist(FormData.fromMap(data.toJson()));
      final res2 = GeneralResponse.fromJson(res);

      if (res2.success.isN()) {
        return ErrorOr.success(data: res2);
      }
      return ErrorOr.error(
        error: ServerError(msg: res2.message ?? 'server error'),
      );
    } catch (e) {
      debugPrint('Pharmacist registration error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Registration failed: $e'));
    }
  }

  PrescriptionQueueItem toModel(dynamic a) {
    return PrescriptionQueueItem.fromJson(a);
  }

  Future<ErrorOr<List<PrescriptionQueueItem>>>
  getPharmacistDashboardQueu() async {
    return handleDioRequest(
      request: () =>
          // await Future.delayed(Duration(seconds: 1));
          // final a = await
          getDio().get('/PharmacistDashboard/queue'),
      // return a;
      fromJson: (a) {
        final listData = (a.data as Iterable).map(toModel).toList();
        return listData;
      },
    );
    // return ErrorOr.success(data: listData);
  }

  Future<ErrorOr<bool>> logout() async {
    final result = await handleDioRequest(
      request: () => api.logout(),
      fromJson: (data) => data as bool,
    );

    // Always clear local data regardless of API result
    await storage.clearAllAccounts();
    return result;
  }

  // ===============================================================
  // DOCTOR FUNCTIONS
  // ===============================================================

  Future<ErrorOr<List<RecentPatient>>> doctorGetRecent() async {
    return handleDioRequest(
      request: () => api.doctorGetRecent(),
      fromJson: (data) {
        final list = data as List;
        return list.map((a) => RecentPatient.fromJson(a)).toList();
      },
    );
  }

  Future<ErrorOr<DoctorDashboardInsight>> doctorDashboardInsights() async {
    final result = await handleDioRequest(
      request: () => api.doctorStatistics(),
      fromJson: (data) => DoctorDashboardInsight.fromJson(data),
    );

    // Return empty insights on error
    return result.when(
      success: (data) => ErrorOr.success(data: data),
      error: (error) => ErrorOr.success(data: DoctorDashboardInsight()),
    );
  }

  Future<ErrorOr<bool>> changePassword(Map<String, dynamic> data) async {
    return handleDioRequest(
      request: () => api.changePassword(data),
      fromJson: (data) => data['success'] ?? false,
    );
  }

  // ===============================================================
  // PROFILE MANAGEMENT
  // ===============================================================

  Future<void> _getProfile(String role) async {
    final normalizedRole = role.toLowerCase();

    switch (normalizedRole) {
      case 'patient':
        await _getPatientProfile();
        break;
      case 'doctor':
        await _getDoctorProfile();
        break;
      case 'pharmacist':
        await _getPharmacistProfile();
        break;
      case 'admin':
        await _getAdminProfile();
        break;
      default:
        debugPrint('Unknown role: $role');
    }
  }

  Future<void> fetchPatientProfile() async {}

  Future<ErrorOr<PatientFullProfile>> getPatientFullProfile() async {
    return await handleDioRequest(
      request: api.getPatientFullProfile,
      fromJson: (p1) {
        return PatientFullProfile.fromJson(p1);
      },
    );
  }

  Future<void> _getPatientProfile() async {
    try {
      final result = await handleDioRequest(
        request: () => api.getPatientProfile(),
        fromJson: (data) => PatientProfileResponse.fromJson(data),
      );

      result.when(
        success: (res) async {
          final id = res.patient?.userId;
          if (id != null) {
            final isKnown = storage.getBool(isInitializedKey(id));
            if (!isKnown) {
              await storage.setBool(
                isInitializedKey(id),
                res.patient?.isProfileInitialized ?? false,
              );
            }
          }

          if (res.success.isN() && res.patient != null) {
            final patient = res.patient!;
            //
            // if (patient.isProfileInitialized) {
            //   storage.sharedPreferences.setBool(
            //     PATIENT_ACCOUNT_IS_INITIALIZED_KEY,
            //     true,
            //   );
            // }
            final patientAccount = PatientAccount(
              patient: Patient.fromJson(patient.toJson()),
            );
            await storage.setPatientAccount(patientAccount);
          }
        },
        error: (error) {
          debugPrint('Error fetching patient profile: $error');
        },
      );
    } catch (e) {
      debugPrint('Error fetching patient profile: $e');
    }
  }

  Future<ErrorOr<DoctorProfileResponse>> _getDoctorProfile() async {
    try {
      final activateResult = await handleDioRequest(
        request: () => api.activateDoctorAsPatientProfile(),
        fromJson: (data) => DoctorAsPatientResponse.fromJson(data),
      );

      activateResult.when(
        success: (res3) {
          if (res3.success.isN()) {
            final token = res3.token;
            if (token != null) {
              storage.setUserToken(token);
            }
          }
        },
        error: (error) {
          xlog('Error activating doctor as patient: $error');
        },
      );

      await _getPatientProfile();

      return handleDioRequest(
        request: () => api.getDoctorProfile(),
        fromJson: (data) {
          final res = DoctorProfileResponse.fromJson(data);
          if (res.success.isN() && res.doctor != null) {
            final doctor = res.doctor!;
            final doctorAccount = DoctorAccount(
              doctor: Doctor.fromJson(doctor.toJson()),
            );
            storage.setDoctorAccount(doctorAccount);
          }
          return res;
        },
      );
    } catch (e) {
      debugPrint('Error fetching doctor profile: $e');
      return ErrorOr.error(error: ServerError(msg: 'Unknown error: $e'));
    }
  }

  Future<void> _getPharmacistProfile() async {
    try {
      final activateResult = await handleDioRequest(
        request: () => api.activatePharmacistAsPatientProfile(),
        fromJson: (data) => PharmacistAsPatientResponse.fromJson(data),
      );

      activateResult.when(
        success: (res3) {
          if (res3.wasSuccesfull) {
            final token = res3.token;
            if (token != null) {
              storage.setUserToken(token);
            }
          }
        },
        error: (error) {
          xlog('Error activating pharmacist as patient: $error');
        },
      );

      await _getPatientProfile();

      final result = await handleDioRequest(
        request: () => api.getPharmacistProfile(),
        fromJson: (data) => PharmacistProfileResponse.fromJson(data),
      );

      result.when(
        success: (res) {
          if (res.wasSuccesfull && res.pharmacist != null) {
            final pharmacist = res.pharmacist!;
            final pharmacistAccount = PharmacistAccount(
              pharmacist: Pharmacist.fromJson(pharmacist.toJson()),
            );
            storage.setPharmacistAccount(pharmacistAccount);
          }
        },
        error: (error) {
          debugPrint('Error fetching pharmacist profile: $error');
        },
      );
    } catch (e) {
      debugPrint('Error fetching pharmacist profile: $e');
    }
  }

  Future<void> _getAdminProfile() async {
    // Admin profile implementation
  }

  Future<ErrorOr<String>> updatePatientProfile(
    Map<String, dynamic> data,
  ) async {
    return handleDioRequest(
      request: () => api.updatePatientProfile(data),
      fromJson: (data) {
        final patientRes = PatientProfileResponse.fromJson(data);
        if (patientRes.success.isN()) {
          return patientRes.message ?? '';
        }
        return '';
      },
    );
  }

  Future<ErrorOr<DoctorProfileResponse>> updateDoctorProfile(
    Map<String, dynamic> data,
  ) async {
    return handleDioRequest(
      request: () => api.updateDoctorProfile(data),
      fromJson: (data) => DoctorProfileResponse.fromJson(data),
    );
  }

  Future<ErrorOr<Pharmacist?>> updatePharmacistProfile(
    PharmacistProfileRequestData data,
  ) async {
    return handleDioRequest(
      request: () => api.updatePharmacistProfile(data.toJson()),
      fromJson: (json) {
        final response = PharmacistProfileResponse.fromJson(json);
        if (response.success.isN() && response.pharmacist != null) {
          final pharmacist = response.pharmacist!;
          final pharmacistAccount = PharmacistAccount(
            pharmacist: Pharmacist.fromJson(pharmacist.toJson()),
          );
          storage.setPharmacistAccount(pharmacistAccount);
          return Pharmacist.fromJson(pharmacist.toJson());
        }
        return null;
      },
    );
  }

  Future<ErrorOr<InitializeProfileResponse>> initializePatientProfile(
    Map<String, dynamic> data,
  ) async {
    final a = await handleDioRequest(
      request: () => api.initializePatientProfile(data),
      fromJson: (data) {
        return InitializeProfileResponse.fromJson(data);
      },
    );
    return await a.when(
      success: (s) async {
        if (s.wasSuccesfull) {
          await _getPatientProfile();
        }
        return ErrorOr.success(data: s);
      },
      error: (e) => ErrorOr.error(error: e),
    );
  }

  // ===============================================================
  // PATIENT FUNCTIONS
  // ===============================================================

  Future<ErrorOr<Map<String, dynamic>>> generateQr() async {
    return handleDioRequest(
      request: () => api.generateQr(),
      fromJson: (data) => data,
    );
  }

  Future<ErrorOr<Map<String, dynamic>>> getEmergencyScreen() async {
    return handleDioRequest(
      request: () => api.getPatientEmergencyScreen(),
      fromJson: (data) => data,
    );
  }

  Future<ErrorOr<List<PatientMedicalRecord>>> getPatientMedicalRecords() async {
    return handleDioRequest(
      request: () => api.getPatientMedicalRecords(),
      fromJson: (data) {
        // xlog(data.runtimeType);
        final dataRes = data as List;
        return dataRes.map((e) => PatientMedicalRecord.fromJson(e)).toList();
      },
      // data.map((e) => PatientMedicalRecord.fromJson(e)).toList(),
    );
  }

  Future<ErrorOr<List<dynamic>>> getPatientPrescriptions() async {
    return handleDioRequest(
      request: () => api.getPatientPrescriptions(),
      fromJson: (data) => data,
    );
  }

  Future<ErrorOr<Map<String, dynamic>>> getPatientDashboardSummary() async {
    return handleDioRequest(
      request: () => api.getPatientDashboardSummary(),
      fromJson: (data) => data,
    );
  }

  // ===============================================================
  // PHARMACIST FUNCTIONS
  // ===============================================================

  Future<ErrorOr<PrescriptionsResponse>> searchPrescription(
    String identifier,
  ) async {
    return handleDioRequest(
      request: () => api.searchPrescription(identifier),
      fromJson: (json) {
        final res = PrescriptionsResponse.fromJson(json);
        if (res.success.isN()) {
          return res;
        }
        throw Exception(res.message ?? 'no results');
      },
    );
  }

  Future<ErrorOr<DrugsInteractionsResponse>> checkDrugInteractions(
    int id,
  ) async {
    return handleDioRequest(
      request: () => api.checkDrugInteractions(id),
      fromJson: (data) => DrugsInteractionsResponse.fromJson(data),
    );
  }

  Future<ErrorOr<bool>> dispensePrescription(Map<String, dynamic> data) async {
    return handleDioRequest(
      request: () => api.dispensePrescription(data),
      fromJson: (data) => data['success'] ?? false,
    );
  }

  Future<ErrorOr<bool>> createPharmacistPrescription(
    Map<String, dynamic> data,
  ) async {
    return handleDioRequest(
      request: () => api.createPharmacistPrescription(data),
      fromJson: (data) => data['success'] ?? false,
    );
  }

  Future<ErrorOr<bool>> updatePrescriptionStatus(
    int id,
    int status,
    String notes,
  ) async {
    return handleDioRequest(
      request: () => api.updatePrescriptionStatus(id, status, notes),
      fromJson: (data) => data['success'] ?? false,
    );
  }

  // ===============================================================
  // ADMIN FUNCTIONS
  // ===============================================================

  Future<ErrorOr<List<dynamic>>> getPendingRegistrations() async {
    return handleDioRequest(
      request: () => api.getPendingRegistrations(),
      fromJson: (data) => data,
    );
  }

  Future<ErrorOr<String>> approveUser(int userId) async {
    return handleDioRequest(
      request: () => api.approveUser(userId),
      fromJson: (data) => data['message'] ?? 'User approved',
    );
  }

  Future<ErrorOr<String>> rejectUser(int userId) async {
    return handleDioRequest(
      request: () => api.rejectUser(userId),
      fromJson: (data) => data['message'] ?? 'User rejected',
    );
  }

  Future<ErrorOr<Map<String, dynamic>>> getUsers(
    Map<String, dynamic> filterData,
  ) async {
    return handleDioRequest(
      request: () => api.getUsers(filterData),
      fromJson: (data) => data,
    );
  }

  Future<ErrorOr<bool>> updateUserStatus(Map<String, dynamic> data) async {
    return handleDioRequest(
      request: () => api.updateUserStatus(data),
      fromJson: (data) => data['success'] ?? false,
    );
  }

  Future<ErrorOr<Map<String, dynamic>>> getAuditLogs(
    Map<String, dynamic> filterData,
  ) async {
    return handleDioRequest(
      request: () => api.getAuditLogs(filterData),
      fromJson: (data) => data,
    );
  }

  Future<ErrorOr<Map<String, dynamic>>> getStatistics() async {
    return handleDioRequest(
      request: () => api.getStatistics(),
      fromJson: (data) => data,
    );
  }

  Future<ErrorOr<bool>> sendNotification(Map<String, dynamic> data) async {
    return handleDioRequest(
      request: () => api.sendNotification(data),
      fromJson: (data) => data['success'] ?? false,
    );
  }

  // ===============================================================
  // SEARCH FUNCTIONS
  // ===============================================================

  Future<ErrorOr<Map<String, dynamic>>> searchPatient(String identifier) async {
    return handleDioRequest(
      request: () => api.searchPatient(identifier),
      fromJson: (data) => data,
    );
  }

  // ===============================================================
  // HELPER METHODS
  // ===============================================================

  bool isLoggedInAs(String role) {
    final normalizedRole = role.toLowerCase();
    final authToken = storage.getUserToken();

    if (authToken == null) return false;

    switch (normalizedRole) {
      case 'patient':
        return storage.getPatientAccount() != null;
      case 'doctor':
        return storage.getDoctorAccount() != null;
      case 'pharmacist':
        return storage.getPharmacistAccount() != null;
      case 'admin':
        return storage.getAdminAccount() != null;
      default:
        return false;
    }
  }

  String? getCurrentRole() {
    if (storage.getPatientAccount() != null) return 'patient';
    if (storage.getDoctorAccount() != null) return 'doctor';
    if (storage.getPharmacistAccount() != null) return 'pharmacist';
    if (storage.getAdminAccount() != null) return 'admin';
    return null;
  }

  String? getAuthToken() {
    return storage.getUserToken();
  }

  Future<void> clearLocalData() async {
    await storage.clearAllAccounts();
  }
}
