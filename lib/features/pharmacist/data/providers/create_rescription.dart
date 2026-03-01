// lib/features/prescription/presentation/providers/prescription_provider.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../requests/create_prescription.dart';
// import '../../domain/models/prescription.dart';
// import '../requests/profile.dart';

part 'create_rescription.freezed.dart';
part 'create_rescription.g.dart';

@freezed
abstract class IdName with _$IdName {
  factory IdName({required String name, required int id}) = _IdName;

  factory IdName.fromJson(Map<String, dynamic> json) => _$IdNameFromJson(json);
  factory IdName.empty() => IdName(id: 0, name: '');
}

@freezed
abstract class PrescriptionFormState with _$PrescriptionFormState {
  const factory PrescriptionFormState({
    required int patientId,
    required IdName patient,
    required IdName doctor,
    required int doctorId,
    @Default('') String diagnosis,
    // @Default('') String diagnosis,
    @Default([]) List<PrescriptionItemForm> items,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _PrescriptionFormState;
}

// const idname = IdName.empty();
@freezed
abstract class PrescriptionItemForm with _$PrescriptionItemForm {
  const factory PrescriptionItemForm({
    @Default('') String drugId,
    // @Default('') String drugName,
    required IdName drug,
    @Default('') String quantity,
    @Default('') String dosage,
    @Default('') String frequency,
    @Default('') String duration,
    @Default('') String instructions,
    @Default(true) bool isExpanded,
  }) = _PrescriptionItemForm;

  factory PrescriptionItemForm.empty() =>
      PrescriptionItemForm(drug: IdName.empty());

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
  PrescriptionFormState build({required int patientId, required int doctorId}) {
    return PrescriptionFormState(
      patientId: patientId,
      doctorId: doctorId,
      items: [
        PrescriptionItemForm(drug: IdName.empty()),
      ], // Start with one empty item
      doctor: IdName.empty(),
      patient: IdName.empty(),
    );
  }

  void updateDiagnosis(String diagnosis) {
    state = state.copyWith(diagnosis: diagnosis);
  }

  void updatePatient(IdName p) {
    state = state.copyWith(patient: p);
  }

  void updateDoctor(IdName p) {
    state = state.copyWith(doctor: p);
  }

  void addNewItem() {
    state = state.copyWith(
      items: [...state.items, PrescriptionItemForm.empty()],
    );
  }

  void removeItem(int index) {
    if (state.items.length > 1) {
      final newItems = List<PrescriptionItemForm>.from(state.items);
      newItems.removeAt(index);
      state = state.copyWith(items: newItems);
    }
  }

  void updateItemDrug({required int index, required IdName drug1}) {
    final newItems = List<PrescriptionItemForm>.from(state.items);
    final oldItem = newItems[index];

    final updatedItem = oldItem.copyWith(
      drug: drug1,
      drugId: drug1.id.toString(),
    );

    newItems[index] = updatedItem;
    state = state.copyWith(items: newItems);
  }

  void updateItemField({
    required int index,
    required String field,
    required String value,
  }) {
    final newItems = List<PrescriptionItemForm>.from(state.items);
    final oldItem = newItems[index];
    // final drug1 = oldItem.drug.c

    final updatedItem = oldItem.copyWith(
      drugId: field == 'drugId' ? value : oldItem.drugId,
      // drug: field == 'drugId'
      //     ? oldItem.drug.copyWith(id: int.tryParse(value) ?? oldItem.drug.id)
      //     : oldItem.drug,
      quantity: field == 'quantity' ? value : oldItem.quantity,
      dosage: field == 'dosage' ? value : oldItem.dosage,
      frequency: field == 'frequency' ? value : oldItem.frequency,
      duration: field == 'duration' ? value : oldItem.duration,
      instructions: field == 'instructions' ? value : oldItem.instructions,
    );

    newItems[index] = updatedItem;
    state = state.copyWith(items: newItems);
  }

  void updateItemField2(int index, String field, String value) {
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
      if (item.drug.id != 0 ||
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

  String? validate() {
    if (state.diagnosis.isEmpty) return 'Diagnosis isEmpty';
    if (state.patient.id == 0) return 'Patient isEmpty';
    if (state.doctor.id == 0) return 'Doctor isEmpty';
    int i = 0;
    for (final item in state.items) {
      i++;
      if (item.drug.id == 0) {
        return 'item $i drug is Empty';
      }
      if (item.quantity.isEmpty) {
        return 'item $i quantity is Empty';
      }
      if (item.dosage.isEmpty) {
        return 'item $i dosage is Empty';
      }
      if (item.frequency.isEmpty) {
        return 'item $i frequency is Empty';
      }
      if (item.duration.isEmpty) {
        return 'item $i duration is Empty';
      }
    }

    return null;
  }

  CreatePrescriptionRequest toRequest() {
    return CreatePrescriptionRequest(
      patientId: state.patient.id,
      doctorId: state.doctor.id,
      diagnosis: state.diagnosis,
      items: state.items.map((item) {
        return PrescriptionItem(
          drugId: item.drug.id,
          quantity: item.quantityInt!,
          dosage: item.dosage,
          frequency: item.frequency,
          duration: item.duration,
          instructions: item.instructions,
          drugName: item.drug.name,
          // instructions: item.instructions.isNotEmpty ? item.instructions : '',
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

  void closeItemExpansion(int index) {
    final newItems = List<PrescriptionItemForm>.from(state.items);
    final item = newItems[index];
    if (item.isExpanded) {
      newItems[index] = item.copyWith(isExpanded: !item.isExpanded);
      state = state.copyWith(items: newItems);
    }
  }

  void expandAllItems() {
    final newItems = state.items
        .map((item) => item.copyWith(isExpanded: true))
        .toList();
    state = state.copyWith(items: newItems);
  }

  void collapseAllItems() {
    final newItems = state.items
        .map((item) => item.copyWith(isExpanded: false))
        .toList();
    state = state.copyWith(items: newItems);
  }
}
