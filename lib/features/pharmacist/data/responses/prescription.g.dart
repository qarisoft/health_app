// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionsResponse _$PrescriptionsResponseFromJson(
  Map<String, dynamic> json,
) => PrescriptionsResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  prescriptions:
      (json['prescriptions'] as List<dynamic>?)
          ?.map((e) => Prescription.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PrescriptionsResponseToJson(
  PrescriptionsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'prescriptions': instance.prescriptions,
};
