import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/shared/api/dio_factory.dart';
import 'package:health_app/shared/ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;


  // Helper method to handle responses
  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data; // This returns the JSON Map
    } else {
      throw Exception('Server Error: ${response.statusCode}');
    }
  }

  // ===============================================================
  // AUTHENTICATION
  // ===============================================================

  Future<Map<String, dynamic>> registerPatient(Map<String, dynamic> data) async {
    final response = await _dio.post('/Auth/register/patient', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> registerDoctor(Map<String, dynamic> data) async {
    final response = await _dio.post('/Auth/register/doctor', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> registerPharmacist(Map<String, dynamic> data) async {
    final response = await _dio.post('/Auth/register/pharmacist', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> login(String identifier, String password) async {
    final response = await _dio.post('/Auth/login', data: {
      "identifier": identifier,
      "password": password,
      "deviceToken": "dummy_token_or_fcm", // Update as needed
      "devicePlatform": Platform.operatingSystem
    });
    // final res = LoginResponse.fromJson(response.data);


    // if (res.success) {
    //   // Save Token automatically
    //   final prefs = await SharedPreferences.getInstance();
    //   await prefs.setString('accessToken', response.data['accessToken']);
    //   await prefs.setInt('userId', response.data['userId']);
    //   await prefs.setString('role', response.data['role']);
    // }
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> logout() async {
    final response = await _dio.post('/Auth/logout'); // No body
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear local data
    return _handleResponse(response);
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

  Future<Map<String, dynamic>> updateDoctorProfile(Map<String, dynamic> data) async {
    final response = await _dio.put('/Doctor/profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> searchPatient(String identifier) async {
    final response = await _dio.post('/Doctor/search-patient', data: {
      "identifier": identifier
    });
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> addMedicalRecord(Map<String, dynamic> data) async {
    final response = await _dio.post('/Doctor/medical-record', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> addPrescription(Map<String, dynamic> data) async {
    final response = await _dio.post('/Doctor/AddPrescription', data: data);
    return _handleResponse(response);
  }

  // ===============================================================
  // PATIENT
  // ===============================================================

  Future<Map<String, dynamic>> initializePatientProfile(Map<String, dynamic> data) async {
    final response = await _dio.post('/Patient/initialize-profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getPatientProfile() async {
    final response = await _dio.get('/Patient/profile');

    // response.log('response sssssssssss');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updatePatientProfile(Map<String, dynamic> data) async {
    final response = await _dio.put('/Patient/profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> generateQr() async {
    // Assuming POST since it generates data, empty body if required
    final response = await _dio.post('/Patient/generate-qr', data: {}); 
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getEmergencyScreen() async {
    final response = await _dio.post('/Patient/emergency-screen', data: {});
    return _handleResponse(response);
  }

  Future<List<dynamic>> getPatientMedicalRecords() async {
    final response = await _dio.get('/Patient/medical-records'); // Note: Returns List
    return response.data; 
  }

  Future<List<dynamic>> getPatientPrescriptions() async {
    final response = await _dio.get('/Patient/prescriptions'); // Note: Returns List
    return response.data;
  }

  // ===============================================================
  // PHARMACIST
  // ===============================================================

  Future<Map<String, dynamic>> getPharmacistProfile() async {
    final response = await _dio.get('/Pharmacist/profile');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updatePharmacistProfile(Map<String, dynamic> data) async {
    final response = await _dio.put('/Pharmacist/profile', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> searchPrescription(String identifier) async {
    final response = await _dio.post('/Pharmacist/search-prescription', data: {
      "identifier": identifier
    });
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> checkDrugInteractions(Map<String, dynamic> data) async {
    final response = await _dio.post('/Pharmacist/check-drug-interactions', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> dispensePrescription(Map<String, dynamic> data) async {
    final response = await _dio.post('/Pharmacist/dispense-prescription', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> createPharmacistPrescription(Map<String, dynamic> data) async {
    final response = await _dio.post('/Pharmacist/create', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updatePrescriptionStatus(int id, int status, String notes) async {
    final response = await _dio.post('/Pharmacist/prescription-status', data: {
      "prescriptionId": id,
      "status": status,
      "notes": notes
    });
    return _handleResponse(response);
  }

  // ===============================================================
  // ADMIN
  // ===============================================================

  Future<List<dynamic>> getPendingRegistrations() async {
    final response = await _dio.get('/Admin/pending-registrations');
    return response.data;
  }

  Future<String> approveUser(int userId) async {
    final response = await _dio.post('/Admin/approve/$userId');
    return response.data.toString();
  }

  Future<String> rejectUser(int userId) async {
    final response = await _dio.post('/Admin/reject/$userId');
    return response.data.toString();
  }

  Future<Map<String, dynamic>> getUsers(Map<String, dynamic> filterData) async {
    final response = await _dio.post('/Admin/GetUsers', data: filterData);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updateUserStatus(Map<String, dynamic> data) async {
    final response = await _dio.post('/Admin/user-status', data: data);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getAuditLogs(Map<String, dynamic> filterData) async {
    final response = await _dio.post('/Admin/audit-logs', data: filterData);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getStatistics() async {
    final response = await _dio.get('/Admin/statistics');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> sendNotification(Map<String, dynamic> data) async {
    final response = await _dio.post('/Admin/send-notification', data: data);
    return _handleResponse(response);
  }
}