// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientDashboardSummary)
const patientDashboardSummaryProvider = PatientDashboardSummaryFamily._();

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
  const PatientDashboardSummaryProvider._({
    required PatientDashboardSummaryFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'patientDashboardSummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$patientDashboardSummaryHash();

  @override
  String toString() {
    return r'patientDashboardSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DashboardSummaryPageResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DashboardSummaryPageResponse> create(Ref ref) {
    final argument = this.argument as int;
    return patientDashboardSummary(ref, userId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientDashboardSummaryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$patientDashboardSummaryHash() =>
    r'1db7a7c59c77d8905d5d5eb5467c3798252d1258';

final class PatientDashboardSummaryFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<DashboardSummaryPageResponse>, int> {
  const PatientDashboardSummaryFamily._()
    : super(
        retry: null,
        name: r'patientDashboardSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PatientDashboardSummaryProvider call({required int userId}) =>
      PatientDashboardSummaryProvider._(argument: userId, from: this);

  @override
  String toString() => r'patientDashboardSummaryProvider';
}
