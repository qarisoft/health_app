// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientEmergency)
const patientEmergencyProvider = PatientEmergencyFamily._();

final class PatientEmergencyProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmergencyResponse>,
          EmergencyResponse,
          FutureOr<EmergencyResponse>
        >
    with
        $FutureModifier<EmergencyResponse>,
        $FutureProvider<EmergencyResponse> {
  const PatientEmergencyProvider._({
    required PatientEmergencyFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'patientEmergencyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$patientEmergencyHash();

  @override
  String toString() {
    return r'patientEmergencyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<EmergencyResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmergencyResponse> create(Ref ref) {
    final argument = this.argument as int;
    return patientEmergency(ref, userId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientEmergencyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$patientEmergencyHash() => r'52cedf01108e71043838cfad2a0a665bc324c5e4';

final class PatientEmergencyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<EmergencyResponse>, int> {
  const PatientEmergencyFamily._()
    : super(
        retry: null,
        name: r'patientEmergencyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PatientEmergencyProvider call({required int userId}) =>
      PatientEmergencyProvider._(argument: userId, from: this);

  @override
  String toString() => r'patientEmergencyProvider';
}
