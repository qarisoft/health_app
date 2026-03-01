// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_rescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IdName _$IdNameFromJson(Map<String, dynamic> json) =>
    _IdName(name: json['name'] as String, id: (json['id'] as num).toInt());

Map<String, dynamic> _$IdNameToJson(_IdName instance) => <String, dynamic>{
  'name': instance.name,
  'id': instance.id,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PrescriptionForm)
const prescriptionFormProvider = PrescriptionFormFamily._();

final class PrescriptionFormProvider
    extends $NotifierProvider<PrescriptionForm, PrescriptionFormState> {
  const PrescriptionFormProvider._({
    required PrescriptionFormFamily super.from,
    required ({int patientId, int doctorId}) super.argument,
  }) : super(
         retry: null,
         name: r'prescriptionFormProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prescriptionFormHash();

  @override
  String toString() {
    return r'prescriptionFormProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PrescriptionForm create() => PrescriptionForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PrescriptionFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PrescriptionFormState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PrescriptionFormProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prescriptionFormHash() => r'65384b6d6818c41bec4bb171912ba9b51f1bf52f';

final class PrescriptionFormFamily extends $Family
    with
        $ClassFamilyOverride<
          PrescriptionForm,
          PrescriptionFormState,
          PrescriptionFormState,
          PrescriptionFormState,
          ({int patientId, int doctorId})
        > {
  const PrescriptionFormFamily._()
    : super(
        retry: null,
        name: r'prescriptionFormProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PrescriptionFormProvider call({
    required int patientId,
    required int doctorId,
  }) => PrescriptionFormProvider._(
    argument: (patientId: patientId, doctorId: doctorId),
    from: this,
  );

  @override
  String toString() => r'prescriptionFormProvider';
}

abstract class _$PrescriptionForm extends $Notifier<PrescriptionFormState> {
  late final _$args = ref.$arg as ({int patientId, int doctorId});
  int get patientId => _$args.patientId;
  int get doctorId => _$args.doctorId;

  PrescriptionFormState build({required int patientId, required int doctorId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      patientId: _$args.patientId,
      doctorId: _$args.doctorId,
    );
    final ref = this.ref as $Ref<PrescriptionFormState, PrescriptionFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PrescriptionFormState, PrescriptionFormState>,
              PrescriptionFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
