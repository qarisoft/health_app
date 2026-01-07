// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      accessToken: json['accessToken'] as String?,
      role: json['role'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'role': instance.role,
      'userId': instance.userId,
    };

PatientRegisterResponse _$PatientRegisterResponseFromJson(
  Map<String, dynamic> json,
) => PatientRegisterResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : RegisterData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PatientRegisterResponseToJson(
  PatientRegisterResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

GeneralResponse _$GeneralResponseFromJson(Map<String, dynamic> json) =>
    GeneralResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GeneralResponseToJson(GeneralResponse instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};

DoctorProfileResponse _$DoctorProfileResponseFromJson(
  Map<String, dynamic> json,
) => DoctorProfileResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  doctor: json['doctor'] == null
      ? null
      : DoctorResponse.fromJson(json['doctor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DoctorProfileResponseToJson(
  DoctorProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'doctor': instance.doctor,
};

SearchPatientResponse _$SearchPatientResponseFromJson(
  Map<String, dynamic> json,
) => SearchPatientResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  patient: json['patient'] == null
      ? null
      : PatientResponse.fromJson(json['patient'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SearchPatientResponseToJson(
  SearchPatientResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'patient': instance.patient,
};

AddRecordResponse _$AddRecordResponseFromJson(Map<String, dynamic> json) =>
    AddRecordResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      medicalRecord: json['medicalRecord'] == null
          ? null
          : MedicalRecord.fromJson(
              json['medicalRecord'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AddRecordResponseToJson(AddRecordResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'medicalRecord': instance.medicalRecord,
    };

AddPrescriptionResponse _$AddPrescriptionResponseFromJson(
  Map<String, dynamic> json,
) => AddPrescriptionResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  prescription: json['prescription'] == null
      ? null
      : Prescription.fromJson(json['prescription'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddPrescriptionResponseToJson(
  AddPrescriptionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'prescription': instance.prescription,
};

PatientProfileResponse _$PatientProfileResponseFromJson(
  Map<String, dynamic> json,
) => PatientProfileResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  patient: json['patient'] == null
      ? null
      : PatientResponse.fromJson(json['patient'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PatientProfileResponseToJson(
  PatientProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'patient': instance.patient,
};

QrResponse _$QrResponseFromJson(Map<String, dynamic> json) => QrResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  qrCodeUrl: json['qrCodeUrl'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$QrResponseToJson(QrResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'qrCodeUrl': instance.qrCodeUrl,
      'token': instance.token,
    };

EmergencyScreenResponse _$EmergencyScreenResponseFromJson(
  Map<String, dynamic> json,
) => EmergencyScreenResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  emergencyInfo: json['emergencyInfo'] == null
      ? null
      : EmergencyInfo.fromJson(json['emergencyInfo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EmergencyScreenResponseToJson(
  EmergencyScreenResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'emergencyInfo': instance.emergencyInfo,
};

PharmacistProfileResponse _$PharmacistProfileResponseFromJson(
  Map<String, dynamic> json,
) => PharmacistProfileResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  pharmacist: json['pharmacist'] == null
      ? null
      : PharmacistResponse.fromJson(json['pharmacist'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PharmacistProfileResponseToJson(
  PharmacistProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'pharmacist': instance.pharmacist,
};

SearchPrescriptionResponse _$SearchPrescriptionResponseFromJson(
  Map<String, dynamic> json,
) => SearchPrescriptionResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  prescriptions: (json['prescriptions'] as List<dynamic>?)
      ?.map((e) => Prescription.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SearchPrescriptionResponseToJson(
  SearchPrescriptionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'prescriptions': instance.prescriptions,
};

DrugInteractionResponse _$DrugInteractionResponseFromJson(
  Map<String, dynamic> json,
) => DrugInteractionResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  hasInteractions: json['hasInteractions'] as bool?,
  warnings: json['warnings'] as List<dynamic>?,
);

Map<String, dynamic> _$DrugInteractionResponseToJson(
  DrugInteractionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'hasInteractions': instance.hasInteractions,
  'warnings': instance.warnings,
};

AdminProfileResponse _$AdminProfileResponseFromJson(
  Map<String, dynamic> json,
) => AdminProfileResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  admin: json['admin'] == null
      ? null
      : AdminResponse.fromJson(json['admin'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminProfileResponseToJson(
  AdminProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'admin': instance.admin,
};
