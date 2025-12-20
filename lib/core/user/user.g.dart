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

_DoctorEntity _$DoctorEntityFromJson(Map<String, dynamic> json) =>
    _DoctorEntity(
      isActive: json['isActive'] as bool? ?? false,
      userType:
          $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.doctor,
    );

Map<String, dynamic> _$DoctorEntityToJson(_DoctorEntity instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'userType': _$UserTypeEnumMap[instance.userType]!,
    };

const _$UserTypeEnumMap = {
  UserType.initial: 'initial',
  UserType.patient: 'patient',
  UserType.doctor: 'doctor',
  UserType.pharmacist: 'pharmacist',
  UserType.admin: 'admin',
};

_PharmacistEntity _$PharmacistEntityFromJson(Map<String, dynamic> json) =>
    _PharmacistEntity(
      isActive: json['isActive'] as bool? ?? false,
      userType:
          $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.pharmacist,
    );

Map<String, dynamic> _$PharmacistEntityToJson(_PharmacistEntity instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'userType': _$UserTypeEnumMap[instance.userType]!,
    };

_PatientEntity _$PatientEntityFromJson(Map<String, dynamic> json) =>
    _PatientEntity(
      name: json['name'] as String? ?? '',
      userType:
          $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.patient,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$PatientEntityToJson(_PatientEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'phoneNumber': instance.phoneNumber,
      'isActive': instance.isActive,
    };

_AdminEntity _$AdminEntityFromJson(Map<String, dynamic> json) => _AdminEntity(
  name: json['name'] as String? ?? '',
  userType:
      $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
      UserType.admin,
);

Map<String, dynamic> _$AdminEntityToJson(_AdminEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userType': _$UserTypeEnumMap[instance.userType]!,
    };

_InitialAuthEntity _$InitialAuthEntityFromJson(Map<String, dynamic> json) =>
    _InitialAuthEntity(
      userType:
          $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.initial,
    );

Map<String, dynamic> _$InitialAuthEntityToJson(_InitialAuthEntity instance) =>
    <String, dynamic>{'userType': _$UserTypeEnumMap[instance.userType]!};

_Authstate _$AuthstateFromJson(Map<String, dynamic> json) =>
    _Authstate(token: json['token'] as String);

Map<String, dynamic> _$AuthstateToJson(_Authstate instance) =>
    <String, dynamic>{'token': instance.token};
