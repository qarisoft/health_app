import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';



@freezed
abstract class Patient with _$Patient {
  factory Patient({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String fullName,
    @Default('') String dateOfBirth,
    @Default(1) int gender,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String address,
    @Default(1) int bloodType,
    @Default(1) int weight,
    @Default(1) int height,
    @Default('') String emergencyContact,
    @Default('') String emergencyPhone,
    @Default('') String createdAt,
    @Default('') String updatedAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

    // "id": 0,
    // "userId": 0,
    // "fullName": "string",
    // "specialization": "string",
    // "licenseNumber": "string",
    // "hospital": "string",
    // "phoneNumber": "string",
    // "email": "string",
    // "createdAt": "2025-12-16T19:49:28.853Z",
    // "updatedAt": "2025-12-16T19:49:28.853Z"
@freezed
abstract class Doctor with _$Doctor {
  factory Doctor({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String fullName,
    @Default('') String specialization,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String licenseNumber,
    @Default('') String hospital,
    @Default('') String createdAt,
    @Default('') String updatedAt,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);
}



@freezed
abstract class Pharmacist with _$Pharmacist {
  factory Pharmacist({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('-') String fullName,
    @Default('-') String dateOfBirth,
    @Default(1) int gender,
    @Default('-') String phoneNumber,
    @Default('-') String email,
    @Default('-') String address,
    @Default(1) int bloodType,
    @Default(1) int weight,
    @Default(1) int height,
    @Default('-') String emergencyContact,
    @Default('-') String emergencyPhone,
    @Default('-') String pharmacyName,
    @Default('-') String createdAt,
    @Default('-') String updatedAt,
  }) = _Pharmacist;

  factory Pharmacist.fromJson(Map<String, dynamic> json) =>
      _$PharmacistFromJson(json);
}



@freezed
abstract class Admin with _$Admin {
  factory Admin({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String fullName,
    @Default('') String dateOfBirth,
    @Default(1) int gender,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String address,
    @Default(1) int bloodType,
    @Default(1) int weight,
    @Default(1) int height,
    @Default('') String emergencyContact,
    @Default('') String emergencyPhone,
    @Default('') String createdAt,
    @Default('') String updatedAt,
  }) = _Admin;

  factory Admin.fromJson(Map<String, dynamic> json) =>
      _$AdminFromJson(json);
}

