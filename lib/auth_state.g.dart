// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appAuth)
const appAuthProvider = AppAuthProvider._();

final class AppAuthProvider
    extends $FunctionalProvider<AppAuthState, AppAuthState, AppAuthState>
    with $Provider<AppAuthState> {
  const AppAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appAuthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appAuthHash();

  @$internal
  @override
  $ProviderElement<AppAuthState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppAuthState create(Ref ref) {
    return appAuth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppAuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppAuthState>(value),
    );
  }
}

String _$appAuthHash() => r'13af55977ecd46230d4cf049e4f17770f6619e20';
