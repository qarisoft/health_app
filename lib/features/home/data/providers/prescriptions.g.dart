// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescriptions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientPrescriptions)
const patientPrescriptionsProvider = PatientPrescriptionsFamily._();

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
  const PatientPrescriptionsProvider._({
    required PatientPrescriptionsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'patientPrescriptionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$patientPrescriptionsHash();

  @override
  String toString() {
    return r'patientPrescriptionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PrescriptionsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PrescriptionsResponse> create(Ref ref) {
    final argument = this.argument as int;
    return patientPrescriptions(ref, userId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientPrescriptionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$patientPrescriptionsHash() =>
    r'4e4eacb3a11c25cad4cfd658b172fbe770ebe51c';

final class PatientPrescriptionsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PrescriptionsResponse>, int> {
  const PatientPrescriptionsFamily._()
    : super(
        retry: null,
        name: r'patientPrescriptionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PatientPrescriptionsProvider call({required int userId}) =>
      PatientPrescriptionsProvider._(argument: userId, from: this);

  @override
  String toString() => r'patientPrescriptionsProvider';
}
