// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescriptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionsResponse _$PrescriptionsResponseFromJson(
  Map<String, dynamic> json,
) => PrescriptionsResponse(
  (json['prescriptions'] as List<dynamic>)
      .map((e) => Prescription.fromJson(e as Map<String, dynamic>))
      .toList(),
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$PrescriptionsResponseToJson(
  PrescriptionsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'prescriptions': instance.prescriptions,
};
