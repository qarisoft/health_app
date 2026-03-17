// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$authRecordStateHash() => r'a0a3af5ea7f79ddb22f1e34dbe377a559f04fe08';

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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$accountHash() => r'986cf291bcaac6542c335ca2c65151d1c02361c0';

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
