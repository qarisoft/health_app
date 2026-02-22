// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorDashboardInsight _$DoctorDashboardInsightFromJson(
  Map<String, dynamic> json,
) => _DoctorDashboardInsight(
  patientsToday: (json['patientsToday'] as num?)?.toInt() ?? 0,
  patientsThisWeek: (json['patientsThisWeek'] as num?)?.toInt() ?? 0,
  patientsThisMonth: (json['patientsThisMonth'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DoctorDashboardInsightToJson(
  _DoctorDashboardInsight instance,
) => <String, dynamic>{
  'patientsToday': instance.patientsToday,
  'patientsThisWeek': instance.patientsThisWeek,
  'patientsThisMonth': instance.patientsThisMonth,
};
