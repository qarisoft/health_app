// import 'package:flutter/foundation.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/di.dart' show getDio;
import 'package:health_app/features/doctor/data/requests/home.dart';
// import '../models/patient.dart';

class PatientRepository {
  final List<RecentPatient> _patients = [];

  // Create
  Future<RecentPatient> createPatient(RecentPatient patient) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return patient;
  }

  // Read
  Future<List<RecentPatient>> getAllPatients() async {
    final dio = getDio;
    final res = await dio.get(K.doctorHomeUrl);
    final data = res.data as List<dynamic>;
    final a = data.map((a) => RecentPatient.fromJson(a)).toList();
    if (a.runtimeType == List<RecentPatient>) {
      return a;
    }
    return [];
  }

  Future<RecentPatient?> getPatientById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _patients.firstWhere((p) => p.patientId == id);
  }

  // Update
  Future<RecentPatient> updatePatient(RecentPatient updatedPatient) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _patients.indexWhere(
      (p) => p.patientId == updatedPatient.patientId,
    );
    if (index != -1) {
      _patients[index] = updatedPatient;
    }
    return updatedPatient;
  }

  // Delete
  Future<bool> deletePatient(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _patients.indexWhere((p) => p.patientId == id);
    if (index != -1) {
      _patients.removeAt(index);
      return true;
    }
    return false;
  }

  // Search
  Future<List<RecentPatient>> searchPatients(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return getAllPatients();

    return _patients.where((patient) {
      return patient.fullName.toLowerCase().contains(query.toLowerCase()) ||
          patient.patientCode.contains(query);
    }).toList();
  }

  // Initialize with sample data
  Future<void> initializeWithSampleData() async {
    await getAllPatients();
  }
}
