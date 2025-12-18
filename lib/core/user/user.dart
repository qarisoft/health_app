// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserType { patient, doctor, pharmacist, admin }

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String phoneNumber,
    required String name,
    required int idCardNumber,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

@freezed
abstract class Authstate with _$Authstate {
  const factory Authstate({required UserEntity user, required String token}) =
      _Authstate;

  factory Authstate.fromJson(Map<String, dynamic> json) =>
      _$AuthstateFromJson(json);
}

@freezed
abstract class DoctorEntity with _$DoctorEntity {
  const factory DoctorEntity({@Default(false) bool isActive}) = _DoctorEntity;

  factory DoctorEntity.fromJson(Map<String, dynamic> json) =>
      _$DoctorEntityFromJson(json);
}

@freezed
abstract class PharmacistEntity with _$PharmacistEntity {
  const factory PharmacistEntity({@Default(false) bool isActive}) =
      _PharmacistEntity;

  factory PharmacistEntity.fromJson(Map<String, dynamic> json) =>
      _$PharmacistEntityFromJson(json);
}

@freezed
abstract class PatientEntity with _$PatientEntity {
  const factory PatientEntity({
    @Default('') String name,
    @Default('') String phoneNumber,
    @Default(false) bool isActive,
  }) = _PatientEntity;

  factory PatientEntity.fromJson(Map<String, dynamic> json) =>
      _$PatientEntityFromJson(json);
}

@freezed
abstract class AdminEntity with _$AdminEntity {
  const factory AdminEntity({@Default('') String name}) = _AdminEntity;

  factory AdminEntity.fromJson(Map<String, dynamic> json) =>
      _$AdminEntityFromJson(json);
}

@freezed
abstract class InitialAuthEntity with _$InitialAuthEntity {
  const factory InitialAuthEntity() = _InitialAuthEntity;

  factory InitialAuthEntity.fromJson(Map<String, dynamic> json) =>
      _$InitialAuthEntityFromJson(json);
}

@freezed
abstract class AppAuthState with _$AppAuthState {
  factory AppAuthState.initial({
    @Default(InitialAuthEntity()) InitialAuthEntity auth,
  }) = InitialAuth;
  factory AppAuthState.patient({required PatientEntity auth}) = PatientAuth;
  factory AppAuthState.doctor({required DoctorEntity auth}) = DoctorAuth;
  factory AppAuthState.pharmacisit({required PharmacistEntity auth}) =
      PharmacistAuth;
  factory AppAuthState.admin({required AdminEntity auth}) = AdminAuth;
}
