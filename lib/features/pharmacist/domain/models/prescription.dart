// ignore_for_file: invalid_annotation_target

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/shared/ex.dart';

part 'prescription.freezed.dart';
part 'prescription.g.dart';

@freezed
abstract class PrescriptionItem with _$PrescriptionItem {
  @JsonSerializable(explicitToJson: true)
  factory PrescriptionItem({
    @Default(0) int id,
    @Default(0) int prescriptionId,
    @Default('') String medicationName,
    @Default('') String dosage,
    @Default('') String notes,
    @Default('') String frequency,
    @Default('') String duration,
    @Default('') String instructions,
    @Default(0.0) double quantity,
    @Default(false) bool isDispensed,
    DateTime? createdAt,
  }) = _PrescriptionItem;

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
}

@freezed
abstract class Prescription with _$Prescription {
  @JsonSerializable(explicitToJson: true)
  factory Prescription({
    @Default(0) int id,
    @Default(0) int patientId,
    @Default(0) int doctorId,
    @Default(0) int status,
    @Default('') String diagnosis,
    @Default('') String notes,
    @Default('') String doctorName,
    @Default('') String patientName,
    DateTime? prescriptionDate,
    DateTime? createdAt,
    @Default([]) List<PrescriptionItem> items,
  }) = _Prescription;

  factory Prescription.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionFromJson(json);
}

enum PrescriptionStatusEnum {
  pending,
  dispensed,
  partialDispensed,
  canceled,
  inReview,
  needConsoultation,
}

PrescriptionStatusEnum getPrescriptionStatus(int s) {
  switch (s) {
    case 2:
      return PrescriptionStatusEnum.dispensed;
    case 3:
      return PrescriptionStatusEnum.partialDispensed;
    case 4:
      return PrescriptionStatusEnum.canceled;
    case 5:
      return PrescriptionStatusEnum.inReview;
    case 6:
      return PrescriptionStatusEnum.needConsoultation;
    default:
      return PrescriptionStatusEnum.pending;
  }
}

String getPrescriptionStatusString(int s) {
  switch (s) {
    case 2:
      return 'dispensed';
    case 3:
      return 'partialDispensed';
    case 4:
      return 'canceled';
    case 5:
      return 'inReview';
    case 6:
      return 'needConsoultation';
    default:
      return 'pending';
  }
}


String getPrescriptionStatusLocalizedString(int s,BuildContext c) {
  switch (s) {
    case 2:
      return c.tr.dispensed;
    case 3:
      return c.tr.partialDispensed;
    case 4:
      return c.tr.canceled;
    case 5:
      return c.tr.inReview;
    case 6:
      return c.tr.needConsultation;
    default:
      return c.tr.pending;
  }
}

extension PrescriptionStatus on Prescription {
  PrescriptionStatusEnum getStatus() => getPrescriptionStatus(status);

  String getStatusString() {
    return getPrescriptionStatusString(status);
  }
}
