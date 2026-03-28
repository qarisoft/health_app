import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'di.dart';

part 'accounts_provider.freezed.dart';
part 'accounts_provider.g.dart';

@freezed
abstract class AllAcountsState with _$AllAcountsState {
  factory AllAcountsState({
    DoctorAccount? doctor,
    PatientAccount? patient,
    PharmacistAccount? pharmacist,
  }) = _AllAcountsState;
}

@riverpod
class AllAcounts extends _$AllAcounts {
  @override
  AllAcountsState build() {
    final s = AllAcountsState(
      doctor: appStorage.getDoctorAccount(),
      patient: appStorage.getPatientAccount(),
      pharmacist: appStorage.getPharmacistAccount(),
    );

    return s;
  }
}
