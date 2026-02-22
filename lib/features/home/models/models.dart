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

  factory Surgery.fromJson(Map<String, dynamic> json) =>
      _$SurgeryFromJson(json);
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


    // @Default('') String fullName,
    // @Default('') String dateOfBirth,
    // @Default(1) int gender,
    // @Default('') String phoneNumber,
    // @Default('') String email,
    // @Default('') String address,
    // @Default(1) int bloodType,
    // @Default(0.0) double weight,
    // @Default(0.0) double height,
    // @Default('') String emergencyContact,
    // @Default('') String emergencyPhone,


    //  {
    //      "success": true,
    //      "message": "تم جلب ملف المريض بنجاح",
    //      "patient": {
    //          "id": 3132,
    //          "userId": 3132,
    //          "fullName": "name",
    //          "dateOfBirth": "2006-01-08T00:00:00",
    //          "gender": 0,
    //          "phoneNumber": "123456789",
    //          "email": "emaidsadsa@dsad.dsa",
    //          "address": null,
    //          "bloodType": null,
    //          "weight": null,
    //          "height": null,
    //          "emergencyContact": null,
    //          "emergencyPhone": null,
    //          "createdAt": "2026-02-22T01:40:32.2608079",
    //          "updatedAt": null
    //     }
    // }