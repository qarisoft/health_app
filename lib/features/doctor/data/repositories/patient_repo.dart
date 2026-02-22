// import 'package:flutter/foundation.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/features/doctor/data/requests/home.dart';
import 'package:health_app/shared/api/api_repositories.dart';

import '../../domain/patient.dart' show Patient;
// import '../models/patient.dart';

class PatientRepository {
  final List<RecentPatient> _patients = [];

  // Create
  Future<RecentPatient> createPatient(RecentPatient patient) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // _patients.add(patient);
    return patient;
  }

  // Read
  Future<List<RecentPatient>> getAllPatients() async {
    // final a = await di<AppRepositories>().doctorGetRecent();
    final dio = di<AppRepositories>().getDio();
    final res = await dio.get(K.doctorHomeUrl);
    // final res2 = HomeResponse.fromJson(res.data);
    final data = res.data as List<dynamic>;
    // HomeResponse.fromJson(data);

    // if (data) {

    // }

    final a = data.map((a) => RecentPatient.fromJson(a)).toList();
    //         as List<RecentPatient>;
    xlog(a.runtimeType);
    if (a.runtimeType == List<RecentPatient>) {
      return a;
    }
    xlog('dsasdasdasdas');
    return [];
    // return a.when(success: (s) => s, error: (e) => []);
    // return a.data;

    // await Future.delayed(const Duration(milliseconds: 500));
    // return List.from(_patients);
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
      // patient.nationalId.contains(query);
    }).toList();
  }

  // Initialize with sample data
  Future<void> initializeWithSampleData() async {
    final a = await getAllPatients();
    // _patients.addAll(a);
    xlog(a);

    // _patients.addAll(samplePatients);
  }
}
