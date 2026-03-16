import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/shared/ex.dart';
// import 'package:health_app/features/auth/data/responses/register.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../responses/prescriptions.dart';

part 'prescriptions.g.dart';

@riverpod
Future<PrescriptionsResponse> patientPrescriptions(Ref ref) async {
  ref.cacheTheState();
  final a = await appRepo.getPatientPrescriptions();
  return a.when(
    success: (s) {
      return PrescriptionsResponse.fromApi(s);
    },
    error: (AppError error) {
      return PrescriptionsResponse([]);
    },
  );
}
