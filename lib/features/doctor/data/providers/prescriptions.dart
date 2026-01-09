import 'dart:convert';

import 'package:health_app/auth_state.dart';
import 'package:health_app/core/services/storage.dart';
// import 'package:health_app/features/doctor/data/requests/medical_record.dart';
import 'package:health_app/features/doctor/data/requests/prescription.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prescriptions.g.dart';

@riverpod
class PrescriptionsStore extends _$PrescriptionsStore {
  @override
  PrescriptionsList build() {
    final s = di<AppStorage>().getString('PrescriptionsList');
    if (s != null) {
      try {
        final json = jsonDecode(s);
        return PrescriptionsList.fromJson(json);
      } catch (e) {
        return PrescriptionsList(prescriptions: []);
      }
    }

    return PrescriptionsList(prescriptions: []);
  }

  Future<void> addPrescription(PrescriptionRequest prescription) async {
    final newState = state.copyWith(
      prescriptions: [...state.prescriptions, prescription],
    );

    await di<AppStorage>().setString(
      'PrescriptionsList',
      jsonEncode(newState.toJson()),
    );
    ref.invalidateSelf();
  }
}
