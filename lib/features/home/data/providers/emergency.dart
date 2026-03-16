import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/home/data/responses/emergeny.dart';
import 'package:health_app/shared/ex.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'emergency.g.dart';

@riverpod
Future<EmergencyResponse> patientEmergency(Ref ref) async {
  ref.cacheTheState();
  final a = await appRepo.getEmergencyScreen();

  final data = a.data;
  if (data != null) {
    final res = EmergencyPageResponse.fromJson(data);
    if (res.wasSuccesfull) {
      return res.emergencyInfo;
    } else {
      throw res.message ?? 'server Error';
    }
  }
  throw 'no response';
}
