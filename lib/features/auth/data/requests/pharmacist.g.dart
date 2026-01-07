// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PharmacistRegisterRequest _$PharmacistRegisterRequestFromJson(
  Map<String, dynamic> json,
) => _PharmacistRegisterRequest(
  nationalId: json['nationalId'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
  fullName: json['fullName'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
  phoneNumber: json['phoneNumber'] as String,
  email: json['email'] as String,
  licenseNumber: json['licenseNumber'] as String,
  pharmacyName: json['pharmacyName'] as String,
  licenseDocumentUrl: json['licenseDocumentUrl'] as String,
);

Map<String, dynamic> _$PharmacistRegisterRequestToJson(
  _PharmacistRegisterRequest instance,
) => <String, dynamic>{
  'nationalId': instance.nationalId,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'licenseNumber': instance.licenseNumber,
  'pharmacyName': instance.pharmacyName,
  'licenseDocumentUrl': instance.licenseDocumentUrl,
};
