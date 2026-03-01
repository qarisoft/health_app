import 'package:health_app/auth_state.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'patient_acount.g.dart';

@riverpod
patientAccount(Ref ref) {
  return di<AppStorage>().getPatientAccount();
}
