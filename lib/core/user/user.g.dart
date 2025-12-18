// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  phoneNumber: json['phoneNumber'] as String,
  name: json['name'] as String,
  idCardNumber: (json['idCardNumber'] as num).toInt(),
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'idCardNumber': instance.idCardNumber,
    };

_Authstate _$AuthstateFromJson(Map<String, dynamic> json) => _Authstate(
  user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String,
);

Map<String, dynamic> _$AuthstateToJson(_Authstate instance) =>
    <String, dynamic>{'user': instance.user, 'token': instance.token};

_DoctorEntity _$DoctorEntityFromJson(Map<String, dynamic> json) =>
    _DoctorEntity(isActive: json['isActive'] as bool? ?? false);

Map<String, dynamic> _$DoctorEntityToJson(_DoctorEntity instance) =>
    <String, dynamic>{'isActive': instance.isActive};

_PharmacistEntity _$PharmacistEntityFromJson(Map<String, dynamic> json) =>
    _PharmacistEntity(isActive: json['isActive'] as bool? ?? false);

Map<String, dynamic> _$PharmacistEntityToJson(_PharmacistEntity instance) =>
    <String, dynamic>{'isActive': instance.isActive};

_PatientEntity _$PatientEntityFromJson(Map<String, dynamic> json) =>
    _PatientEntity(
      name: json['name'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$PatientEntityToJson(_PatientEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'isActive': instance.isActive,
    };

_AdminEntity _$AdminEntityFromJson(Map<String, dynamic> json) =>
    _AdminEntity(name: json['name'] as String? ?? '');

Map<String, dynamic> _$AdminEntityToJson(_AdminEntity instance) =>
    <String, dynamic>{'name': instance.name};

_InitialAuthEntity _$InitialAuthEntityFromJson(Map<String, dynamic> json) =>
    _InitialAuthEntity();

Map<String, dynamic> _$InitialAuthEntityToJson(_InitialAuthEntity instance) =>
    <String, dynamic>{};
