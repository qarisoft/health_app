// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HealthData)
const healthDataProvider = HealthDataProvider._();

final class HealthDataProvider
    extends $NotifierProvider<HealthData, Map<String, double>> {
  const HealthDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'healthDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$healthDataHash();

  @$internal
  @override
  HealthData create() => HealthData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, double> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, double>>(value),
    );
  }
}

String _$healthDataHash() => r'874873fcf3a1139c969e9eddf73a14556d4dcab3';

abstract class _$HealthData extends $Notifier<Map<String, double>> {
  Map<String, double> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, double>, Map<String, double>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, double>, Map<String, double>>,
              Map<String, double>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(PatientSelectedPageIndex)
const patientSelectedPageIndexProvider = PatientSelectedPageIndexProvider._();

final class PatientSelectedPageIndexProvider
    extends $NotifierProvider<PatientSelectedPageIndex, int> {
  const PatientSelectedPageIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientSelectedPageIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientSelectedPageIndexHash();

  @$internal
  @override
  PatientSelectedPageIndex create() => PatientSelectedPageIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$patientSelectedPageIndexHash() =>
    r'6729f24a9474e0b2fbd2571e6374547de9e8aebf';

abstract class _$PatientSelectedPageIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
