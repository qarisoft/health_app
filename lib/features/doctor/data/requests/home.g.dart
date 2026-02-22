// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecentPatient _$RecentPatientFromJson(Map<String, dynamic> json) =>
    _RecentPatient(
      patientId: (json['patientId'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? 'full name',
      patientCode: json['patientCode'] as String? ?? 'patientCode',
      lastInteractionDate: json['lastInteractionDate'] == null
          ? null
          : DateTime.parse(json['lastInteractionDate'] as String),
      lastInteractionType: json['lastInteractionType'] as String?,
    );

Map<String, dynamic> _$RecentPatientToJson(_RecentPatient instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'fullName': instance.fullName,
      'patientCode': instance.patientCode,
      'lastInteractionDate': instance.lastInteractionDate?.toIso8601String(),
      'lastInteractionType': instance.lastInteractionType,
    };

_HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) =>
    _HomeResponse(
      (json['data'] as List<dynamic>)
          .map((e) => RecentPatient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeResponseToJson(_HomeResponse instance) =>
    <String, dynamic>{'data': instance.data};
