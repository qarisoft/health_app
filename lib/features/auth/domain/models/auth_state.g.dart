// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthRecord _$AuthRecordFromJson(Map<String, dynamic> json) => _AuthRecord(
  accessToken: json['accessToken'] as String,
  role: json['role'] as String,
  userId: (json['userId'] as num).toInt(),
);

Map<String, dynamic> _$AuthRecordToJson(_AuthRecord instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'role': instance.role,
      'userId': instance.userId,
    };
