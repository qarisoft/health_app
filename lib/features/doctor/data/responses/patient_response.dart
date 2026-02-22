import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_response.freezed.dart';
part 'patient_response.g.dart';

@freezed
abstract class PatientResponse with _$PatientResponse {
  const factory PatientResponse({
    @Default(false) bool success,
    @Default('') String message,
    Patient? patient,
  }) = _PatientResponse;

  factory PatientResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientResponseFromJson(json);
}

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    required int id,
    @Default('') String fullName,
    DateTime? dateOfBirth,
    @Default(0) int gender,
    @Default(0) int bloodType,
    @Default(10) double weight,
    @Default(10) double height,
    String? emergencyContact,
    String? emergencyPhone,
    String? patientCode,
    @Default([]) List<Allergy> allergies,
    @Default([]) List<ChronicDisease> chronicDiseases,
    @Default([]) List<Surgery> surgeries,
    @Default([]) List<MedicalRecord> medicalRecords,
    @Default([]) List<Prescription> prescriptions,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

@freezed
abstract class Allergy with _$Allergy {
  const factory Allergy({
    @Default(0) int id,
    @Default(0) int patientId,
    @Default('') String allergenName,
    @Default('') String reaction,
    @Default('') String severity,
    DateTime? createdAt,
  }) = _Allergy;

  factory Allergy.fromJson(Map<String, dynamic> json) =>
      _$AllergyFromJson(json);
}

@freezed
abstract class ChronicDisease with _$ChronicDisease {
  const factory ChronicDisease({
    @Default(0) int id,
    @Default(0) int patientId,
    @Default('') String diseaseName,
    @Default('') String description,
    DateTime? diagnosisDate,
    DateTime? createdAt,
  }) = _ChronicDisease;

  factory ChronicDisease.fromJson(Map<String, dynamic> json) =>
      _$ChronicDiseaseFromJson(json);
}

@freezed
abstract class Surgery with _$Surgery {
  const factory Surgery({
    @Default(0) int id,
    @Default(0) int patientId,
    @Default('') String surgeryName,
    @Default('') String description,
    @Default('') String hospital,
    @Default('') String surgeon,
    DateTime? surgeryDate,
    DateTime? createdAt,
  }) = _Surgery;

  factory Surgery.fromJson(Map<String, dynamic> json) =>
      _$SurgeryFromJson(json);
}

@freezed
abstract class MedicalRecord with _$MedicalRecord {
  const factory MedicalRecord({
    required int id,
    required int patientId,
    int? doctorId,
    @Default('') String diagnosis,
    @Default('') String notes,
    String? symptoms,
    String? treatment,
    DateTime? recordDate,
    DateTime? createdAt,
    @Default('') String doctorName,
    @Default('') String patientName,
  }) = _MedicalRecord;

  factory MedicalRecord.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordFromJson(json);
}

@freezed
abstract class Prescription with _$Prescription {
  const factory Prescription({
    @Default(0) int id,
    @Default(0) int patientId,
    @Default(0) int doctorId,
    @Default('') String diagnosis,
    String? notes,
    required int status,
    DateTime? prescriptionDate,
    DateTime? createdAt,
    @Default('') String doctorName,
    @Default('') String patientName,
    @Default([]) List<PrescriptionItem> items,
  }) = _Prescription;

  factory Prescription.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionFromJson(json);
}

@freezed
abstract class PrescriptionItem with _$PrescriptionItem {
  const factory PrescriptionItem({
    @Default(0) int id,
    @Default(0) int prescriptionId,
    @Default(0) int drugId,
    @Default('') String medicationName,
    @Default('') String dosage,
    @Default('') String frequency,
    @Default('') String duration,
    @Default('') String instructions,
    @Default(0) int quantity,
    @Default(false) bool isDispensed,
    DateTime? createdAt,
  }) = _PrescriptionItem;

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
}
