// ignore_for_file: constant_identifier_names

// import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/core/constants/k.dart';
// import 'package:health_app/core/constants/k.dart';

part 'user.freezed.dart';
part 'user.g.dart';

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
abstract class DoctorEntity with _$DoctorEntity {
  const factory DoctorEntity({
    @Default(false) bool isActive,
    @Default(UserType.doctor) UserType userType,
  }) = _DoctorEntity;

  factory DoctorEntity.fromJson(Map<String, dynamic> json) =>
      _$DoctorEntityFromJson(json);
}

@freezed
abstract class PharmacistEntity with _$PharmacistEntity {
  const factory PharmacistEntity({
    @Default(false) bool isActive,
    @Default(UserType.pharmacist) UserType userType,
  }) = _PharmacistEntity;

  factory PharmacistEntity.fromJson(Map<String, dynamic> json) =>
      _$PharmacistEntityFromJson(json);
}

@freezed
abstract class PatientEntity with _$PatientEntity {
  const factory PatientEntity({
    @Default('') String name,
    @Default(UserType.patient) UserType userType,
    @Default('') String phoneNumber,
    @Default(false) bool isActive,
  }) = _PatientEntity;

  factory PatientEntity.fromJson(Map<String, dynamic> json) =>
      _$PatientEntityFromJson(json);
}

@freezed
abstract class AdminEntity with _$AdminEntity {
  const factory AdminEntity({
    @Default('') String name,
    @Default(UserType.admin) UserType userType,
  }) = _AdminEntity;

  factory AdminEntity.fromJson(Map<String, dynamic> json) =>
      _$AdminEntityFromJson(json);
}

@freezed
abstract class InitialAuthEntity with _$InitialAuthEntity {
  const factory InitialAuthEntity({
    @Default(UserType.initial) UserType userType,
  }) = _InitialAuthEntity;

  factory InitialAuthEntity.fromJson(Map<String, dynamic> json) =>
      _$InitialAuthEntityFromJson(json);
}

// sealed
@freezed
sealed class AppAuthState with _$AppAuthState {
  factory AppAuthState.initial({
    @Default(InitialAuthEntity()) InitialAuthEntity auth,
  }) = InitialAuth;
  factory AppAuthState.patient({required PatientEntity auth}) = PatientAuth;
  factory AppAuthState.doctor({required DoctorEntity auth}) = DoctorAuth;
  factory AppAuthState.pharmacisit({required PharmacistEntity auth}) =
      PharmacistAuth;
  factory AppAuthState.admin({required AdminEntity auth}) = AdminAuth;

  factory AppAuthState.fromJson(Map<String, dynamic> json) {
    // return ;
    UserType s = UserType.fromString(json['userType']);
    return switch (s) {
      UserType.admin => AppAuthState.admin(auth: AdminEntity.fromJson(json)),
      UserType.patient => AppAuthState.patient(
        auth: PatientEntity.fromJson(json),
      ),
      UserType.doctor => AppAuthState.doctor(auth: DoctorEntity.fromJson(json)),
      UserType.pharmacist => AppAuthState.pharmacisit(
        auth: PharmacistEntity.fromJson(json),
      ),
      UserType.initial => AppAuthState.initial(),
    };
  }
}

extension AppAuthEx on AppAuthState {
  Map<String, dynamic> toJson() {
    return when(
      initial: (a) => a.toJson(),
      patient: (a) => a.toJson(),
      doctor: (a) => a.toJson(),
      pharmacisit: (a) => a.toJson(),
      admin: (a) => a.toJson(),
    );
  }
}

@freezed
abstract class Authstate with _$Authstate {
  const factory Authstate({required String token}) = _Authstate;

  factory Authstate.fromJson(Map<String, dynamic> json) =>
      _$AuthstateFromJson(json);
}

// @freezed
// class AuthReturnState with _$AuthReturnState {

//   factory AuthReturnState() = _AuthReturnState;

//   factory AuthReturnState.fromJson(Map<String, dynamic> json) => _$AuthReturnStateFromJson(json);
//   Map<String, dynamic> toJson() => _$AuthReturnStateToJson(this);
// }
