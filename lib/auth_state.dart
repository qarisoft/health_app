import 'package:health_app/accounts_provider.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/domain/models/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import './features/auth/domain/models/account.dart' as Ac;

export './di.dart' show di;

part 'auth_state.g.dart';

@riverpod
class AuthRecordState extends _$AuthRecordState {
  @override
  AuthRecordData build() {
    final auth = appStorage.getAuthRecord();
    // auth.log('authRecord');
    // return auth !=null?:;
    if (auth != null) {
      return AuthRecordData.auth(record: auth);
    }
    return AuthRecordData.initial();
  }

  Future<void> logOut() async {
    await di<AppStorage>().clearAllAccounts();
    ref.invalidate(allAcountsProvider);
    ref.invalidate(accountProvider);
    ref.invalidateSelf();

  }
}

@riverpod
class Account extends _$Account {
  @override
  AccountState build() {
    final authRecord = getAuthRecord();

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

  AuthRecordData getAuthRecord(){
    final auth = appStorage.getAuthRecord();
    // auth.log('authRecord');
    // return auth !=null?:;
    if (auth != null) {
      return AuthRecordData.auth(record: auth);
    }
    return AuthRecordData.initial();
  }

  void getAccount(String s) {}
  void changeAccount(Ac.Account a) {
    state = AccountState.acount(account: a);
  }

  // void setAccount
}
