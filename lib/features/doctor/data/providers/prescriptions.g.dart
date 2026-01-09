// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescriptions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PrescriptionsStore)
const prescriptionsStoreProvider = PrescriptionsStoreProvider._();

final class PrescriptionsStoreProvider
    extends $NotifierProvider<PrescriptionsStore, PrescriptionsList> {
  const PrescriptionsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prescriptionsStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prescriptionsStoreHash();

  @$internal
  @override
  PrescriptionsStore create() => PrescriptionsStore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PrescriptionsList value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PrescriptionsList>(value),
    );
  }
}

String _$prescriptionsStoreHash() =>
    r'2dd4d807c6474e90492460e7f3d2683d54a13643';

abstract class _$PrescriptionsStore extends $Notifier<PrescriptionsList> {
  PrescriptionsList build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PrescriptionsList, PrescriptionsList>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PrescriptionsList, PrescriptionsList>,
              PrescriptionsList,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
