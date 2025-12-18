// import 'package:flutter/foundation.dart';
import '../../domain/patient.dart' show Patient;
// import '../models/patient.dart';

class PatientRepository {
  final List<Patient> _patients = [];
  
  // Create
  Future<Patient> createPatient(Patient patient) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _patients.add(patient);
    return patient;
  }
  
  // Read
  Future<List<Patient>> getAllPatients() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_patients);
  }
  
  Future<Patient?> getPatientById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _patients.firstWhere((p) => p.id == id);
  }
  
  // Update
  Future<Patient> updatePatient(Patient updatedPatient) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _patients.indexWhere((p) => p.id == updatedPatient.id);
    if (index != -1) {
      _patients[index] = updatedPatient;
    }
    return updatedPatient;
  }
  
  // Delete
  Future<bool> deletePatient(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _patients.indexWhere((p) => p.id == id);
    if (index != -1) {
      _patients.removeAt(index);
      return true;
    }
    return false;
  }
  
  // Search
  Future<List<Patient>> searchPatients(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return getAllPatients();
    
    return _patients.where((patient) {
      return patient.name.toLowerCase().contains(query.toLowerCase()) ||
             patient.phoneNumber.contains(query) ||
             patient.nationalId.contains(query);
    }).toList();
  }
  
  // Initialize with sample data
  Future<void> initializeWithSampleData() async {
    final samplePatients = [
      Patient(
        id: '1',
        name: 'أحمد محمد',
        phoneNumber: '0501234567',
        nationalId: '1234567890',
        dateOfBirth: DateTime(1990, 5, 15),
        email: 'ahmed@example.com',
        address: 'الرياض، السعودية',
        emergencyContact: '0509876543',
        bloodType: 'O+',
        gender: 'male',
        notes: 'مريض سكري',
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Patient(
        id: '2',
        name: 'فاطمة علي',
        phoneNumber: '0551234567',
        nationalId: '0987654321',
        dateOfBirth: DateTime(1985, 8, 22),
        email: 'fatima@example.com',
        address: 'جدة، السعودية',
        emergencyContact: '0559876543',
        bloodType: 'A+',
        gender: 'female',
        notes: 'تحت المراقبة',
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Patient(
        id: '3',
        name: 'خالد سعيد',
        phoneNumber: '0561234567',
        nationalId: '1122334455',
        dateOfBirth: DateTime(1978, 3, 10),
        email: 'khaled@example.com',
        address: 'الدمام، السعودية',
        emergencyContact: '0569876543',
        bloodType: 'B+',
        gender: 'male',
        notes: 'ضغط مرتفع',
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
    
    _patients.addAll(samplePatients);
  }
}