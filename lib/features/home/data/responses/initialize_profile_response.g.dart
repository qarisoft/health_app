// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialize_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitializeProfileResponse _$InitializeProfileResponseFromJson(
  Map<String, dynamic> json,
) => InitializeProfileResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  patientId: (json['patientId'] as num?)?.toInt(),
);

Map<String, dynamic> _$InitializeProfileResponseToJson(
  InitializeProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'patientId': instance.patientId,
};
