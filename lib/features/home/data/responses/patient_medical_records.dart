import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_medical_records.freezed.dart';
part 'patient_medical_records.g.dart';

@freezed
abstract class PatientMedicalRecord with _$PatientMedicalRecord {
  const factory PatientMedicalRecord({
    @Default(0) num id,
    @Default(0) num doctorId,
    @Default('') String diagnosis,
    @Default('') String notes,
    @Default('') String symptoms,
    @Default('') String treatment,
    @Default('') String recordDate,
    @Default('') String createdAt,
    @Default('') String doctorName,
    @Default('') String patientName,
  }) = _PatientMedicalRecord;

  factory PatientMedicalRecord.fromJson(Map<String, dynamic> json) =>
      _$PatientMedicalRecordFromJson(json);
}
