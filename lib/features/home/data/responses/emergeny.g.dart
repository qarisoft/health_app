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
      fullName: json['fullName'] as String,
      emergencyPhone: json['emergencyPhone'] as String,
      emergencyContact: json['emergencyContact'] as String,
      bloodType: (json['bloodType'] as num).toInt(),
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
    );

Map<String, dynamic> _$EmergencyResponseToJson(EmergencyResponse instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'emergencyPhone': instance.emergencyPhone,
      'emergencyContact': instance.emergencyContact,
      'bloodType': instance.bloodType,
      'allergies': instance.allergies,
      'chronicDiseases': instance.chronicDiseases,
      'currentMedications': instance.currentMedications,
    };
