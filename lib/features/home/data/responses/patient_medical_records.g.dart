// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_medical_records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatientMedicalRecord _$PatientMedicalRecordFromJson(
  Map<String, dynamic> json,
) => _PatientMedicalRecord(
  id: json['id'] as num? ?? 0,
  doctorId: json['doctorId'] as num? ?? 0,
  diagnosis: json['diagnosis'] as String? ?? '',
  notes: json['notes'] as String? ?? '',
  symptoms: json['symptoms'] as String? ?? '',
  treatment: json['treatment'] as String? ?? '',
  recordDate: json['recordDate'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
  doctorName: json['doctorName'] as String? ?? '',
  patientName: json['patientName'] as String? ?? '',
);

Map<String, dynamic> _$PatientMedicalRecordToJson(
  _PatientMedicalRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctorId': instance.doctorId,
  'diagnosis': instance.diagnosis,
  'notes': instance.notes,
  'symptoms': instance.symptoms,
  'treatment': instance.treatment,
  'recordDate': instance.recordDate,
  'createdAt': instance.createdAt,
  'doctorName': instance.doctorName,
  'patientName': instance.patientName,
};
