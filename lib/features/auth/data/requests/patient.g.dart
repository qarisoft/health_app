// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatientRegisterRequest _$PatientRegisterRequestFromJson(
  Map<String, dynamic> json,
) => _PatientRegisterRequest(
  nationalId: json['nationalId'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
  fullName: json['fullName'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
  phoneNumber: json['phoneNumber'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$PatientRegisterRequestToJson(
  _PatientRegisterRequest instance,
) => <String, dynamic>{
  'nationalId': instance.nationalId,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
};
