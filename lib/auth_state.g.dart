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

String _$appAuthHash() => r'874ae5a87b2a3ebe0f8306d8a7086760adda62e0';

@ProviderFor(AuthRecordState)
const authRecordStateProvider = AuthRecordStateProvider._();

final class AuthRecordStateProvider
    extends $NotifierProvider<AuthRecordState, AuthRecordData> {
  const AuthRecordStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRecordStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRecordStateHash();

  @$internal
  @override
  AuthRecordState create() => AuthRecordState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRecordData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRecordData>(value),
    );
  }
}

String _$authRecordStateHash() => r'46bb383090e89f9b559be59f5aaa6efe5ab576a0';

abstract class _$AuthRecordState extends $Notifier<AuthRecordData> {
  AuthRecordData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthRecordData, AuthRecordData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthRecordData, AuthRecordData>,
              AuthRecordData,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Account)
const accountProvider = AccountProvider._();

final class AccountProvider extends $NotifierProvider<Account, AccountState> {
  const AccountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[authRecordStateProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          AccountProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = authRecordStateProvider;

  @override
  String debugGetCreateSourceHash() => _$accountHash();

  @$internal
  @override
  Account create() => Account();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountState>(value),
    );
  }
}

String _$accountHash() => r'169c9a9031edab899b226ab98c98137adcc8ae1a';

abstract class _$Account extends $Notifier<AccountState> {
  AccountState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AccountState, AccountState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccountState, AccountState>,
              AccountState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
