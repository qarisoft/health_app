// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicalRecordRequest _$MedicalRecordRequestFromJson(
  Map<String, dynamic> json,
) => _MedicalRecordRequest(
  patientId: (json['patientId'] as num).toInt(),
  diagnosis: json['diagnosis'] as String,
  notes: json['notes'] as String,
  symptoms: json['symptoms'] as String,
  treatment: json['treatment'] as String,
  recordDate: DateTime.parse(json['recordDate'] as String),
);

Map<String, dynamic> _$MedicalRecordRequestToJson(
  _MedicalRecordRequest instance,
) => <String, dynamic>{
  'patientId': instance.patientId,
  'diagnosis': instance.diagnosis,
  'notes': instance.notes,
  'symptoms': instance.symptoms,
  'treatment': instance.treatment,
  'recordDate': instance.recordDate.toIso8601String(),
};

_MedicalRecordList _$MedicalRecordListFromJson(Map<String, dynamic> json) =>
    _MedicalRecordList(
      records: (json['records'] as List<dynamic>)
          .map((e) => MedicalRecordRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicalRecordListToJson(_MedicalRecordList instance) =>
    <String, dynamic>{
      'records': instance.records.map((e) => e.toJson()).toList(),
    };
