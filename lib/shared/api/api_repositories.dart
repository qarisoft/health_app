import 'package:flutter/widgets.dart';
import 'package:health_app/core/error/app_error.dart' show ErrorOr, ServerError;
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart'
    show
        DoctorProfileResponse,
        GeneralResponse,
        LoginResponse,
        PatientProfileResponse,
        PharmacistProfileResponse;
import 'package:health_app/features/auth/domain/models/account.dart'
    show PatientAccount, DoctorAccount, PharmacistAccount;
import 'package:health_app/features/auth/domain/models/auth_state.dart'
    show AuthRecord;
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Patient, Doctor, Pharmacist;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/shared/api/api_service.dart' show ApiService;
import 'package:health_app/shared/ex.dart';

class AppRepositories {
  final ApiService api;
  final AppStorage storage;
  AppRepositories({required this.api, required this.storage});

  // ===============================================================
  // AUTHENTICATION
  // ===============================================================

  Future<ErrorOr<AuthRecord>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final res = await api.login(identifier, password);
      // res.log();
      final response = LoginResponse.fromJson(res);

      final role = response.role ?? '';
      final isValid =
          role == 'patient' ||
          role == 'doctor' ||
          role == 'pharmacist' ||
          role == 'admin';

      if (response.success && isValid) {
        // if () {
        await _getProfile(role);

        final auth = AuthRecord(
          accessToken: response.accessToken ?? '',
          role: role,
          userId: response.userId ?? 0,
        );
        // storage.setAuthRecord(auth);

        return ErrorOr.success(data: auth);
        // }
      } else {
        return ErrorOr.error(
          error: ServerError(msg: response.message ?? 'Login failed'),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      xlog('error');
      xlog(e);
      return ErrorOr.error(error: ServerError(msg: 'Login failed: $e'));
    }
  }

