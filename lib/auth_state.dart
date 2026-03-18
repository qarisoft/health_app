import 'package:health_app/core/services/storage.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/domain/models/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import './features/auth/domain/models/account.dart' as Ac;
import 'features/auth/domain/models/patient.dart' show Patient;

export './di.dart' show di;

part 'auth_state.g.dart';

@riverpod
class AuthRecordState extends _$AuthRecordState {
  @override
  AuthRecordData build() {
    final auth = appStorage.getAuthRecord();
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
          String() => null,
        };
        if (p != null) {
          return AccountState.account(account: p);
        }
      }
    } catch (e) {
      return AccountState.initial();
    }
    return AccountState.initial();
  }

  AuthRecordData getAuthRecord() {
    final auth = appStorage.getAuthRecord();
    if (auth != null) {
      return AuthRecordData.auth(record: auth);
    }
    return AuthRecordData.initial();
  }

  void getAccount(String s) {}

  void changeAccount(Patient a) {
    state = AccountState.account(
      account: Ac.PatientAccount(patient: a),
      isLogInAsPatient: true,
    );
  }

  // void setAccount
}
