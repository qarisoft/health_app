// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/user/user.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/domain/models/auth_state.dart';
import 'package:health_app/features/auth/domain/models/patient.dart';
import 'package:health_app/shared/ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int version = 3;
const String appLocalKey = 'appLocalKey$version';
const String userTokenKey = 'userTokenKey$version';
//
const String PATIENT_ACCOUNT_KEY = 'patient-account$version';
const String DOCTOR_ACCOUNT_KEY = 'doctor-account$version';
const String PHARMACIST_ACCOUNT_KEY = 'pharmacist-account$version';
const String ADMIN_ACCOUNT_KEY = 'admin-account$version';
//
const String AUTH_RECORD_KEY = 'AUTH_RECORD_KEY$version';

//
//
class AppStorage {
  final SharedPreferences sharedPreferences;

  AppStorage(this.sharedPreferences);
  Future<void> clearAuthToken() async {
    await sharedPreferences.remove(userTokenKey);
  }

  Future<void> clearAuthRecord() async {
    await sharedPreferences.remove(AUTH_RECORD_KEY);
  }

  Future<void> clearAllAccounts() async {
    await sharedPreferences.remove(PATIENT_ACCOUNT_KEY);
    await sharedPreferences.remove(PHARMACIST_ACCOUNT_KEY);
    await sharedPreferences.remove(DOCTOR_ACCOUNT_KEY);
    await sharedPreferences.remove(ADMIN_ACCOUNT_KEY);
  }

  String? getString(String k) {
    return sharedPreferences.getString(k);
  }

  Map<String, dynamic>? getJson(String k) {
    return sharedPreferences.getString(k).toJson();
  }

  Locale getLocale() {
    return Locale(getappLoale());
  }

  String getappLoale() => sharedPreferences.getString(appLocalKey) ?? 'ar';
  String? getUserToken() => sharedPreferences.getString(userTokenKey);

  Future<void> setAppAuthState(AppAuthState auth) async {
    await sharedPreferences.setString(
      'appAuthstate',
      jsonEncode(auth.toJson()),
    );
    return;
  }

  Future<void> setAuthRecord(AuthRecord auth)async {
    await sharedPreferences.setString(AUTH_RECORD_KEY, auth.toJson().jsencode());
  }

  AuthRecord? getAuthRecord() {
    final s = sharedPreferences.getString(AUTH_RECORD_KEY);

    final json = s != null ? jsonDecode(s) : null;

    return json != null ? AuthRecord.fromJson(json) : null;
  }

  Future<void> setPatientAccount(PatientAccount account) async {
    sharedPreferences.setString(
      PATIENT_ACCOUNT_KEY,
      jsonEncode(account.patient.toJson()),
    );
  }

  Future<void> setDoctorAccount(DoctorAccount account) async {
    sharedPreferences.setString(
      DOCTOR_ACCOUNT_KEY,
      jsonEncode(account.doctor.toJson()),
    );
  }

  Future<void> setPharmacistAccount(PharmacistAccount account) async {
    sharedPreferences.setString(
      PHARMACIST_ACCOUNT_KEY,
      jsonEncode(account.pharmacist.toJson()),
    );
  }

  Future<void> setAdminAccount(AdminAccount account) async {
    sharedPreferences.setString(
      ADMIN_ACCOUNT_KEY,
      jsonEncode(account.admin.toJson()),
    );
  }

  PatientAccount? getPatientAccount() {
    final j = getJson(PATIENT_ACCOUNT_KEY);
    return j.notNull() ? PatientAccount(patient: Patient.fromJson(j!)) : null;
  }

  DoctorAccount? getDoctorAccount() {
    final j = getJson(DOCTOR_ACCOUNT_KEY);
    return j.notNull() ? DoctorAccount(doctor: Doctor.fromJson(j!)) : null;
  }

  PharmacistAccount? getPharmacistAccount() {
    final j = getJson(PHARMACIST_ACCOUNT_KEY);
    return j.notNull()
        ? PharmacistAccount(pharmacist: Pharmacist.fromJson(j!))
        : null;
  }

  AdminAccount? getAdminAccount() {
    final j = getJson(ADMIN_ACCOUNT_KEY);
    return j.notNull() ? AdminAccount(admin: Admin.fromJson(j!)) : null;
  }
}
