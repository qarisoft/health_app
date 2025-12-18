import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/user/user.dart'
    show
        AdminEntity,
        AppAuthState,
        DoctorEntity,
        PatientEntity,
        PharmacistEntity;
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
