// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PharmacistProfileRequestData _$PharmacistProfileRequestDataFromJson(
  Map<String, dynamic> json,
) => _PharmacistProfileRequestData(
  fullName: json['fullName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  email: json['email'] as String,
  pharmacyName: json['pharmacyName'] as String,
  licenseNumber: json['licenseNumber'] as String,
);

Map<String, dynamic> _$PharmacistProfileRequestDataToJson(
  _PharmacistProfileRequestData instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'pharmacyName': instance.pharmacyName,
  'licenseNumber': instance.licenseNumber,
};
