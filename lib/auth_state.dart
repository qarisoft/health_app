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
import './features/auth/domain/models/account.dart' as Ac;

part 'auth_state.g.dart';

final di = GetIt.instance;

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

  Future<void> logOut() async {
    await di<AppStorage>().clearAllAccounts();
    ref.invalidateSelf();
  }
}

@Riverpod(dependencies: [AuthRecordState])
class Account extends _$Account {
  @override
  AccountState build() {
    final authRecord = ref.watch(authRecordStateProvider);
    try {
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
    } catch (e) {
      return AccountState.initial();
    }
    return AccountState.initial();
  }

  void getAccount(String s) {}
  void changeAccount(Ac.Account a) {
    state = AccountState.acount(account: a);
  }

  // void setAccount
}
