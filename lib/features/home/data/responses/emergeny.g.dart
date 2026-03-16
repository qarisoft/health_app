// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergeny.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyResponse _$EmergencyResponseFromJson(Map<String, dynamic> json) =>
    EmergencyResponse(
      allergies:
          (json['allergies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fullName: json['fullName'] as String?,
      emergencyPhone: json['emergencyPhone'] as String?,
      emergencyContact: json['emergencyContact'] as String?,
      bloodType: (json['bloodType'] as num?)?.toInt(),
      chronicDiseases:
          (json['chronicDiseases'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      currentMedications:
          (json['currentMedications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      qrCodeUrl: json['qrCodeUrl'] as String?,
    );

Map<String, dynamic> _$EmergencyResponseToJson(EmergencyResponse instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'emergencyPhone': instance.emergencyPhone,
      'emergencyContact': instance.emergencyContact,
      'qrCodeUrl': instance.qrCodeUrl,
      'bloodType': instance.bloodType,
      'allergies': instance.allergies,
      'chronicDiseases': instance.chronicDiseases,
      'currentMedications': instance.currentMedications,
    };

EmergencyPageResponse _$EmergencyPageResponseFromJson(
  Map<String, dynamic> json,
) => EmergencyPageResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  emergencyInfo: EmergencyResponse.fromJson(
    json['emergencyInfo'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$EmergencyPageResponseToJson(
  EmergencyPageResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'emergencyInfo': instance.emergencyInfo.toJson(),
};
