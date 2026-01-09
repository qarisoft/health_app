// lib/features/doctor/data/models/prescription.dart

// import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'prescription_item.dart';

part 'prescription.freezed.dart';
part 'prescription.g.dart';

@freezed
abstract class PrescriptionItem with _$PrescriptionItem {
  @JsonSerializable(explicitToJson: true)
  const factory PrescriptionItem({
    required String medicationName,
    required String dosage,
    required String frequency,
    String? duration,
    String? instructions,
    @Default(1) int quantity,
  }) = _PrescriptionItem;

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
}

@freezed
abstract class PrescriptionRequest with _$PrescriptionRequest {
  @JsonSerializable(explicitToJson: true)
  const factory PrescriptionRequest({
    required int patientId,
    required String diagnosis,
    String? notes,
    @Default([]) List<PrescriptionItem> items,
    DateTime? prescriptionDate,
  }) = _PrescriptionRequest;
  factory PrescriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionRequestFromJson(json);
}



@freezed
abstract class PrescriptionsList with _$PrescriptionsList {

  factory PrescriptionsList({required List<PrescriptionRequest> prescriptions}) = _PrescriptionsList;

  factory PrescriptionsList.fromJson(Map<String, dynamic> json) => _$PrescriptionsListFromJson(json);
}