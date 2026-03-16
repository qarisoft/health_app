// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientDashboardSummary)
const patientDashboardSummaryProvider = PatientDashboardSummaryProvider._();

final class PatientDashboardSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<DashboardSummaryPageResponse>,
          DashboardSummaryPageResponse,
          FutureOr<DashboardSummaryPageResponse>
        >
    with
        $FutureModifier<DashboardSummaryPageResponse>,
        $FutureProvider<DashboardSummaryPageResponse> {
  const PatientDashboardSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientDashboardSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientDashboardSummaryHash();

  @$internal
  @override
  $FutureProviderElement<DashboardSummaryPageResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DashboardSummaryPageResponse> create(Ref ref) {
    return patientDashboardSummary(ref);
  }
}

String _$patientDashboardSummaryHash() =>
    r'b0f19b1e2feb32fc8a2314e7ce8941f5f01344a2';
