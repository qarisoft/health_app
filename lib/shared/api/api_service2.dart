// Updated ApiService with proper type handling for methods that return lists
import 'dart:convert' show json;
import 'dart:io' show Platform;

import 'package:dio/dio.dart' show FormData, Options, Dio, Response;
import 'package:health_app/core/constants/k.dart' show K;
import 'package:health_app/di.dart';
import 'package:health_app/shared/api/dio_factory.dart' show DioFactory;

import '../ex.dart' show xlog;

class ApiService {
  Dio get _dio => factory.getDio();
  Dio get _gDio => factory.getDio(geust: true);
  final DioFactory factory;

  ApiService(this.factory);

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    try {
      final response = await _gDio.post(
        '/Auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  // Helper method to handle responses
  dynamic _handleResponse(response) {
    try {
      // if (response.data is Map<String, dynamic>) {
      //   return response.data as Map<String, dynamic>;
      // } else if (response.data is String) {
      //   try {
      //     final decoded = json.decode(response.data);
      //     if (decoded is Map<String, dynamic>) {
      return response.data;
      // return decoded;
      //     }
      //   } catch (_) {}
      // }
      // return {'success': false, 'message': 'Invalid response format'};
    } catch (e) {
      return {'success': false, 'message': 'Error parsing response: $e'};
    }
  }

  // Helper for list responses
  List<dynamic> _handleListResponse(Response response) {
    if (response.data is List) {
      return response.data as List<dynamic>;
    } else if (response.data is Map &&
        (response.data as Map).containsKey('data')) {
      final data = (response.data as Map)['data'];
      if (data is List) {
        return data;
      }
    }
    return [];
  }

  // ===============================================================
  // AUTHENTICATION
  // ===============================================================

  Future<Map<String, dynamic>> registerPatient(
    Map<String, dynamic> data,
  ) async {
    final response = await _gDio.post('/Auth/register/patient', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> registerDoctor(FormData data) async {
    xlog(data.toString());
    final response = await _gDio.post('/Auth/register/doctor', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> registerPharmacist(FormData data) async {
    final response = await _gDio.post(
      '/Auth/register/pharmacist',
      data: data,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> login(String identifier, String password) async {
    final response = await _gDio.post(
      '/Auth/login',
      data: {
        "identifier": identifier,
        "password": password,
        "deviceToken": "dummy_token_or_fcm",
        "devicePlatform": Platform.operatingSystem,
      },
    );
    return _handleResponse(response);
  }

  Future<bool> logout() async {
    try {
      await _dio.post('/Auth/logout');
      final prefs = appStorage.sharedPreferences;
      await prefs.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> data) async {
    final response = await _dio.post('/Auth/change-password', data: data);
    return _handleResponse(response);
  }

  // ===============================================================
  // DOCTOR
  // ===============================================================

  Future<Map<String, dynamic>> getDoctorProfile() async {
    final response = await _dio.get('/Doctor/profile');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> activateDoctorAsPatientProfile() async {
    final response = await _dio.post('/Doctor/activate-patient-profile');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> activatePharmacistAsPatientProfile() async {
    try {
      final response = await _dio.post('/Pharmacist/activate-patient-profile');
      return _handleResponse(response);
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, dynamic>> doctorStatistics() async {
    final response = await _dio.get('/Doctordashboard/insights');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updateDoctorProfile(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put('/Doctor/profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> searchPatient(String identifier) async {
    final response = await _dio.post(
      '/Doctor/search-patient',
      data: {"identifier": identifier},
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> addMedicalRecord(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/Doctor/medical-record', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> addPrescription(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/Doctor/AddPrescription', data: data);
    return _handleResponse(response);
  }

  Future<List<dynamic>> doctorGetRecent() async {
    final response = await _dio.get(K.doctorHomeUrl);
    return _handleListResponse(response);
  }

  // ===============================================================
  // PATIENT
  // ===============================================================

  Future<Map<String, dynamic>> initializePatientProfile(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/Patient/initialize-profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> editPatientProfile(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put('/Patient/profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getPatientProfile() async {
    final response = await _dio.get('/Patient/profile');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updatePatientProfile(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put('/Patient/profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> generateQr() async {
    final response = await _dio.post('/Patient/generate-qr', data: {});
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getPatientEmergencyScreen() async {
    final response = await _dio.get('/Patient/emergency-screen');
    return _handleResponse(response);
  }

  Future<List<dynamic>> getPatientMedicalRecords() async {
    final response = await _dio.get('/Patient/medical-records');
    return _handleListResponse(response);
  }

  Future<List<dynamic>> getPatientPrescriptions() async {
    final response = await _dio.get('/Patient/prescriptions');
    return _handleListResponse(response);
  }
  Future<Map<String,dynamic>> getPatientDashboardSummary() async {
    final response = await _dio.get('/Patient/dashboard-summary');
    return _handleResponse(response);
  }

  // ===============================================================
  // PHARMACIST
  // ===============================================================

  Future<Map<String, dynamic>> getPharmacistProfile() async {
    final response = await _dio.get('/Pharmacist/profile');

    // xlog(response.runtimeType);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updatePharmacistProfile(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put('/Pharmacist/profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> searchPrescription(String identifier) async {
    // xlog('ssssssssssssssss$identifier');
    final response = await _dio.get(
      '/Pharmacist/search-prescription?identifier=$identifier',
    );
    return response.data;
    // return _handleResponse(response);
  }

  Future<Map<String, dynamic>> checkDrugInteractions(int id) async {
    final response = await _dio.post('/Pharmacist/check-interactions/$id');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> dispensePrescription(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post(
      '/Pharmacist/dispense-prescription',
      data: data,
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> createPharmacistPrescription(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/Pharmacist/create', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updatePrescriptionStatus(
    int id,
    int status,
    String notes,
  ) async {
    final response = await _dio.post(
      '/Pharmacist/prescription-status',
      data: {"prescriptionId": id, "status": status, "notes": notes},
    );
    return _handleResponse(response);
  }

  // ===============================================================
  // ADMIN
  // ===============================================================

  Future<List<dynamic>> getPendingRegistrations() async {
    final response = await _dio.get('/Admin/pending-registrations');
    return _handleListResponse(response);
  }

  Future<Map<String, dynamic>> approveUser(int userId) async {
    final response = await _dio.post('/Admin/approve/$userId');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> rejectUser(int userId) async {
    final response = await _dio.post('/Admin/reject/$userId');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getUsers(Map<String, dynamic> filterData) async {
    final response = await _dio.post('/Admin/GetUsers', data: filterData);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updateUserStatus(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/Admin/user-status', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getAuditLogs(
    Map<String, dynamic> filterData,
  ) async {
    final response = await _dio.post('/Admin/audit-logs', data: filterData);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getStatistics() async {
    final response = await _dio.get('/Admin/statistics');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> sendNotification(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/Admin/send-notification', data: data);
    return _handleResponse(response);
  }
}
