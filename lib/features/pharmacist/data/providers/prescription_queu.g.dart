// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_queu.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(prescriptionQueue)
const prescriptionQueueProvider = PrescriptionQueueProvider._();

final class PrescriptionQueueProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PrescriptionQueueItem>>,
          List<PrescriptionQueueItem>,
          FutureOr<List<PrescriptionQueueItem>>
        >
    with
        $FutureModifier<List<PrescriptionQueueItem>>,
        $FutureProvider<List<PrescriptionQueueItem>> {
  const PrescriptionQueueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prescriptionQueueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prescriptionQueueHash();

  @$internal
  @override
  $FutureProviderElement<List<PrescriptionQueueItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PrescriptionQueueItem>> create(Ref ref) {
    return prescriptionQueue(ref);
  }
}

String _$prescriptionQueueHash() => r'4eba4077f7780d17d02506498e2feb796c3189da';
