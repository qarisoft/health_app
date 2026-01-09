// import 'package:health_app/features/auth/domain/models/patient.dart'
// show Patient;
import 'package:health_app/features/auth/data/responses/base/base_response.dart';
import 'package:health_app/features/doctor/domain/patient.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'models.g.dart';
part 'register.g.dart';
// --- Shared Data Models ---

@JsonSerializable()
class RegisterData {
  final String? patientCode;
  final int? userId;

  RegisterData({this.patientCode, this.userId});
  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}

@JsonSerializable()
class DoctorResponse extends Profile {
  final String? specialization;
  final String? hospital;

  DoctorResponse({
    super.id,
    super.userId,
    super.fullName,
    super.phoneNumber,
    super.email,
    super.createdAt,
    super.updatedAt,
    this.specialization,
    this.hospital,
  });
  factory DoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PatientResponse extends Profile {
  // final List<MedicalRecord>? medicalRecords;
  // final List<Prescription>? prescriptions;
  final String dateOfBirth;
  final int gender;
  final String address;
  final int bloodType;
  final int weight;
  final int height;
  final String emergencyContact;
  final String emergencyPhone;

  PatientResponse({
    super.id,
    super.userId,
    super.fullName,
    super.phoneNumber,
    super.email,
    super.createdAt,
    super.updatedAt,
    this.gender = 1,
    this.bloodType = 1,
    this.weight = 1,
    this.height = 1,
    this.emergencyContact = 'null',
    this.dateOfBirth = 'null',
    this.address = 'null',
    this.emergencyPhone = 'null',
  });
  factory PatientResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PatientResponseToJson(this);
}

@JsonSerializable()
class PharmacistResponse extends Profile {
  final String pharmacyName;

  PharmacistResponse({
    super.id,

    super.userId,
    super.fullName,
    super.phoneNumber,
    super.email,
    super.createdAt,
    super.updatedAt,
    this.pharmacyName = 'null',
  });
  factory PharmacistResponse.fromJson(Map<String, dynamic> json) =>
      _$PharmacistResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacistResponseToJson(this);
}

@JsonSerializable()
class AdminResponse extends Profile {
  AdminResponse({
    super.id,

    super.userId,
    super.fullName,
    super.phoneNumber,
    super.email,
    super.createdAt,
    super.updatedAt,
  });
  factory AdminResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AdminResponseToJson(this);
}

@JsonSerializable()
class MedicalRecord {
  final int? id;
  final String? diagnosis;
  final String? notes;
  final String? doctorName;

  MedicalRecord({this.id, this.diagnosis, this.notes, this.doctorName});
  factory MedicalRecord.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalRecordToJson(this);
}

@JsonSerializable()
class Prescription {
  final int? id;
  final String? diagnosis;
  final int? status;
  final List<PrescriptionItem>? items;

  Prescription({this.id, this.diagnosis, this.status, this.items});
  factory Prescription.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$PrescriptionToJson(this);
}

@JsonSerializable()
class PrescriptionItem {
  final String? medicationName;
  final String? dosage;
  final bool? isDispensed;

  PrescriptionItem({this.medicationName, this.dosage, this.isDispensed});
  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
  Map<String, dynamic> toJson() => _$PrescriptionItemToJson(this);
}

@JsonSerializable()
class EmergencyInfo {
  final String? fullName;
  final String? bloodType;
  final String? qrCodeUrl;

  EmergencyInfo({this.fullName, this.bloodType, this.qrCodeUrl});
  factory EmergencyInfo.fromJson(Map<String, dynamic> json) =>
      _$EmergencyInfoFromJson(json);
  Map<String, dynamic> toJson() => _$EmergencyInfoToJson(this);
}
