import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient_acount.g.dart';

@riverpod
PatientAccount? patientAccount(Ref ref) {
  return appStorage.getPatientAccount();
}
