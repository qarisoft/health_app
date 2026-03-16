import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/home/data/responses/dashboard_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'dashboard_summary.g.dart';
@riverpod
 Future<DashboardSummaryPageResponse> patientDashboardSummary (Ref ref)async {
  final res =await appRepo.getPatientDashboardSummary();
  return res.when(success: (Map<String, dynamic> data) {
    return DashboardSummaryPageResponse.fromJson(data);
  }, error: (AppError error) {
    throw error;
    // return DashboardSummaryResponse();
  });


}
