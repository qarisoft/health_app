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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$pProfileHash() => r'cbb3aad6f8fc2e6ca29500d8ef5bdeb8945c7cb1';

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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$currentStepHash() => r'0501be3a89b5a2217bdd0183ddda92bf0e3d3ce2';

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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$isLoadingHash() => r'85f3d95729f5885dc699df9ea174122fb59aa26b';

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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$profileHash() => r'e76e59f6c8b331c745baa7cc965d76ec74856075';
