// lib/features/prescription/presentation/providers/prescription_provider.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../domain/models/prescription.dart';
// import '../requests/profile.dart';

part 'create_rescription.freezed.dart';
part 'create_rescription.g.dart';


@freezed
abstract class PrescriptionItem with _$PrescriptionItem {
  const factory PrescriptionItem({
    required int drugId,
    required int quantity,
    required String dosage,
    required String frequency,
    required String duration,
    String? instructions,
  }) = _PrescriptionItem;

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
}

@freezed
abstract class PrescriptionRequest with _$PrescriptionRequest {
  const factory PrescriptionRequest({
    required int patientId,
    required int doctorId,
    required String diagnosis,
    required List<PrescriptionItem> items,
  }) = _PrescriptionRequest;

  factory PrescriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionRequestFromJson(json);
}

@freezed
abstract class PrescriptionFormState with _$PrescriptionFormState {
  const factory PrescriptionFormState({
    required int patientId,
    required int doctorId,
    @Default('') String diagnosis,
    @Default([]) List<PrescriptionItemForm> items,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _PrescriptionFormState;
}

@freezed
abstract class PrescriptionItemForm with _$PrescriptionItemForm {
  const factory PrescriptionItemForm({
    @Default('') String drugId,
    @Default('') String quantity,
    @Default('') String dosage,
    @Default('') String frequency,
    @Default('') String duration,
    @Default('') String instructions,
    @Default(true) bool isExpanded,
  }) = _PrescriptionItemForm;

  const PrescriptionItemForm._();

  int? get drugIdInt => int.tryParse(drugId);
  int? get quantityInt => int.tryParse(quantity);
    bool get isComplete {
    return drugId.isNotEmpty &&
        drugIdInt != null &&
        quantity.isNotEmpty &&
        quantityInt != null &&
        dosage.isNotEmpty &&
        frequency.isNotEmpty &&
        duration.isNotEmpty;
  }
}

@riverpod
class PrescriptionForm extends _$PrescriptionForm {
  @override
  PrescriptionFormState build({
    required int patientId,
    required int doctorId,
  }) {
    return PrescriptionFormState(
      patientId: patientId,
      doctorId: doctorId,
      items: [PrescriptionItemForm()], // Start with one empty item
    );
  }

  void updateDiagnosis(String diagnosis) {
    state = state.copyWith(diagnosis: diagnosis);
  }

  void addNewItem() {
    state = state.copyWith(
      items: [...state.items, PrescriptionItemForm()],
    );
  }

  void removeItem(int index) {
    if (state.items.length > 1) {
      final newItems = List<PrescriptionItemForm>.from(state.items);
      newItems.removeAt(index);
      state = state.copyWith(items: newItems);
    }
  }

  void updateItemField({
    required int index,
    required String field,
    required String value,
  }) {
    final newItems = List<PrescriptionItemForm>.from(state.items);
    final oldItem = newItems[index];
    
    final updatedItem = oldItem.copyWith(
      drugId: field == 'drugId' ? value : oldItem.drugId,
      quantity: field == 'quantity' ? value : oldItem.quantity,
      dosage: field == 'dosage' ? value : oldItem.dosage,
      frequency: field == 'frequency' ? value : oldItem.frequency,
      duration: field == 'duration' ? value : oldItem.duration,
      instructions: field == 'instructions' ? value : oldItem.instructions,
    );
    
    newItems[index] = updatedItem;
    state = state.copyWith(items: newItems);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  bool get isFormValid {
    if (state.diagnosis.isEmpty) return false;
    
    for (final item in state.items) {
      if (item.drugId.isEmpty ||
          item.quantity.isEmpty ||
          item.dosage.isEmpty ||
          item.frequency.isEmpty ||
          item.duration.isEmpty) {
        return false;
      }
      
      if (item.drugIdInt == null || item.quantityInt == null) {
        return false;
      }
    }
    
    return true;
  }

  PrescriptionRequest toRequest() {
    return PrescriptionRequest(
      patientId: state.patientId,
      doctorId: state.doctorId,
      diagnosis: state.diagnosis,
      items: state.items.map((item) {
        return PrescriptionItem(
          drugId: item.drugIdInt!,
          quantity: item.quantityInt!,
          dosage: item.dosage,
          frequency: item.frequency,
          duration: item.duration,
          instructions: item.instructions.isNotEmpty ? item.instructions : null,
        );
      }).toList(),
    );
  }

  void toggleItemExpansion(int index) {
    final newItems = List<PrescriptionItemForm>.from(state.items);
    final item = newItems[index];
    newItems[index] = item.copyWith(isExpanded: !item.isExpanded);
    state = state.copyWith(items: newItems);
  }

  void expandAllItems() {
    final newItems = state.items.map((item) => item.copyWith(isExpanded: true)).toList();
    state = state.copyWith(items: newItems);
  }

  void collapseAllItems() {
    final newItems = state.items.map((item) => item.copyWith(isExpanded: false)).toList();
    state = state.copyWith(items: newItems);
  }
}