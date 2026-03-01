// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchPatients)
const searchPatientsProvider = SearchPatientsProvider._();

final class SearchPatientsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IdName>>,
          List<IdName>,
          FutureOr<List<IdName>>
        >
    with $FutureModifier<List<IdName>>, $FutureProvider<List<IdName>> {
  const SearchPatientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchPatientsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchPatientsHash();

  @$internal
  @override
  $FutureProviderElement<List<IdName>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<IdName>> create(Ref ref) {
    return searchPatients(ref);
  }
}

String _$searchPatientsHash() => r'a1db8334b471384d9de308dd1d0ef3644ad63f68';

@ProviderFor(searchDoctors)
const searchDoctorsProvider = SearchDoctorsProvider._();

final class SearchDoctorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IdName>>,
          List<IdName>,
          FutureOr<List<IdName>>
        >
    with $FutureModifier<List<IdName>>, $FutureProvider<List<IdName>> {
  const SearchDoctorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchDoctorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchDoctorsHash();

  @$internal
  @override
  $FutureProviderElement<List<IdName>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<IdName>> create(Ref ref) {
    return searchDoctors(ref);
  }
}

String _$searchDoctorsHash() => r'8d70dfd09657b1e4aba3d92302bd85e96627be96';
