// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) =>
    _PrescriptionItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      prescriptionId: (json['prescriptionId'] as num?)?.toInt() ?? 0,
      medicationName: json['medicationName'] as String? ?? '',
      dosage: json['dosage'] as String? ?? '',
      frequency: json['frequency'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      instructions: json['instructions'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      isDispensed: json['isDispensed'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PrescriptionItemToJson(_PrescriptionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prescriptionId': instance.prescriptionId,
      'medicationName': instance.medicationName,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'duration': instance.duration,
      'instructions': instance.instructions,
      'quantity': instance.quantity,
      'isDispensed': instance.isDispensed,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_Prescription _$PrescriptionFromJson(Map<String, dynamic> json) =>
    _Prescription(
      id: (json['id'] as num?)?.toInt() ?? 0,
      patientId: (json['patientId'] as num?)?.toInt() ?? 0,
      doctorId: (json['doctorId'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      diagnosis: json['diagnosis'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      doctorName: json['doctorName'] as String? ?? '',
      patientName: json['patientName'] as String? ?? '',
      prescriptionDate: json['prescriptionDate'] == null
          ? null
          : DateTime.parse(json['prescriptionDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => PrescriptionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PrescriptionToJson(_Prescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'doctorId': instance.doctorId,
      'status': instance.status,
      'diagnosis': instance.diagnosis,
      'notes': instance.notes,
      'doctorName': instance.doctorName,
      'patientName': instance.patientName,
      'prescriptionDate': instance.prescriptionDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
