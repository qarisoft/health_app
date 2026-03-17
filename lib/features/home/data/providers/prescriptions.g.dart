// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescriptions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientPrescriptions)
const patientPrescriptionsProvider = PatientPrescriptionsProvider._();

final class PatientPrescriptionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PrescriptionsResponse>,
          PrescriptionsResponse,
          FutureOr<PrescriptionsResponse>
        >
    with
        $FutureModifier<PrescriptionsResponse>,
        $FutureProvider<PrescriptionsResponse> {
  const PatientPrescriptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientPrescriptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientPrescriptionsHash();

  @$internal
  @override
  $FutureProviderElement<PrescriptionsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PrescriptionsResponse> create(Ref ref) {
    return patientPrescriptions(ref);
  }
}

String _$patientPrescriptionsHash() =>
    r'5733ffdebbb6e5cf2e86ed9efddc1ab625e49866';
