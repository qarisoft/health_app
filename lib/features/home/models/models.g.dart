// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Allergy _$AllergyFromJson(Map<String, dynamic> json) => _Allergy(
  allergenName: json['allergenName'] as String? ?? '',
  reaction: json['reaction'] as String? ?? '',
  severity: json['severity'] as String? ?? '',
);

Map<String, dynamic> _$AllergyToJson(_Allergy instance) => <String, dynamic>{
  'allergenName': instance.allergenName,
  'reaction': instance.reaction,
  'severity': instance.severity,
};

_ChronicDisease _$ChronicDiseaseFromJson(Map<String, dynamic> json) =>
    _ChronicDisease(
      diseaseName: json['diseaseName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      diagnosisDate: json['diagnosisDate'] as String? ?? '',
    );

Map<String, dynamic> _$ChronicDiseaseToJson(_ChronicDisease instance) =>
    <String, dynamic>{
      'diseaseName': instance.diseaseName,
      'description': instance.description,
      'diagnosisDate': instance.diagnosisDate,
    };

_Surgery _$SurgeryFromJson(Map<String, dynamic> json) => _Surgery(
  surgeryName: json['surgeryName'] as String? ?? '',
  description: json['description'] as String? ?? '',
  surgeryDate: json['surgeryDate'] as String? ?? '',
  hospital: json['hospital'] as String? ?? '',
  surgeon: json['surgeon'] as String? ?? '',
);

Map<String, dynamic> _$SurgeryToJson(_Surgery instance) => <String, dynamic>{
  'surgeryName': instance.surgeryName,
  'description': instance.description,
  'surgeryDate': instance.surgeryDate,
  'hospital': instance.hospital,
  'surgeon': instance.surgeon,
};

_CurrentMedication _$CurrentMedicationFromJson(Map<String, dynamic> json) =>
    _CurrentMedication(
      medicationName: json['medicationName'] as String? ?? '',
      dosage: json['dosage'] as String? ?? '',
      frequency: json['frequency'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      instructions: json['instructions'] as String? ?? '',
    );

Map<String, dynamic> _$CurrentMedicationToJson(_CurrentMedication instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'duration': instance.duration,
      'instructions': instance.instructions,
    };

_PatientProfile _$PatientProfileFromJson(Map<String, dynamic> json) =>
    _PatientProfile(
      fullName: json['fullName'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      gender: (json['gender'] as num?)?.toInt() ?? 1,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      bloodType: (json['bloodType'] as num?)?.toInt() ?? 1,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      emergencyContact: json['emergencyContact'] as String? ?? '',
      emergencyPhone: json['emergencyPhone'] as String? ?? '',
      allergies:
          (json['allergies'] as List<dynamic>?)
              ?.map((e) => Allergy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      chronicDiseases:
          (json['chronicDiseases'] as List<dynamic>?)
              ?.map((e) => ChronicDisease.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      surgeries:
          (json['surgeries'] as List<dynamic>?)
              ?.map((e) => Surgery.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentMedications:
          (json['currentMedications'] as List<dynamic>?)
              ?.map(
                (e) => CurrentMedication.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$PatientProfileToJson(_PatientProfile instance) =>
    <String, dynamic>{
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
      'allergies': instance.allergies,
      'chronicDiseases': instance.chronicDiseases,
      'surgeries': instance.surgeries,
      'currentMedications': instance.currentMedications,
      'notes': instance.notes,
    };
