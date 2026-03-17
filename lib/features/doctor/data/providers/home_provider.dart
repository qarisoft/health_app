import 'package:dio/dio.dart';
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart' show getDio, appRepo;
import 'package:health_app/di.dart';
import 'package:health_app/features/doctor/data/requests/home.dart';
import 'package:health_app/features/doctor/data/responses/insights.dart'
    show DoctorDashboardInsight;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

// --- 1. Patients Provider ---
@riverpod
class RecentPatients extends _$RecentPatients {
  @override
  FutureOr<List<RecentPatient>> build() async {
    return _fetchPatients();
  }

  Future<List<RecentPatient>> _fetchPatients() async {
    try {
      final dio = getDio;
      final res = await dio.get(K.doctorHomeUrl);
      final data = res.data as List<dynamic>;

      return data.map((a) => RecentPatient.fromJson(a)).toList();
    } on DioException catch (e) {
      xlog('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${e.response?.statusCode}');
      return [];
    }
  }

  Future<void> deletePatient(dynamic id) async {
    // Optimistic update or network request
    // await getDio.delete('${K.doctorHomeUrl}/$id'); // Assuming API call exists
    await Future.delayed(const Duration(milliseconds: 300));

    // Update local state without needing to re-fetch the entire list from the server
    state = await AsyncValue.guard(() async {
      final currentList = await future;
      return currentList.where((p) => p.id != id).toList();
    });
  }

  // Force a refresh from the server
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchPatients());
  }
}

// --- 2. Insights Provider ---
@riverpod
Future<DoctorDashboardInsight?> doctorInsights(Ref ref) async {
  final res = await appRepo.doctorDashboardInsights();
  return res.whenOrNull(success: (s) => s);
}
