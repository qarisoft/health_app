// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescriptions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Prescriptions)
const prescriptionsProvider = PrescriptionsProvider._();

final class PrescriptionsProvider
    extends $NotifierProvider<Prescriptions, List<Prescription>> {
  const PrescriptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prescriptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prescriptionsHash();

  @$internal
  @override
  Prescriptions create() => Prescriptions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Prescription> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Prescription>>(value),
    );
  }
}

String _$prescriptionsHash() => r'43ae219fb43ea37062c0e43fc81d7ac6d6353b93';

abstract class _$Prescriptions extends $Notifier<List<Prescription>> {
  List<Prescription> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Prescription>, List<Prescription>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Prescription>, List<Prescription>>,
              List<Prescription>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
