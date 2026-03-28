// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientFullProfile)
const patientFullProfileProvider = PatientFullProfileProvider._();

final class PatientFullProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<ErrorOr<PatientFullProfile>>,
          ErrorOr<PatientFullProfile>,
          FutureOr<ErrorOr<PatientFullProfile>>
        >
    with
        $FutureModifier<ErrorOr<PatientFullProfile>>,
        $FutureProvider<ErrorOr<PatientFullProfile>> {
  const PatientFullProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientFullProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientFullProfileHash();

  @$internal
  @override
  $FutureProviderElement<ErrorOr<PatientFullProfile>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ErrorOr<PatientFullProfile>> create(Ref ref) {
    return patientFullProfile(ref);
  }
}

String _$patientFullProfileHash() =>
    r'0d5f21f817f76ed5110ad2832c5c5a2db2edad77';
