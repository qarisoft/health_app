// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
  patientCode: json['patientCode'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
);

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'patientCode': instance.patientCode,
      'userId': instance.userId,
    };

DoctorResponse _$DoctorResponseFromJson(Map<String, dynamic> json) =>
    DoctorResponse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? 'null',
      phoneNumber: json['phoneNumber'] as String? ?? 'null',
      email: json['email'] as String? ?? 'null',
      createdAt: json['createdAt'] as String? ?? 'null',
      updatedAt: json['updatedAt'] as String? ?? 'null',
      specialization: json['specialization'] as String?,
      hospital: json['hospital'] as String?,
    );

Map<String, dynamic> _$DoctorResponseToJson(DoctorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'specialization': instance.specialization,
      'hospital': instance.hospital,
    };

PatientResponse _$PatientResponseFromJson(Map<String, dynamic> json) =>
    PatientResponse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? 'null',
      phoneNumber: json['phoneNumber'] as String? ?? 'null',
      email: json['email'] as String? ?? 'null',
      createdAt: json['createdAt'] as String? ?? 'null',
      updatedAt: json['updatedAt'] as String? ?? 'null',
      gender: (json['gender'] as num?)?.toInt() ?? 1,
      bloodType: (json['bloodType'] as num?)?.toInt() ?? 1,
      weight: (json['weight'] as num?)?.toInt() ?? 1,
      height: (json['height'] as num?)?.toInt() ?? 1,
      emergencyContact: json['emergencyContact'] as String? ?? 'null',
      dateOfBirth: json['dateOfBirth'] as String? ?? 'null',
      address: json['address'] as String? ?? 'null',
      emergencyPhone: json['emergencyPhone'] as String? ?? 'null',
    );

Map<String, dynamic> _$PatientResponseToJson(PatientResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'address': instance.address,
      'bloodType': instance.bloodType,
      'weight': instance.weight,
      'height': instance.height,
      'emergencyContact': instance.emergencyContact,
      'emergencyPhone': instance.emergencyPhone,
    };

PharmacistResponse _$PharmacistResponseFromJson(Map<String, dynamic> json) =>
    PharmacistResponse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? 'null',
      phoneNumber: json['phoneNumber'] as String? ?? 'null',
      email: json['email'] as String? ?? 'null',
      createdAt: json['createdAt'] as String? ?? 'null',
      updatedAt: json['updatedAt'] as String? ?? 'null',
      pharmacyName: json['pharmacyName'] as String? ?? 'null',
    );

Map<String, dynamic> _$PharmacistResponseToJson(PharmacistResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'pharmacyName': instance.pharmacyName,
    };

AdminResponse _$AdminResponseFromJson(Map<String, dynamic> json) =>
    AdminResponse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? 'null',
      phoneNumber: json['phoneNumber'] as String? ?? 'null',
      email: json['email'] as String? ?? 'null',
      createdAt: json['createdAt'] as String? ?? 'null',
      updatedAt: json['updatedAt'] as String? ?? 'null',
    );

Map<String, dynamic> _$AdminResponseToJson(AdminResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) =>
    MedicalRecord(
      id: (json['id'] as num?)?.toInt(),
      diagnosis: json['diagnosis'] as String?,
      notes: json['notes'] as String?,
      doctorName: json['doctorName'] as String?,
    );

Map<String, dynamic> _$MedicalRecordToJson(MedicalRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'diagnosis': instance.diagnosis,
      'notes': instance.notes,
      'doctorName': instance.doctorName,
    };

Prescription _$PrescriptionFromJson(Map<String, dynamic> json) => Prescription(
  id: (json['id'] as num?)?.toInt(),
  diagnosis: json['diagnosis'] as String?,
  status: (json['status'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => PrescriptionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PrescriptionToJson(Prescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'diagnosis': instance.diagnosis,
      'status': instance.status,
      'items': instance.items,
    };

PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) =>
    PrescriptionItem(
      medicationName: json['medicationName'] as String?,
      dosage: json['dosage'] as String?,
      isDispensed: json['isDispensed'] as bool?,
    );

Map<String, dynamic> _$PrescriptionItemToJson(PrescriptionItem instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'dosage': instance.dosage,
      'isDispensed': instance.isDispensed,
    };

EmergencyInfo _$EmergencyInfoFromJson(Map<String, dynamic> json) =>
    EmergencyInfo(
      fullName: json['fullName'] as String?,
      bloodType: json['bloodType'] as String?,
      qrCodeUrl: json['qrCodeUrl'] as String?,
    );

Map<String, dynamic> _$EmergencyInfoToJson(EmergencyInfo instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'bloodType': instance.bloodType,
      'qrCodeUrl': instance.qrCodeUrl,
    };
