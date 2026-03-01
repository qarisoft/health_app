// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Patient _$PatientFromJson(Map<String, dynamic> json) => _Patient(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userId: (json['userId'] as num?)?.toInt() ?? 0,
  fullName: json['fullName'] as String? ?? '',
  dateOfBirth: json['dateOfBirth'] as String? ?? '',
  gender: (json['gender'] as num?)?.toInt() ?? 1,
  phoneNumber: json['phoneNumber'] as String? ?? '',
  email: json['email'] as String? ?? '',
  address: json['address'] as String? ?? '',
  bloodType: (json['bloodType'] as num?)?.toInt() ?? 1,
  weight: (json['weight'] as num?)?.toInt() ?? 1,
  height: (json['height'] as num?)?.toInt() ?? 1,
  emergencyContact: json['emergencyContact'] as String? ?? '',
  emergencyPhone: json['emergencyPhone'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
  updatedAt: json['updatedAt'] as String? ?? '',
);

Map<String, dynamic> _$PatientToJson(_Patient instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth,
  'gender': instance.gender,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'address': instance.address,
  'bloodType': instance.bloodType,
  'weight': instance.weight,
  'height': instance.height,
  'emergencyContact': instance.emergencyContact,
  'emergencyPhone': instance.emergencyPhone,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_Doctor _$DoctorFromJson(Map<String, dynamic> json) => _Doctor(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userId: (json['userId'] as num?)?.toInt() ?? 0,
  fullName: json['fullName'] as String? ?? '',
  specialization: json['specialization'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String? ?? '',
  email: json['email'] as String? ?? '',
  licenseNumber: json['licenseNumber'] as String? ?? '',
  hospital: json['hospital'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
  updatedAt: json['updatedAt'] as String? ?? '',
);

Map<String, dynamic> _$DoctorToJson(_Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'fullName': instance.fullName,
  'specialization': instance.specialization,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'licenseNumber': instance.licenseNumber,
  'hospital': instance.hospital,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_Pharmacist _$PharmacistFromJson(Map<String, dynamic> json) => _Pharmacist(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userId: (json['userId'] as num?)?.toInt() ?? 0,
  fullName: json['fullName'] as String? ?? '-',
  phoneNumber: json['phoneNumber'] as String? ?? '-',
  email: json['email'] as String? ?? '-',
  pharmacyName: json['pharmacyName'] as String? ?? '-',
  licenseNumber: json['licenseNumber'] as String? ?? '-',
  createdAt: json['createdAt'] as String? ?? '-',
  updatedAt: json['updatedAt'] as String? ?? '-',
);

Map<String, dynamic> _$PharmacistToJson(_Pharmacist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'pharmacyName': instance.pharmacyName,
      'licenseNumber': instance.licenseNumber,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_Admin _$AdminFromJson(Map<String, dynamic> json) => _Admin(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userId: (json['userId'] as num?)?.toInt() ?? 0,
  fullName: json['fullName'] as String? ?? '',
  dateOfBirth: json['dateOfBirth'] as String? ?? '',
  gender: (json['gender'] as num?)?.toInt() ?? 1,
  phoneNumber: json['phoneNumber'] as String? ?? '',
  email: json['email'] as String? ?? '',
  address: json['address'] as String? ?? '',
  bloodType: (json['bloodType'] as num?)?.toInt() ?? 1,
  weight: (json['weight'] as num?)?.toInt() ?? 1,
  height: (json['height'] as num?)?.toInt() ?? 1,
  emergencyContact: json['emergencyContact'] as String? ?? '',
  emergencyPhone: json['emergencyPhone'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
  updatedAt: json['updatedAt'] as String? ?? '',
);

Map<String, dynamic> _$AdminToJson(_Admin instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth,
  'gender': instance.gender,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'address': instance.address,
  'bloodType': instance.bloodType,
  'weight': instance.weight,
  'height': instance.height,
  'emergencyContact': instance.emergencyContact,
  'emergencyPhone': instance.emergencyPhone,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
