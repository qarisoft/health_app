// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Patient _$PatientFromJson(Map<String, dynamic> json) => _Patient(
  id: json['id'] as String,
  name: json['name'] as String,
  phoneNumber: json['phoneNumber'] as String,
  nationalId: json['nationalId'] as String,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  email: json['email'] as String?,
  address: json['address'] as String?,
  emergencyContact: json['emergencyContact'] as String?,
  bloodType: json['bloodType'] as String?,
  gender: json['gender'] as String?,
  notes: json['notes'] as String?,
  isActive: json['isActive'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PatientToJson(_Patient instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'nationalId': instance.nationalId,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'email': instance.email,
  'address': instance.address,
  'emergencyContact': instance.emergencyContact,
  'bloodType': instance.bloodType,
  'gender': instance.gender,
  'notes': instance.notes,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
