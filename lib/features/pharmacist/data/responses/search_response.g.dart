// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientSearchResponse _$PatientSearchResponseFromJson(
  Map<String, dynamic> json,
) => PatientSearchResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  patients:
      (json['patients'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PatientSearchResponseToJson(
  PatientSearchResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'patients': instance.patients,
};

DoctorSearchResponse _$DoctorSearchResponseFromJson(
  Map<String, dynamic> json,
) => DoctorSearchResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  doctors:
      (json['doctors'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DoctorSearchResponseToJson(
  DoctorSearchResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'doctors': instance.doctors,
};
