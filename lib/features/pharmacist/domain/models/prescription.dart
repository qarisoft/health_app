// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

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

extension PrescriptionStatus on Prescription {
  PrescriptionStatusEnum getStatus() {
    switch (status) {
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

  String getStatusString() {
    switch (status) {
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
}
