// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_rescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) =>
    _PrescriptionItem(
      drugId: (json['drugId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      dosage: json['dosage'] as String,
      frequency: json['frequency'] as String,
      duration: json['duration'] as String,
      instructions: json['instructions'] as String?,
    );

Map<String, dynamic> _$PrescriptionItemToJson(_PrescriptionItem instance) =>
    <String, dynamic>{
      'drugId': instance.drugId,
      'quantity': instance.quantity,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'duration': instance.duration,
      'instructions': instance.instructions,
    };

_PrescriptionRequest _$PrescriptionRequestFromJson(Map<String, dynamic> json) =>
    _PrescriptionRequest(
      patientId: (json['patientId'] as num).toInt(),
      doctorId: (json['doctorId'] as num).toInt(),
      diagnosis: json['diagnosis'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => PrescriptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrescriptionRequestToJson(
  _PrescriptionRequest instance,
) => <String, dynamic>{
  'patientId': instance.patientId,
  'doctorId': instance.doctorId,
  'diagnosis': instance.diagnosis,
  'items': instance.items,
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

String _$prescriptionFormHash() => r'dcb604ba1beb7f07161e7802bf3fce928b4de4dd';

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
