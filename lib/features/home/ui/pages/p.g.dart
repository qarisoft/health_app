// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
