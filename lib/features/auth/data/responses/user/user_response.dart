// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_response.freezed.dart';
import 'package:health_app/features/auth/data/responses/base/base_response.dart';
import 'package:health_app/features/auth/data/responses/register.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

// ================= AUTH RESPONSES =================

@JsonSerializable()
class LoginResponse extends BaseResponse {
  final String? accessToken;
  final String? role;
  final int? userId;

  LoginResponse({
    required super.success,
    super.message,
    this.accessToken,
    this.role,
    this.userId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final js = json;
    js['role'] = json['role'].toString().toLowerCase();
    //   .map((e) {
    //     // if (e.key == 'role') {
    //     //   return MapEntry(e.key, e.value.toString().toLowerCase());
    //     // }
    //     // return MapEntry(e.key, e.value);
    //   });
    return _$LoginResponseFromJson(js);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class PatientRegisterResponse extends BaseResponse {
  final RegisterData? data;

  PatientRegisterResponse({required super.success, super.message, this.data});

  factory PatientRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatientRegisterResponseToJson(this);
}

// Used for: Logout, Change Password, Simple Updates
@JsonSerializable()
class GeneralResponse extends BaseResponse {
  GeneralResponse({required super.success, super.message});

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseFromJson(json);


      
}

// ================= DOCTOR RESPONSES =================

@JsonSerializable()
class DoctorProfileResponse extends BaseResponse {
  final DoctorResponse? doctor;

  DoctorProfileResponse({required super.success, super.message, this.doctor});

  factory DoctorProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileResponseFromJson(json);
}

@JsonSerializable()
class SearchPatientResponse extends BaseResponse {
  final PatientResponse? patient;

  SearchPatientResponse({required super.success, super.message, this.patient});

  factory SearchPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPatientResponseFromJson(json);
}

@JsonSerializable()
class AddRecordResponse extends BaseResponse {
  final MedicalRecord? medicalRecord;

  AddRecordResponse({
    required super.success,
    super.message,
    this.medicalRecord,
  });

  factory AddRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$AddRecordResponseFromJson(json);
}

@JsonSerializable()
class AddPrescriptionResponse extends BaseResponse {
  final Prescription? prescription;

  AddPrescriptionResponse({
    required super.success,
    super.message,
    this.prescription,
  });

  factory AddPrescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPrescriptionResponseFromJson(json);
}

// ================= PATIENT RESPONSES =================

@JsonSerializable()
class PatientProfileResponse extends BaseResponse {
  final PatientResponse? patient;

  PatientProfileResponse({required super.success, super.message, this.patient});

  factory PatientProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientProfileResponseFromJson(json);
}

@JsonSerializable()
class QrResponse extends BaseResponse {
  final String? qrCodeUrl;
  final String? token;

  QrResponse({
    required super.success,
    super.message,
    this.qrCodeUrl,
    this.token,
  });

  factory QrResponse.fromJson(Map<String, dynamic> json) =>
      _$QrResponseFromJson(json);
}

@JsonSerializable()
class EmergencyScreenResponse extends BaseResponse {
  final EmergencyInfo? emergencyInfo;

  EmergencyScreenResponse({
    required super.success,
    super.message,
    this.emergencyInfo,
  });

  factory EmergencyScreenResponse.fromJson(Map<String, dynamic> json) =>
      _$EmergencyScreenResponseFromJson(json);
}

// ================= PHARMACIST RESPONSES =================

@JsonSerializable()
class PharmacistProfileResponse extends BaseResponse {
  final PharmacistResponse? pharmacist;

  PharmacistProfileResponse({
    required super.success,
    super.message,
    this.pharmacist,
  });

  factory PharmacistProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PharmacistProfileResponseFromJson(json);
}

@JsonSerializable()
class SearchPrescriptionResponse extends BaseResponse {
  final List<Prescription>? prescriptions;

  SearchPrescriptionResponse({
    required super.success,
    super.message,
    this.prescriptions,
  });

  factory SearchPrescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPrescriptionResponseFromJson(json);
}

@JsonSerializable()
class DrugInteractionResponse extends BaseResponse {
  final bool? hasInteractions;
  final List<dynamic>? warnings; // Can create specific model for warnings

  DrugInteractionResponse({
    required super.success,
    super.message,
    this.hasInteractions,
    this.warnings,
  });

  factory DrugInteractionResponse.fromJson(Map<String, dynamic> json) =>
      _$DrugInteractionResponseFromJson(json);
}

// ================= ADMIN RESPONSES =================

@JsonSerializable()
class AdminProfileResponse extends BaseResponse {
  final AdminResponse? admin;

  AdminProfileResponse({required super.success, super.message, this.admin});

  factory AdminProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProfileResponseFromJson(json);
}
