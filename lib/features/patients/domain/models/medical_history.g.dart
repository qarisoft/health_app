// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicalHistory _$MedicalHistoryFromJson(
  Map<String, dynamic> json,
) => _MedicalHistory(
  id: json['id'] as String?,
  patientId: json['patientId'] as String,
  patientName: json['patientName'] as String,
  dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  phoneNumber: json['phoneNumber'] as String,
  email: json['email'] as String?,
  address: json['address'] as String,
  emergencyContactName: json['emergencyContactName'] as String,
  emergencyContactPhone: json['emergencyContactPhone'] as String,
  emergencyContactRelationship: json['emergencyContactRelationship'] as String?,
  height: (json['height'] as num).toDouble(),
  weight: (json['weight'] as num).toDouble(),
  bloodType: $enumDecode(_$BloodTypeEnumMap, json['bloodType']),
  chronicConditions: (json['chronicConditions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  allergies: (json['allergies'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  currentMedications: (json['currentMedications'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  pastMedications: (json['pastMedications'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  surgeries: (json['surgeries'] as List<dynamic>?)
      ?.map((e) => Surgery.fromJson(e as Map<String, dynamic>))
      .toList(),
  hospitalizations: (json['hospitalizations'] as List<dynamic>?)
      ?.map((e) => Hospitalization.fromJson(e as Map<String, dynamic>))
      .toList(),
  familyMedicalHistory: (json['familyMedicalHistory'] as Map<String, dynamic>?)
      ?.map((k, e) => MapEntry(k, e as String)),
  isSmoker: json['isSmoker'] as bool,
  cigarettesPerDay: (json['cigarettesPerDay'] as num).toInt(),
  isAlcoholConsumer: json['isAlcoholConsumer'] as bool,
  alcoholFrequency: json['alcoholFrequency'] as String,
  usesRecreationalDrugs: json['usesRecreationalDrugs'] as bool,
  recreationalDrugsDetails: json['recreationalDrugsDetails'] as String?,
  exerciseFrequency: json['exerciseFrequency'] as String,
  dietaryPreferences: json['dietaryPreferences'] as String,
  vaccinations: (json['vaccinations'] as List<dynamic>?)
      ?.map((e) => Vaccination.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastMenstrualPeriod: json['lastMenstrualPeriod'] == null
      ? null
      : DateTime.parse(json['lastMenstrualPeriod'] as String),
  isPregnant: json['isPregnant'] as bool?,
  pregnancies: (json['pregnancies'] as num?)?.toInt(),
  liveBirths: (json['liveBirths'] as num?)?.toInt(),
  mentalHealthConditions: (json['mentalHealthConditions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  currentTherapist: json['currentTherapist'] as String?,
  additionalNotes: json['additionalNotes'] as String?,
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MedicalHistoryToJson(_MedicalHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'patientName': instance.patientName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'gender': _$GenderEnumMap[instance.gender]!,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'emergencyContactName': instance.emergencyContactName,
      'emergencyContactPhone': instance.emergencyContactPhone,
      'emergencyContactRelationship': instance.emergencyContactRelationship,
      'height': instance.height,
      'weight': instance.weight,
      'bloodType': _$BloodTypeEnumMap[instance.bloodType]!,
      'chronicConditions': instance.chronicConditions,
      'allergies': instance.allergies,
      'currentMedications': instance.currentMedications,
      'pastMedications': instance.pastMedications,
      'surgeries': instance.surgeries,
      'hospitalizations': instance.hospitalizations,
      'familyMedicalHistory': instance.familyMedicalHistory,
      'isSmoker': instance.isSmoker,
      'cigarettesPerDay': instance.cigarettesPerDay,
      'isAlcoholConsumer': instance.isAlcoholConsumer,
      'alcoholFrequency': instance.alcoholFrequency,
      'usesRecreationalDrugs': instance.usesRecreationalDrugs,
      'recreationalDrugsDetails': instance.recreationalDrugsDetails,
      'exerciseFrequency': instance.exerciseFrequency,
      'dietaryPreferences': instance.dietaryPreferences,
      'vaccinations': instance.vaccinations,
      'lastMenstrualPeriod': instance.lastMenstrualPeriod?.toIso8601String(),
      'isPregnant': instance.isPregnant,
      'pregnancies': instance.pregnancies,
      'liveBirths': instance.liveBirths,
      'mentalHealthConditions': instance.mentalHealthConditions,
      'currentTherapist': instance.currentTherapist,
      'additionalNotes': instance.additionalNotes,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

const _$BloodTypeEnumMap = {
  BloodType.aPositive: 'aPositive',
  BloodType.aNegative: 'aNegative',
  BloodType.bPositive: 'bPositive',
  BloodType.bNegative: 'bNegative',
  BloodType.abPositive: 'abPositive',
  BloodType.abNegative: 'abNegative',
  BloodType.oPositive: 'oPositive',
  BloodType.unknown: 'unknown',
  BloodType.oNegative: 'oNegative',
};

_Surgery _$SurgeryFromJson(Map<String, dynamic> json) => _Surgery(
  procedureName: json['procedureName'] as String,
  date: DateTime.parse(json['date'] as String),
  hospitalName: json['hospitalName'] as String?,
  surgeonName: json['surgeonName'] as String?,
  complications: json['complications'] as String?,
);

Map<String, dynamic> _$SurgeryToJson(_Surgery instance) => <String, dynamic>{
  'procedureName': instance.procedureName,
  'date': instance.date.toIso8601String(),
  'hospitalName': instance.hospitalName,
  'surgeonName': instance.surgeonName,
  'complications': instance.complications,
};

_Hospitalization _$HospitalizationFromJson(Map<String, dynamic> json) =>
    _Hospitalization(
      admissionDate: DateTime.parse(json['admissionDate'] as String),
      dischargeDate: DateTime.parse(json['dischargeDate'] as String),
      reason: json['reason'] as String,
      hospitalName: json['hospitalName'] as String?,
      treatmentDetails: json['treatmentDetails'] as String?,
    );

Map<String, dynamic> _$HospitalizationToJson(_Hospitalization instance) =>
    <String, dynamic>{
      'admissionDate': instance.admissionDate.toIso8601String(),
      'dischargeDate': instance.dischargeDate.toIso8601String(),
      'reason': instance.reason,
      'hospitalName': instance.hospitalName,
      'treatmentDetails': instance.treatmentDetails,
    };

_Vaccination _$VaccinationFromJson(Map<String, dynamic> json) => _Vaccination(
  vaccineName: json['vaccineName'] as String,
  dateAdministered: DateTime.parse(json['dateAdministered'] as String),
  expirationDate: json['expirationDate'] == null
      ? null
      : DateTime.parse(json['expirationDate'] as String),
  administeringFacility: json['administeringFacility'] as String?,
  lotNumber: json['lotNumber'] as String?,
);

Map<String, dynamic> _$VaccinationToJson(_Vaccination instance) =>
    <String, dynamic>{
      'vaccineName': instance.vaccineName,
      'dateAdministered': instance.dateAdministered.toIso8601String(),
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'administeringFacility': instance.administeringFacility,
      'lotNumber': instance.lotNumber,
    };
