// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AllAcounts)
const allAcountsProvider = AllAcountsProvider._();

final class AllAcountsProvider
    extends $NotifierProvider<AllAcounts, AllAcountsState> {
  const AllAcountsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allAcountsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allAcountsHash();

  @$internal
  @override
  AllAcounts create() => AllAcounts();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AllAcountsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AllAcountsState>(value),
    );
  }
}

String _$allAcountsHash() => r'18cdd2c0032ba568ad57ef612c562d8525b3c83c';

abstract class _$AllAcounts extends $Notifier<AllAcountsState> {
  AllAcountsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AllAcountsState, AllAcountsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AllAcountsState, AllAcountsState>,
              AllAcountsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
