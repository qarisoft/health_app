// import 'package:flutter/foundation.dart';
import 'package:health_app/features/patients/domain/models/medical_history.dart';

class MedicalHistoryRepository {
  // Simulated database
  final Map<String, MedicalHistory> _medicalHistories = {};
  
  Future<MedicalHistory?> getMedicalHistory(String patientId) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate API call
    return _medicalHistories[patientId];
  }
  
  Future<void> saveMedicalHistory(MedicalHistory history) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate API call
    _medicalHistories[history.patientId] = history;
  }
  
  Future<List<MedicalHistory>> getAllMedicalHistories() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate API call
    return _medicalHistories.values.toList();
  }
  
  // Create a sample medical history for demonstration
  MedicalHistory createSampleHistory() {
    return MedicalHistory(
      id: '1',
      patientId: 'PAT001',
      patientName: 'John Doe',
      dateOfBirth: DateTime(1985, 5, 15),
      gender: Gender.male,
      phoneNumber: '+1 (555) 123-4567',
      email: 'john.doe@email.com',
      address: '123 Main St, Anytown, USA',
      emergencyContactName: 'Jane Doe',
      emergencyContactPhone: '+1 (555) 987-6543',
      emergencyContactRelationship: 'Spouse',
      height: 180.0,
      weight: 75.0,
      bloodType: BloodType.aNegative,
      chronicConditions: ['Hypertension', 'Type 2 Diabetes'],
      allergies: ['Penicillin', 'Peanuts'],
      currentMedications: ['Lisinopril 10mg', 'Metformin 500mg'],
      pastMedications: ['Amlodipine 5mg'],
      surgeries: [
        Surgery(
          procedureName: 'Appendectomy',
          date: DateTime(2010, 3, 15),
          hospitalName: 'General Hospital',
          surgeonName: 'Dr. Smith',
        ),
      ],
      hospitalizations: [
        Hospitalization(
          admissionDate: DateTime(2020, 1, 10),
          dischargeDate: DateTime(2020, 1, 15),
          reason: 'Pneumonia',
          hospitalName: 'City Medical Center',
        ),
      ],
      familyMedicalHistory: {
        'Father': 'Heart Disease',
        'Mother': 'Breast Cancer',
        'Grandfather': 'Alzheimer\'s',
      },
      isSmoker: false,
      cigarettesPerDay: 0,
      isAlcoholConsumer: true,
      alcoholFrequency: '2-3 times per week',
      usesRecreationalDrugs: false,
      recreationalDrugsDetails: null,
      exerciseFrequency: '3 times per week',
      dietaryPreferences: 'Vegetarian',
      vaccinations: [
        Vaccination(
          vaccineName: 'COVID-19 Pfizer',
          dateAdministered: DateTime(2021, 3, 15),
          expirationDate: DateTime(2022, 3, 15),
        ),
        Vaccination(
          vaccineName: 'Influenza',
          dateAdministered: DateTime(2023, 10, 1),
        ),
      ],
      lastMenstrualPeriod: null,
      isPregnant: null,
      pregnancies: null,
      liveBirths: null,
      mentalHealthConditions: ['Anxiety'],
      currentTherapist: 'Dr. Johnson',
      additionalNotes: 'Patient prefers morning appointments.',
      lastUpdated: DateTime.now(),
      createdAt: DateTime(2020, 1, 1),
    );
  }
}