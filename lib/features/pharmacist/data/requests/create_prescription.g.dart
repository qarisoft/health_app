// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) =>
    _PrescriptionItem(
      drugId: (json['drugId'] as num).toInt(),
      drugName: json['drugName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      dosage: json['dosage'] as String,
      frequency: json['frequency'] as String,
      duration: json['duration'] as String,
      instructions: json['instructions'] as String,
    );

Map<String, dynamic> _$PrescriptionItemToJson(_PrescriptionItem instance) =>
    <String, dynamic>{
      'drugId': instance.drugId,
      'drugName': instance.drugName,
      'quantity': instance.quantity,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'duration': instance.duration,
      'instructions': instance.instructions,
    };

_CreatePrescriptionRequest _$CreatePrescriptionRequestFromJson(
  Map<String, dynamic> json,
) => _CreatePrescriptionRequest(
  patientId: (json['patientId'] as num).toInt(),
  doctorId: (json['doctorId'] as num).toInt(),
  diagnosis: json['diagnosis'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => PrescriptionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreatePrescriptionRequestToJson(
  _CreatePrescriptionRequest instance,
) => <String, dynamic>{
  'patientId': instance.patientId,
  'doctorId': instance.doctorId,
  'diagnosis': instance.diagnosis,
  'items': instance.items.map((e) => e.toJson()).toList(),
};
