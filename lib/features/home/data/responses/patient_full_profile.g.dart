// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_full_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientProfile _$PatientProfileFromJson(Map<String, dynamic> json) =>
    PatientProfile(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      gender: (json['gender'] as num?)?.toInt() ?? 0,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      bloodType: (json['bloodType'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      emergencyContact: json['emergencyContact'] as String? ?? '',
      emergencyPhone: json['emergencyPhone'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$PatientProfileToJson(PatientProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'bloodType': instance.bloodType,
      'weight': instance.weight,
      'height': instance.height,
      'emergencyContact': instance.emergencyContact,
      'emergencyPhone': instance.emergencyPhone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

PatientFullProfile _$PatientFullProfileFromJson(Map<String, dynamic> json) =>
    PatientFullProfile(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      patient: PatientProfile.fromJson(json['patient'] as Map<String, dynamic>),
      allergies:
          (json['allergies'] as List<dynamic>?)
              ?.map((e) => Allergy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      surgeries:
          (json['surgeries'] as List<dynamic>?)
              ?.map((e) => Surgery.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      chronicDiseases:
          (json['chronicDiseases'] as List<dynamic>?)
              ?.map((e) => ChronicDisease.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentMedications:
          (json['currentMedications'] as List<dynamic>?)
              ?.map(
                (e) => CurrentMedication.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PatientFullProfileToJson(PatientFullProfile instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'patient': instance.patient,
      'allergies': instance.allergies,
      'surgeries': instance.surgeries,
      'chronicDiseases': instance.chronicDiseases,
      'currentMedications': instance.currentMedications,
    };
