// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestPrescription _$LatestPrescriptionFromJson(Map<String, dynamic> json) =>
    LatestPrescription(
      date: json['date'] as String,
      doctorName: json['doctorName'] as String,
      status: (json['status'] as num).toInt(),
      medicationCount: (json['medicationCount'] as num).toInt(),
    );

Map<String, dynamic> _$LatestPrescriptionToJson(LatestPrescription instance) =>
    <String, dynamic>{
      'date': instance.date,
      'doctorName': instance.doctorName,
      'status': instance.status,
      'medicationCount': instance.medicationCount,
    };

LatestDiagnosis _$LatestDiagnosisFromJson(Map<String, dynamic> json) =>
    LatestDiagnosis(
      diagnosis: json['diagnosis'] as String,
      doctorName: json['doctorName'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$LatestDiagnosisToJson(LatestDiagnosis instance) =>
    <String, dynamic>{
      'diagnosis': instance.diagnosis,
      'doctorName': instance.doctorName,
      'date': instance.date,
    };

ProfileStatus _$ProfileStatusFromJson(Map<String, dynamic> json) =>
    ProfileStatus(
      isInitialized: json['isInitialized'] as bool,
      bloodType: (json['bloodType'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileStatusToJson(ProfileStatus instance) =>
    <String, dynamic>{
      'isInitialized': instance.isInitialized,
      'bloodType': instance.bloodType,
    };

DashboardStatics _$DashboardStaticsFromJson(Map<String, dynamic> json) =>
    DashboardStatics(
      totalPrescriptions: (json['totalPrescriptions'] as num).toInt(),
      pendingPrescriptions: (json['pendingPrescriptions'] as num).toInt(),
      totalVisits: (json['totalVisits'] as num).toInt(),
      uniqueDoctors: (json['uniqueDoctors'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardStaticsToJson(DashboardStatics instance) =>
    <String, dynamic>{
      'totalPrescriptions': instance.totalPrescriptions,
      'pendingPrescriptions': instance.pendingPrescriptions,
      'totalVisits': instance.totalVisits,
      'uniqueDoctors': instance.uniqueDoctors,
    };

DashboardSummaryResponse _$DashboardSummaryResponseFromJson(
  Map<String, dynamic> json,
) => DashboardSummaryResponse(
  latestPrescription: json['latestPrescription'] == null
      ? null
      : LatestPrescription.fromJson(
          json['latestPrescription'] as Map<String, dynamic>,
        ),
  latestDiagnosis: json['latestDiagnosis'] == null
      ? null
      : LatestDiagnosis.fromJson(
          json['latestDiagnosis'] as Map<String, dynamic>,
        ),
  profileStatus: json['profileStatus'] == null
      ? null
      : ProfileStatus.fromJson(json['profileStatus'] as Map<String, dynamic>),
  statistics: json['statistics'] == null
      ? null
      : DashboardStatics.fromJson(json['statistics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DashboardSummaryResponseToJson(
  DashboardSummaryResponse instance,
) => <String, dynamic>{
  'latestPrescription': instance.latestPrescription,
  'latestDiagnosis': instance.latestDiagnosis,
  'profileStatus': instance.profileStatus,
  'statistics': instance.statistics,
};

DashboardSummaryPageResponse _$DashboardSummaryPageResponseFromJson(
  Map<String, dynamic> json,
) => DashboardSummaryPageResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? null
      : DashboardSummaryResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DashboardSummaryPageResponseToJson(
  DashboardSummaryPageResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
