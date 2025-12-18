import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    required String id,
    required String name,
    required String phoneNumber,
    required String nationalId,
    DateTime? dateOfBirth,
    String? email,
    String? address,
    String? emergencyContact,
    String? bloodType,
    String? gender,
    String? notes,
    @Default(false) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

enum Gender {
  male,
  female,
  other,
}

extension GenderExtension on Gender {
  String get displayName {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
    }
  }
  
  String get arabicName {
    switch (this) {
      case Gender.male:
        return 'ذكر';
      case Gender.female:
        return 'أنثى';
      case Gender.other:
        return 'آخر';
    }
  }
}