  Future<ErrorOr<GeneralResponse>> registerPatient(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.registerPatient(data);
      return ErrorOr.success(data: GeneralResponse.fromJson(res));
    } catch (e) {
      debugPrint('Patient registration error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Registration failed: $e'));
    }
  }

  Future<ErrorOr<GeneralResponse>> registerDoctor(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.registerDoctor(data);
      return ErrorOr.success(data: GeneralResponse.fromJson(res));
    } catch (e) {
      debugPrint('Doctor registration error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Registration failed: $e'));
    }
  }

  Future<ErrorOr<GeneralResponse>> registerPharmacist(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.registerPharmacist(data);

      return ErrorOr.success(data: GeneralResponse.fromJson(res));
    } catch (e) {
      debugPrint('Pharmacist registration error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Registration failed: $e'));
    }
  }

  Future<ErrorOr<bool>> logout() async {
    try {
      final res = await api.logout();
      await storage.clearAllAccounts();
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Logout error: $e');
      await storage.clearAllAccounts();
      return ErrorOr.error(error: ServerError(msg: 'Logout failed: $e'));
    }
  }

  Future<ErrorOr<bool>> changePassword(Map<String, dynamic> data) async {
    try {
      final res = await api.changePassword(data);
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Change password error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Password change failed: $e'),
      );
    }
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

  Future<void> _getPatientProfile() async {
    try {
      final json = await api.getPatientProfile();
      // json.log('patient   dddd');
      for (var s in json.entries) {
        s.log('e');
      }

      final res = PatientProfileResponse.fromJson(json);

      res.patient?.toJson().log('res ');

      if (res.success && res.patient != null) {
        final patient = res.patient!;
        final patientAccount = PatientAccount(
          patient: Patient.fromJson(patient.toJson()),
        );

        // patientAccount.log('patientAccount');
        await storage.setPatientAccount(patientAccount);
      }
    } catch (e) {
      debugPrint('Error fetching patient profile: $e');
    }
  }

  Future<ErrorOr<DoctorProfileResponse>> _getDoctorProfile() async {
    try {
      final json = await api.getDoctorProfile();
      final res = DoctorProfileResponse.fromJson(json);

      if (res.success && res.doctor != null) {
        final doctor = res.doctor!;
        final doctorAccount = DoctorAccount(
          doctor: Doctor.fromJson(doctor.toJson()),
        );
        await storage.setDoctorAccount(doctorAccount);
        return ErrorOr.success(data: DoctorProfileResponse.fromJson(json));
      }
      throw 'Unkown error';
    } catch (e) {
      debugPrint('Error fetching doctor profile: $e');
    }
    return ErrorOr.error(error: ServerError(msg: 'Unkown error'));
  }

  Future<void> _getPharmacistProfile() async {
    try {
      final json = await api.getPharmacistProfile();
      final res = PharmacistProfileResponse.fromJson(json);

      if (res.success && res.pharmacist != null) {
        final pharmacist = res.pharmacist!;
        final pharmacistAccount = PharmacistAccount(
          pharmacist: Pharmacist.fromJson(pharmacist.toJson()),
        );
        await storage.setPharmacistAccount(pharmacistAccount);
      }
    } catch (e) {
      debugPrint('Error fetching pharmacist profile: $e');
    }
  }

  Future<void> _getAdminProfile() async {
    // try {
    //   final json = await api.getAdminProfile();
    //   final res = AdminProfileResponse.fromJson(json);

    //   if (res.success && res.admin != null) {
    //     final admin = res.admin!;
    //     final adminAccount = AdminAccount(
    //       admin: Admin.fromJson(admin.toJson()),
    //     );
    //     await storage.setAdminAccount(adminAccount);
    //   }
    // } catch (e) {
    //   debugPrint('Error fetching admin profile: $e');
    // }
  }

  // Update profile methods
  Future<ErrorOr<String>> updatePatientProfile(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.updatePatientProfile(data);
      final patientRes = PatientProfileResponse.fromJson(res);

      if (patientRes.success) {
        return ErrorOr.success(data: patientRes.message ?? '');
        //   // Refresh profile after update
        //   // await _getPatientProfile();
      }
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Update patient profile error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Update failed: $e'));
    }
  }

  Future<ErrorOr<DoctorProfileResponse>> updateDoctorProfile(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.updateDoctorProfile(data);
      if (res['success'] == true) {
        // Refresh profile after update
        // return await _getDoctorProfile();
        return ErrorOr.success(data: DoctorProfileResponse.fromJson(res));
      }
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Update doctor profile error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Update failed: $e'));
    }
  }

  Future<ErrorOr<bool>> updatePharmacistProfile(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.updatePharmacistProfile(data);
      if (res['success'] == true) {
        // Refresh profile after update
        await _getPharmacistProfile();
      }
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Update pharmacist profile error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Update failed: $e'));
    }
  }

  // Initialize patient profile
  Future<ErrorOr<bool>> initializePatientProfile(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.initializePatientProfile(data);
      if (res['success'] == true) {
        // Refresh profile after initialization
        await _getPatientProfile();
      }
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Initialize patient profile error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Initialization failed: $e'),
      );
    }
  }

  // ===============================================================
  // DOCTOR FUNCTIONS
  // ===============================================================

  Future<ErrorOr<dynamic>> searchPatient(String identifier) async {
    try {
      final res = await api.searchPatient(identifier);
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Search patient error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Search failed: $e'));
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
    try {
      final res = await api.addPrescription(data);
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Add prescription error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to add prescription: $e'),
      );
    }
  }

  // ===============================================================
  // PATIENT FUNCTIONS
  // ===============================================================

  Future<ErrorOr<Map<String, dynamic>>> generateQr() async {
    try {
      final res = await api.generateQr();
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Generate QR error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to generate QR: $e'),
      );
    }
  }

  Future<ErrorOr<Map<String, dynamic>>> getEmergencyScreen() async {
    try {
      final res = await api.getEmergencyScreen();
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Get emergency screen error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to get emergency info: $e'),
      );
    }
  }

  Future<ErrorOr<List<dynamic>>> getPatientMedicalRecords() async {
    try {
      final res = await api.getPatientMedicalRecords();
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Get medical records error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to get medical records: $e'),
      );
    }
  }

  Future<ErrorOr<List<dynamic>>> getPatientPrescriptions() async {
    try {
      final res = await api.getPatientPrescriptions();
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Get prescriptions error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to get prescriptions: $e'),
      );
    }
  }

  // ===============================================================
  // PHARMACIST FUNCTIONS
  // ===============================================================

  Future<ErrorOr<dynamic>> searchPrescription(String identifier) async {
    try {
      final res = await api.searchPrescription(identifier);
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Search prescription error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Search failed: $e'));
    }
  }

  Future<ErrorOr<Map<String, dynamic>>> checkDrugInteractions(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.checkDrugInteractions(data);
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Check drug interactions error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to check interactions: $e'),
      );
    }
  }

  Future<ErrorOr<bool>> dispensePrescription(Map<String, dynamic> data) async {
    try {
      final res = await api.dispensePrescription(data);
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Dispense prescription error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Failed to dispense: $e'));
    }
  }

  Future<ErrorOr<bool>> createPharmacistPrescription(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await api.createPharmacistPrescription(data);
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Create prescription error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to create prescription: $e'),
      );
    }
  }

  Future<ErrorOr<bool>> updatePrescriptionStatus(
    int id,
    int status,
    String notes,
  ) async {
    try {
      final res = await api.updatePrescriptionStatus(id, status, notes);
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Update prescription status error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to update status: $e'),
      );
    }
  }

  // ===============================================================
  // ADMIN FUNCTIONS
  // ===============================================================

  Future<ErrorOr<List<dynamic>>> getPendingRegistrations() async {
    try {
      final res = await api.getPendingRegistrations();
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Get pending registrations error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to get pending registrations: $e'),
      );
    }
  }

  Future<ErrorOr<String>> approveUser(int userId) async {
    try {
      final res = await api.approveUser(userId);
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Approve user error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to approve user: $e'),
      );
    }
  }

  Future<ErrorOr<String>> rejectUser(int userId) async {
    try {
      final res = await api.rejectUser(userId);
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Reject user error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to reject user: $e'),
      );
    }
  }

  Future<ErrorOr<Map<String, dynamic>>> getUsers(
    Map<String, dynamic> filterData,
  ) async {
    try {
      final res = await api.getUsers(filterData);
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Get users error: $e');
      return ErrorOr.error(error: ServerError(msg: 'Failed to get users: $e'));
    }
  }

  Future<ErrorOr<bool>> updateUserStatus(Map<String, dynamic> data) async {
    try {
      final res = await api.updateUserStatus(data);
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Update user status error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to update user status: $e'),
      );
    }
  }

  Future<ErrorOr<Map<String, dynamic>>> getAuditLogs(
    Map<String, dynamic> filterData,
  ) async {
    try {
      final res = await api.getAuditLogs(filterData);
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Get audit logs error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to get audit logs: $e'),
      );
    }
  }

  Future<ErrorOr<Map<String, dynamic>>> getStatistics() async {
    try {
      final res = await api.getStatistics();
      return ErrorOr.success(data: res);
    } catch (e) {
      debugPrint('Get statistics error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to get statistics: $e'),
      );
    }
  }

  Future<ErrorOr<bool>> sendNotification(Map<String, dynamic> data) async {
    try {
      final res = await api.sendNotification(data);
      return ErrorOr.success(data: res['success'] ?? false);
    } catch (e) {
      debugPrint('Send notification error: $e');
      return ErrorOr.error(
        error: ServerError(msg: 'Failed to send notification: $e'),
      );
    }
  }

  // ===============================================================
  // HELPER METHODS
  // ===============================================================

  // dynamic getCurrentUser(String role)  {
  //   final normalizedRole = role.toLowerCase();

  //   switch (normalizedRole) {
  //     case 'patient':
  //       return  storage.getPatientAccount();
  //     case 'doctor':
  //       return  storage.getDoctorAccount();
  //     case 'pharmacist':
  //       return  storage.getPharmacistAccount();
  //     case 'admin':
  //       return  storage.getAdminAccount();
  //     default:
  //       return null;
  //   }
  // }

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

  // int? getUserId() {
  //   return storage.getUserId();
  // }

  Future<void> clearLocalData() async {
    await storage.clearAllAccounts();
  }
}
