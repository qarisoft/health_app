import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_record.freezed.dart';
part 'medical_record.g.dart';

@freezed
abstract class MedicalRecordRequest with _$MedicalRecordRequest {
  @JsonSerializable(explicitToJson: true)
  factory MedicalRecordRequest({
    required int patientId,
    required String diagnosis,
    required String notes,
    required String symptoms,
    required String treatment,
    required DateTime recordDate,
  }) = _MedicalRecordRequest;

  factory MedicalRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordRequestFromJson(json);
}

@freezed
abstract class MedicalRecordList with _$MedicalRecordList {
  @JsonSerializable(explicitToJson: true)
  factory MedicalRecordList({required List<MedicalRecordRequest> records}) =
      _MedicalRecordList;

  factory MedicalRecordList.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordListFromJson(json);
}
