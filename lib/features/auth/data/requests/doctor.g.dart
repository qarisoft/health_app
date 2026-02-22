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
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String,
  licenseNumber: json['licenseNumber'] as String,
  specialization: json['specialization'] as String,
  hospital: json['hospital'] as String,
  licenseDocument: json['licenseDocument'] as String?,
);

Map<String, dynamic> _$DoctorRegisterRequestToJson(
  _DoctorRegisterRequest instance,
) => <String, dynamic>{
  'nationalId': instance.nationalId,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
  'fullName': instance.fullName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'licenseNumber': instance.licenseNumber,
  'specialization': instance.specialization,
  'hospital': instance.hospital,
  'licenseDocument': instance.licenseDocument,
};
