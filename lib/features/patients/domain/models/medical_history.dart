import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/foundation.dart';
import 'package:health_app/shared/ex.dart' show AppEx;

part 'medical_history.freezed.dart';
part 'medical_history.g.dart';

@freezed
abstract class MedicalHistory with _$MedicalHistory {
  const factory MedicalHistory({
    // Personal Information
    String? id,
    required String patientId,
    required String patientName,
    required DateTime dateOfBirth,
    required Gender gender,
    
    // Contact Information
    required String phoneNumber,
    String? email,
    required String address,
    
    // Emergency Contact
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? emergencyContactRelationship,
    
    // Vital Statistics
    required double height,
    required double weight,
    required BloodType bloodType,
    
    // Medical Conditions
    List<String>? chronicConditions,
    List<String>? allergies,
    List<String>? currentMedications,
    List<String>? pastMedications,
    
    // Surgical History
    List<Surgery>? surgeries,
    
    // Hospitalizations
    List<Hospitalization>? hospitalizations,
    
    // Family History
    Map<String, String>? familyMedicalHistory,
    
    // Lifestyle
    required bool isSmoker,
    required int cigarettesPerDay,
    required bool isAlcoholConsumer,
    required String alcoholFrequency,
    required bool usesRecreationalDrugs,
    String? recreationalDrugsDetails,
    
    // Exercise & Diet
    required String exerciseFrequency,
    required String dietaryPreferences,
    
    // Vaccination History
    List<Vaccination>? vaccinations,
    
    // Women's Health
    DateTime? lastMenstrualPeriod,
    bool? isPregnant,
    int? pregnancies,
    int? liveBirths,
    
    // Mental Health
    List<String>? mentalHealthConditions,
    String? currentTherapist,
    
    // Additional Notes
    String? additionalNotes,
    
    // Meta Information
    required DateTime lastUpdated,
    required DateTime createdAt,
    
  }) = _MedicalHistory;

  factory MedicalHistory.fromJson(Map<String, dynamic> json) =>
      _$MedicalHistoryFromJson(json);
}

@freezed
abstract class Surgery with _$Surgery {
  const factory Surgery({
    required String procedureName,
    required DateTime date,
    String? hospitalName,
    String? surgeonName,
    String? complications,
  }) = _Surgery;

  factory Surgery.fromJson(Map<String, dynamic> json) =>
      _$SurgeryFromJson(json);
}

@freezed
abstract class Hospitalization with _$Hospitalization {
  const factory Hospitalization({
    required DateTime admissionDate,
    required DateTime dischargeDate,
    required String reason,
    String? hospitalName,
    String? treatmentDetails,
  }) = _Hospitalization;

  factory Hospitalization.fromJson(Map<String, dynamic> json) =>
      _$HospitalizationFromJson(json);
}

@freezed
abstract class Vaccination with _$Vaccination {
  const factory Vaccination({
    required String vaccineName,
    required DateTime dateAdministered,
    DateTime? expirationDate,
    String? administeringFacility,
    String? lotNumber,
  }) = _Vaccination;

  factory Vaccination.fromJson(Map<String, dynamic> json) =>
      _$VaccinationFromJson(json);
}

enum Gender {
  male(1, 'Male', 'ذكر'),
  female(2, 'Female', 'أنثى');

  final int value;
  final String englishName;
  final String arabicName;

  const Gender(this.value, this.englishName, this.arabicName);

  String getDisplayName(BuildContext context) {
    return context.isArabic ? arabicName : englishName;
  }

  static Gender fromValue(int value) {
    return Gender.values.firstWhere((e) => e.value == value);
  }
}

enum BloodType {
  aPositive(1, 'A+', 'A+'),
  aNegative(2, 'A-', 'A-'),
  bPositive(3, 'B+', 'B+'),
  bNegative(4, 'B-', 'B-'),
  abPositive(5, 'AB+', 'AB+'),
  abNegative(6, 'AB-', 'AB-'),
  oPositive(7, 'O+', 'O+'),
  unknown(0,'n','n'),
  oNegative(8, 'O-', 'O-');

  final int value;
  final String symbol;
  final String arabicSymbol;

  const BloodType(this.value, this.symbol, this.arabicSymbol);

  String getDisplaySymbol(BuildContext context) {
    return context.isArabic ? arabicSymbol : symbol;
  }

  static BloodType fromValue(int value) {
    return BloodType.values.firstWhere((e) => e.value == value);
  }
}
// Removed displayName extension since we'll use localization