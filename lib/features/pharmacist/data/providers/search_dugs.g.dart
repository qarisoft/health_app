// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dugs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchDrugs)
const searchDrugsProvider = SearchDrugsProvider._();

final class SearchDrugsProvider
    extends $NotifierProvider<SearchDrugs, SearchDrugsState> {
  const SearchDrugsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchDrugsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchDrugsHash();

  @$internal
  @override
  SearchDrugs create() => SearchDrugs();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchDrugsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchDrugsState>(value),
    );
  }
}

String _$searchDrugsHash() => r'68229b38334433b3aaebaf0943ff13245a89d1c1';

abstract class _$SearchDrugs extends $Notifier<SearchDrugsState> {
  SearchDrugsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SearchDrugsState, SearchDrugsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchDrugsState, SearchDrugsState>,
              SearchDrugsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
