// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentPatients)
const recentPatientsProvider = RecentPatientsProvider._();

final class RecentPatientsProvider
    extends $AsyncNotifierProvider<RecentPatients, List<RecentPatient>> {
  const RecentPatientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentPatientsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentPatientsHash();

  @$internal
  @override
  RecentPatients create() => RecentPatients();
}

String _$recentPatientsHash() => r'91ea3d1e8c2f571e26bb6e14ef3cef44323e67af';

abstract class _$RecentPatients extends $AsyncNotifier<List<RecentPatient>> {
  FutureOr<List<RecentPatient>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<RecentPatient>>, List<RecentPatient>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RecentPatient>>, List<RecentPatient>>,
              AsyncValue<List<RecentPatient>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(doctorInsights)
const doctorInsightsProvider = DoctorInsightsProvider._();

final class DoctorInsightsProvider
    extends
        $FunctionalProvider<
          AsyncValue<DoctorDashboardInsight?>,
          DoctorDashboardInsight?,
          FutureOr<DoctorDashboardInsight?>
        >
    with
        $FutureModifier<DoctorDashboardInsight?>,
        $FutureProvider<DoctorDashboardInsight?> {
  const DoctorInsightsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'doctorInsightsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$doctorInsightsHash();

  @$internal
  @override
  $FutureProviderElement<DoctorDashboardInsight?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DoctorDashboardInsight?> create(Ref ref) {
    return doctorInsights(ref);
  }
}

String _$doctorInsightsHash() => r'34c4aec5dcc49426bac715bd8a541383e7258446';
