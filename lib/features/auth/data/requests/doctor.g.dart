// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorRegisterRequest _$DoctorRegisterRequestFromJson(
  Map<String, dynamic> json,
) => _DoctorRegisterRequest(
  nationalId: json['nationalId'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
  fullName: json['fullName'] as String,
  dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
  phoneNumber: json['phoneNumber'] as String,
  email: json['email'] as String,
  licenseNumber: json['licenseNumber'] as String,
  specialization: json['specialization'] as String,
  hospital: json['hospital'] as String,
  licenseDocumentUrl: json['licenseDocumentUrl'] as String,
);

Map<String, dynamic> _$DoctorRegisterRequestToJson(
  _DoctorRegisterRequest instance,
) => <String, dynamic>{
  'nationalId': instance.nationalId,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth.toIso8601String(),
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'licenseNumber': instance.licenseNumber,
  'specialization': instance.specialization,
  'hospital': instance.hospital,
  'licenseDocumentUrl': instance.licenseDocumentUrl,
};
