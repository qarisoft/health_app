import 'package:flutter/widgets.dart';
import 'package:health_app/core/error/app_error.dart' show ErrorOr, ServerError;
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart'
    show
        LoginResponse,
        PatientProfileResponse,
        DoctorProfileResponse,
        PharmacistProfileResponse;
import 'package:health_app/features/auth/domain/models/account.dart'
    show PatientAccount, DoctorAccount, PharmacistAccount, AdminAccount;
import 'package:health_app/features/auth/domain/models/auth_state.dart'
    show AuthRecord;
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/auth/domain/models/auth_state.dart';
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Patient, Doctor, Pharmacist, Admin;
// import 'package:health_app/features/auth/domain/models/doctor.dart'
//     show Doctor;
// import 'package:health_app/features/auth/domain/models/pharmacist.dart'
//     show Pharmacist;
// import 'package:health_app/features/auth/domain/models/admin.dart'
//     show Admin;
import 'package:health_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:health_app/shared/api/api_service.dart';

class AppRepositories {
  final ApiService api;
  final AppStorage storage;
  AppRepositories({required this.api, required this.storage});

  Future<ErrorOr<AuthRecord>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final res = await api.login(identifier, password);
      final response = LoginResponse.fromJson(res);

      if (response.success) {
        final role = response.role ?? 'patient';
        await _getProfile(role);

        return ErrorOr.success(
          data: AuthRecord(
            accessToken: response.accessToken ?? '',
            role: role,
            userId: response.userId ?? 0,
          ),
        );
      } else {
        return ErrorOr.error(
          error: ServerError(msg: response.message ?? 'Login failed'),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return ErrorOr.error(error: ServerError(msg: 'Login failed: $e'));
    }
  }

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
      final res = PatientProfileResponse.fromJson(json);

      if (res.success && res.patient != null) {
        final patient = res.patient!;
        final patientAccount = PatientAccount(
          patient: Patient.fromJson(patient.toJson()),
        );
        storage.setPatientAccount(patientAccount);
      }
    } catch (e) {
      debugPrint('Error fetching patient profile: $e');
    }
  }

  Future<void> _getDoctorProfile() async {
    try {
      final json = await api.getDoctorProfile();
      final res = DoctorProfileResponse.fromJson(json);

      if (res.success && res.doctor != null) {
        final doctor = res.doctor!;
        final doctorAccount = DoctorAccount(
          doctor: Doctor.fromJson(doctor.toJson()),
        );
        storage.setDoctorAccount(doctorAccount);
      }
    } catch (e) {
      debugPrint('Error fetching doctor profile: $e');
    }
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
        storage.setPharmacistAccount(pharmacistAccount);
      }
    } catch (e) {
      debugPrint('Error fetching pharmacist profile: $e');
    }
  }

  Future<void> _getAdminProfile() async {
    // try {
    // final json = await api.getAdminProfile();
    // final res = AdminProfileResponse.fromJson(json);

    // if (res.success && res.admin != null) {
    //   final admin = res.admin!;
    //   final adminAccount = AdminAccount(admin: Admin.fromJson(admin.toJson()));
    //   storage.setAdminAccount(adminAccount);
    // }
    // } catch (e) {
    //   debugPrint('Error fetching admin profile: $e');
    // }
  }

  // Helper method to get current user based on role
  Future<dynamic> getCurrentUser(String role) async {
    final normalizedRole = role.toLowerCase();

    switch (normalizedRole) {
      case 'patient':
        return storage.getPatientAccount();
      case 'doctor':
        return storage.getDoctorAccount();
      case 'pharmacist':
        return storage.getPharmacistAccount();
      case 'admin':
        return storage.getAdminAccount();
      default:
        return null;
    }
  }

  // Logout method for all roles
  Future<void> logout() async {
    await storage.clearAllAccounts();
    await storage.clearAuthToken();
  }

  // Check if user is logged in for specific role
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

  // Get current authenticated role
  String? getCurrentRole()  {
    // Check which account type exists
    if (storage.getPatientAccount() != null) return 'patient';
    if (storage.getDoctorAccount() != null) return 'doctor';
    if (storage.getPharmacistAccount() != null) return 'pharmacist';
    if (storage.getAdminAccount() != null) return 'admin';
    return null;
  }
}
