import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../responses/queue_item.dart' show PrescriptionQueueItem;
part 'prescription_queu.g.dart';

PrescriptionQueueItem toModel(dynamic a) {
  return PrescriptionQueueItem.fromJson(a);
}

@riverpod
Future<List<PrescriptionQueueItem>> prescriptionQueue(Ref ref) async {
  try {
    await Future.delayed(Duration(seconds: 1));
    // final a = await appRepo.getDio().get('/PharmacistDashboard/queue');
    // final listData = (a.data as Iterable).map(toModel).toList();
    // return listData;
    final a = await appRepo.getPharmacistDashboardQueu();
    return a.when(
      success: (s) => s,
      error: (e) {
        throw e;
      },
    );
  } catch (e) {
    // xlog(e);
    return [];
  }
}
