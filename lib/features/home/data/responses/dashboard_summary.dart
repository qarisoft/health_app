import 'package:json_annotation/json_annotation.dart';

import '../../../auth/data/responses/base/base_response.dart';

part 'dashboard_summary.g.dart';

@JsonSerializable()
class LatestPrescription {
  final String date;
  final String doctorName;
  final int status;
  final int medicationCount;

  LatestPrescription({
    required this.date,
    required this.doctorName,
    required this.status,
    required this.medicationCount,
  });

  factory LatestPrescription.fromJson(Map<String, dynamic> json) =>
      _$LatestPrescriptionFromJson(json);
}

@JsonSerializable()
class LatestDiagnosis {
  final String diagnosis;
  final String doctorName;
  final String date;

  LatestDiagnosis({
    required this.diagnosis,
    required this.doctorName,
    required this.date,
  });

  factory LatestDiagnosis.fromJson(Map<String, dynamic> json) =>
      _$LatestDiagnosisFromJson(json);
}

@JsonSerializable()
class ProfileStatus {
  final bool isInitialized;
  final int bloodType;

  ProfileStatus({required this.isInitialized, required this.bloodType});

  factory ProfileStatus.fromJson(Map<String, dynamic> json) =>
      _$ProfileStatusFromJson(json);
}

@JsonSerializable()
class DashboardStatics {
  final int totalPrescriptions;
  final int pendingPrescriptions;
  final int totalVisits;
  final int uniqueDoctors;

  DashboardStatics({
    required this.totalPrescriptions,
    required this.pendingPrescriptions,
    required this.totalVisits,
    required this.uniqueDoctors,
  });

  factory DashboardStatics.fromJson(Map<String, dynamic> json) =>
      _$DashboardStaticsFromJson(json);
}

@JsonSerializable()
class DashboardSummaryResponse {
  final LatestPrescription? latestPrescription;
  final LatestDiagnosis? latestDiagnosis;
  final ProfileStatus? profileStatus;
  final DashboardStatics? statistics;

  DashboardSummaryResponse({
    this.latestPrescription,
    this.latestDiagnosis,
    this.profileStatus,
    this.statistics,
    // this.prescriptions = const [],
  });

  factory DashboardSummaryResponse.fromJson(Map<String, dynamic> json) {
    return _$DashboardSummaryResponseFromJson(json);
  }


  Map<String, dynamic> toJson() => _$DashboardSummaryResponseToJson(this);
}


@JsonSerializable()
class DashboardSummaryPageResponse extends BaseResponse {
  final DashboardSummaryResponse? data;

  DashboardSummaryPageResponse({
    super.success = false,
    super.message,
    this.data
  });

  factory DashboardSummaryPageResponse.fromJson(Map<String, dynamic> json) {
    return _$DashboardSummaryPageResponseFromJson(json);
  }


  Map<String, dynamic> toJson() => _$DashboardSummaryPageResponseToJson(this);
}
