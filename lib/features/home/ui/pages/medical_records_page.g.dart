// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_records_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientMedicalRecords)
const patientMedicalRecordsProvider = PatientMedicalRecordsProvider._();

final class PatientMedicalRecordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ErrorOr<List<PatientMedicalRecord>>>,
          ErrorOr<List<PatientMedicalRecord>>,
          FutureOr<ErrorOr<List<PatientMedicalRecord>>>
        >
    with
        $FutureModifier<ErrorOr<List<PatientMedicalRecord>>>,
        $FutureProvider<ErrorOr<List<PatientMedicalRecord>>> {
  const PatientMedicalRecordsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientMedicalRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientMedicalRecordsHash();

  @$internal
  @override
  $FutureProviderElement<ErrorOr<List<PatientMedicalRecord>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ErrorOr<List<PatientMedicalRecord>>> create(Ref ref) {
    return patientMedicalRecords(ref);
  }
}

String _$patientMedicalRecordsHash() =>
    r'44c6654203907bd23ae54162a153406a751fc1ba';
