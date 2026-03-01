// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DispenseResponse _$DispenseResponseFromJson(Map<String, dynamic> json) =>
    DispenseResponse(
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$DispenseResponseToJson(DispenseResponse instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};
