import 'package:freezed_annotation/freezed_annotation.dart';
part 'models.freezed.dart';
part 'models.g.dart';
// part 'patient_profile.freezed.dart';
// part 'patient_profile.g.dart';

@freezed
abstract class Allergy with _$Allergy {
  factory Allergy({
    @Default('') String allergenName,
    @Default('') String reaction,
    @Default('') String severity,
  }) = _Allergy;

  factory Allergy.fromJson(Map<String, dynamic> json) =>
      _$AllergyFromJson(json);
}

@freezed
abstract class ChronicDisease with _$ChronicDisease {
  factory ChronicDisease({
    @Default('') String diseaseName,
    @Default('') String description,
    @Default('') String diagnosisDate,
  }) = _ChronicDisease;

  factory ChronicDisease.fromJson(Map<String, dynamic> json) =>
      _$ChronicDiseaseFromJson(json);
}

@freezed
abstract class Surgery with _$Surgery {
  factory Surgery({
    @Default('') String surgeryName,
    @Default('') String description,
    @Default('') String surgeryDate,
    @Default('') String hospital,
    @Default('') String surgeon,
  }) = _Surgery;

  factory Surgery.fromJson(Map<String, dynamic> json) => _$SurgeryFromJson(json);
}

@freezed
abstract class CurrentMedication with _$CurrentMedication {
  factory CurrentMedication({
    @Default('') String medicationName,
    @Default('') String dosage,
    @Default('') String frequency,
    @Default('') String duration,
    @Default('') String instructions,
  }) = _CurrentMedication;

  factory CurrentMedication.fromJson(Map<String, dynamic> json) =>
      _$CurrentMedicationFromJson(json);
}

@freezed
abstract class PatientProfile with _$PatientProfile {
  const factory PatientProfile({
    @Default('') String fullName,
    @Default('') String dateOfBirth,
    @Default(1) int gender,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String address,
    @Default(1) int bloodType,
    @Default(0.0) double weight,
    @Default(0.0) double height,
    @Default('') String emergencyContact,
    @Default('') String emergencyPhone,
    @Default([]) List<Allergy> allergies,
    @Default([]) List<ChronicDisease> chronicDiseases,
    @Default([]) List<Surgery> surgeries,
    @Default([]) List<CurrentMedication> currentMedications,
    @Default('') String notes,
  }) = _PatientProfile;

  factory PatientProfile.fromJson(Map<String, dynamic> json) =>
      _$PatientProfileFromJson(json);
}