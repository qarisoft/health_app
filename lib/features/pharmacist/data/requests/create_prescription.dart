// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_prescription.freezed.dart';
part 'create_prescription.g.dart';

@freezed
abstract class PrescriptionItem with _$PrescriptionItem {
  factory PrescriptionItem({
    required int drugId,
    required String drugName,
    required int quantity,
    required String dosage,
    required String frequency,
    required String duration,
    required String instructions,
  }) = _PrescriptionItem;

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
}

@freezed
abstract class CreatePrescriptionRequest with _$CreatePrescriptionRequest {
  @JsonSerializable(explicitToJson: true)
  factory CreatePrescriptionRequest({
    required int patientId,
    required int doctorId,
    required String diagnosis,
    required List<PrescriptionItem> items,
  }) = _CreatePrescriptionRequest;

  factory CreatePrescriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePrescriptionRequestFromJson(json);
}
