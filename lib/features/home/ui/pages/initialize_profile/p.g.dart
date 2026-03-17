// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PProfile)
const pProfileProvider = PProfileProvider._();

final class PProfileProvider
    extends $NotifierProvider<PProfile, PatientProfileState> {
  const PProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pProfileProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[accountProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          PProfileProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = accountProvider;

  @override
  String debugGetCreateSourceHash() => _$pProfileHash();

  @$internal
  @override
  PProfile create() => PProfile();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatientProfileState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatientProfileState>(value),
    );
  }
}

String _$pProfileHash() => r'1fb070d8e9455ae3fd8bcb24592f832292efa808';

abstract class _$PProfile extends $Notifier<PatientProfileState> {
  PatientProfileState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PatientProfileState, PatientProfileState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PatientProfileState, PatientProfileState>,
              PatientProfileState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(currentStep)
const currentStepProvider = CurrentStepProvider._();

final class CurrentStepProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const CurrentStepProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentStepProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[pProfileProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          CurrentStepProvider.$allTransitiveDependencies0,
          CurrentStepProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = pProfileProvider;
  static const $allTransitiveDependencies1 =
      PProfileProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$currentStepHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return currentStep(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentStepHash() => r'ed16f4d7f54a81f1390d7fac7ccb243232b93501';

@ProviderFor(isLoading)
const isLoadingProvider = IsLoadingProvider._();

final class IsLoadingProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isLoadingProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[pProfileProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          IsLoadingProvider.$allTransitiveDependencies0,
          IsLoadingProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = pProfileProvider;
  static const $allTransitiveDependencies1 =
      PProfileProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$isLoadingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isLoading(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isLoadingHash() => r'9002456f2161e05024ae7b5421f8e10c5002e779';

@ProviderFor(profile)
const profileProvider = ProfileProvider._();

final class ProfileProvider
    extends $FunctionalProvider<PatientProfile, PatientProfile, PatientProfile>
    with $Provider<PatientProfile> {
  const ProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[pProfileProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          ProfileProvider.$allTransitiveDependencies0,
          ProfileProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = pProfileProvider;
  static const $allTransitiveDependencies1 =
      PProfileProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$profileHash();

  @$internal
  @override
  $ProviderElement<PatientProfile> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PatientProfile create(Ref ref) {
    return profile(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatientProfile value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatientProfile>(value),
    );
  }
}

String _$profileHash() => r'd0fa6752bf30d04dffa919825c5df3eaa060c178';

@ProviderFor(isInitialized)
const isInitializedProvider = IsInitializedProvider._();

final class IsInitializedProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsInitializedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isInitializedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isInitializedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isInitialized(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isInitializedHash() => r'12c62ab08d7a2e527dfd6be1758aad24f785e008';
