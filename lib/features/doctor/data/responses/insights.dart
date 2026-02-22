import 'package:freezed_annotation/freezed_annotation.dart';

part 'insights.freezed.dart';
part 'insights.g.dart';

@freezed
abstract class DoctorDashboardInsight with _$DoctorDashboardInsight {
  factory DoctorDashboardInsight({
    @Default(0) int patientsToday,
    @Default(0) int patientsThisWeek,
    @Default(0) int patientsThisMonth,
  }) = _DoctorDashboardInsight;

  factory DoctorDashboardInsight.fromJson(Map<String, dynamic> json) =>
      _$DoctorDashboardInsightFromJson(json);
}
