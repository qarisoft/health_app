// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatientResponse _$PatientResponseFromJson(Map<String, dynamic> json) =>
    _PatientResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientResponseToJson(_PatientResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'patient': instance.patient,
    };

_Patient _$PatientFromJson(Map<String, dynamic> json) => _Patient(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String? ?? '',
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  gender: (json['gender'] as num?)?.toInt() ?? 0,
  bloodType: (json['bloodType'] as num?)?.toInt() ?? 0,
  weight: (json['weight'] as num?)?.toDouble() ?? 10,
  height: (json['height'] as num?)?.toDouble() ?? 10,
  emergencyContact: json['emergencyContact'] as String?,
  emergencyPhone: json['emergencyPhone'] as String?,
  patientCode: json['patientCode'] as String?,
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
  medicalRecords:
      (json['medicalRecords'] as List<dynamic>?)
          ?.map((e) => MedicalRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  prescriptions:
      (json['prescriptions'] as List<dynamic>?)
          ?.map((e) => Prescription.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PatientToJson(_Patient instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'gender': instance.gender,
  'bloodType': instance.bloodType,
  'weight': instance.weight,
  'height': instance.height,
  'emergencyContact': instance.emergencyContact,
  'emergencyPhone': instance.emergencyPhone,
  'patientCode': instance.patientCode,
  'allergies': instance.allergies,
  'chronicDiseases': instance.chronicDiseases,
  'surgeries': instance.surgeries,
  'medicalRecords': instance.medicalRecords,
  'prescriptions': instance.prescriptions,
};

_Allergy _$AllergyFromJson(Map<String, dynamic> json) => _Allergy(
  id: (json['id'] as num?)?.toInt() ?? 0,
  patientId: (json['patientId'] as num?)?.toInt() ?? 0,
  allergenName: json['allergenName'] as String? ?? '',
  reaction: json['reaction'] as String? ?? '',
  severity: json['severity'] as String? ?? '',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AllergyToJson(_Allergy instance) => <String, dynamic>{
  'id': instance.id,
  'patientId': instance.patientId,
  'allergenName': instance.allergenName,
  'reaction': instance.reaction,
  'severity': instance.severity,
  'createdAt': instance.createdAt?.toIso8601String(),
};

_ChronicDisease _$ChronicDiseaseFromJson(Map<String, dynamic> json) =>
    _ChronicDisease(
      id: (json['id'] as num?)?.toInt() ?? 0,
      patientId: (json['patientId'] as num?)?.toInt() ?? 0,
      diseaseName: json['diseaseName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      diagnosisDate: json['diagnosisDate'] == null
          ? null
          : DateTime.parse(json['diagnosisDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChronicDiseaseToJson(_ChronicDisease instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'diseaseName': instance.diseaseName,
      'description': instance.description,
      'diagnosisDate': instance.diagnosisDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_Surgery _$SurgeryFromJson(Map<String, dynamic> json) => _Surgery(
  id: (json['id'] as num?)?.toInt() ?? 0,
  patientId: (json['patientId'] as num?)?.toInt() ?? 0,
  surgeryName: json['surgeryName'] as String? ?? '',
  description: json['description'] as String? ?? '',
  hospital: json['hospital'] as String? ?? '',
  surgeon: json['surgeon'] as String? ?? '',
  surgeryDate: json['surgeryDate'] == null
      ? null
      : DateTime.parse(json['surgeryDate'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$SurgeryToJson(_Surgery instance) => <String, dynamic>{
  'id': instance.id,
  'patientId': instance.patientId,
  'surgeryName': instance.surgeryName,
  'description': instance.description,
  'hospital': instance.hospital,
  'surgeon': instance.surgeon,
  'surgeryDate': instance.surgeryDate?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
};

_MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) =>
    _MedicalRecord(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      doctorId: (json['doctorId'] as num?)?.toInt(),
      diagnosis: json['diagnosis'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      symptoms: json['symptoms'] as String?,
      treatment: json['treatment'] as String?,
      recordDate: json['recordDate'] == null
          ? null
          : DateTime.parse(json['recordDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      doctorName: json['doctorName'] as String? ?? '',
      patientName: json['patientName'] as String? ?? '',
    );

Map<String, dynamic> _$MedicalRecordToJson(_MedicalRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'doctorId': instance.doctorId,
      'diagnosis': instance.diagnosis,
      'notes': instance.notes,
      'symptoms': instance.symptoms,
      'treatment': instance.treatment,
      'recordDate': instance.recordDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'doctorName': instance.doctorName,
      'patientName': instance.patientName,
    };

_Prescription _$PrescriptionFromJson(Map<String, dynamic> json) =>
    _Prescription(
      id: (json['id'] as num?)?.toInt() ?? 0,
      patientId: (json['patientId'] as num?)?.toInt() ?? 0,
      doctorId: (json['doctorId'] as num?)?.toInt() ?? 0,
      diagnosis: json['diagnosis'] as String? ?? '',
      notes: json['notes'] as String?,
      status: (json['status'] as num).toInt(),
      prescriptionDate: json['prescriptionDate'] == null
          ? null
          : DateTime.parse(json['prescriptionDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      doctorName: json['doctorName'] as String? ?? '',
      patientName: json['patientName'] as String? ?? '',
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => PrescriptionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PrescriptionToJson(_Prescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'doctorId': instance.doctorId,
      'diagnosis': instance.diagnosis,
      'notes': instance.notes,
      'status': instance.status,
      'prescriptionDate': instance.prescriptionDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'doctorName': instance.doctorName,
      'patientName': instance.patientName,
      'items': instance.items,
    };

_PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) =>
    _PrescriptionItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      prescriptionId: (json['prescriptionId'] as num?)?.toInt() ?? 0,
      drugId: (json['drugId'] as num?)?.toInt() ?? 0,
      medicationName: json['medicationName'] as String? ?? '',
      dosage: json['dosage'] as String? ?? '',
      frequency: json['frequency'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      instructions: json['instructions'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      isDispensed: json['isDispensed'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PrescriptionItemToJson(_PrescriptionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prescriptionId': instance.prescriptionId,
      'drugId': instance.drugId,
      'medicationName': instance.medicationName,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'duration': instance.duration,
      'instructions': instance.instructions,
      'quantity': instance.quantity,
      'isDispensed': instance.isDispensed,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
