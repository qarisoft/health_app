import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/core/user/user.dart'
    show
        AdminEntity,
        AppAuthState,
        DoctorEntity,
        PatientEntity,
        PharmacistEntity;
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/domain/models/auth_state.dart';
import 'package:health_app/shared/ex.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.g.dart';

final di = GetIt.instance;
// import './main.dart' show di;
@riverpod
AppAuthState appAuth(Ref ref) {
  final authType = di<SharedPreferences>().getString(AUTH_TYPE_KEY);
  final authString = di<SharedPreferences>().getString(AUTH_KEY);
  if (authString != null) {
    final json = jsonDecode(authString);

    if (authType == PATIENT_KEY) {
      return AppAuthState.patient(auth: PatientEntity.fromJson(json));
    }
    if (authType == DOCTOR_KEY) {
      return AppAuthState.doctor(auth: DoctorEntity.fromJson(json));
    }
    if (authType == ADMIN_KEY) {
      return AppAuthState.admin(auth: AdminEntity.fromJson(json));
    }
    if (authType == PHARMACIST_KEY) {
      return AppAuthState.pharmacisit(auth: PharmacistEntity.fromJson(json));
    }
  }
  return AppAuthState.initial();
}

@riverpod
class AuthRecordState extends _$AuthRecordState {
  @override
  AuthRecordData build() {
    final auth = di<AppStorage>().getAuthRecord();
    auth.log('authRecord');
    // return auth !=null?:;
    if (auth != null) {
      return AuthRecordData.auth(record: auth);
    }
    return AuthRecordData.initial();
  }
}

@riverpod
class Account extends _$Account {
  @override
  AccountState build() {
    final authRecord = ref.watch(authRecordStateProvider);
    if (authRecord is TAuthRecordData) {
        final p = switch (authRecord.record.role) {
          'admin' => di<AppStorage>().getAdminAccount(),
          'doctor' => di<AppStorage>().getDoctorAccount(),
          'pharmacist' => di<AppStorage>().getPharmacistAccount(),
          'patient' => di<AppStorage>().getPatientAccount(),
          // de => di<AppStorage>().getPatientAccount(),
          String() => di<AppStorage>().getPatientAccount(),
        };
        if (p != null) {
          return AccountState.acount(account: p);
        }
        }
    return AccountState.initial();
    }

  void getAccount(String s) {}
}
