// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) =>
    _PrescriptionItem(
      medicationName: json['medicationName'] as String,
      dosage: json['dosage'] as String,
      frequency: json['frequency'] as String,
      duration: json['duration'] as String?,
      instructions: json['instructions'] as String?,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$PrescriptionItemToJson(_PrescriptionItem instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'duration': instance.duration,
      'instructions': instance.instructions,
      'quantity': instance.quantity,
    };

_PrescriptionRequest _$PrescriptionRequestFromJson(Map<String, dynamic> json) =>
    _PrescriptionRequest(
      patientId: (json['patientId'] as num).toInt(),
      diagnosis: json['diagnosis'] as String,
      notes: json['notes'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => PrescriptionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      prescriptionDate: json['prescriptionDate'] == null
          ? null
          : DateTime.parse(json['prescriptionDate'] as String),
    );

Map<String, dynamic> _$PrescriptionRequestToJson(
  _PrescriptionRequest instance,
) => <String, dynamic>{
  'patientId': instance.patientId,
  'diagnosis': instance.diagnosis,
  'notes': instance.notes,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'prescriptionDate': instance.prescriptionDate?.toIso8601String(),
};

_PrescriptionsList _$PrescriptionsListFromJson(Map<String, dynamic> json) =>
    _PrescriptionsList(
      prescriptions: (json['prescriptions'] as List<dynamic>)
          .map((e) => PrescriptionRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrescriptionsListToJson(_PrescriptionsList instance) =>
    <String, dynamic>{'prescriptions': instance.prescriptions};
