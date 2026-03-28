// lib/features/prescription/presentation/pages/create_prescription_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/data/responses/base/base_response.dart';
import 'package:health_app/features/doctor/data/providers/search_patient.dart'
    show MedicationSearchResult;
import 'package:health_app/features/pharmacist/data/providers/create_rescription.dart';
import 'package:health_app/features/pharmacist/data/providers/search_provider.dart';
import 'package:health_app/shared/ex.dart' show AppEx, xlog;
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog.dart';

import '../widgets/search_drugs_dialog.dart' show SearchDrugsDialog;

class CreatePrescriptionPage extends ConsumerWidget {
  final int patientId;
  final int doctorId;

  const CreatePrescriptionPage({
    super.key,
    required this.patientId,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formProvider = ref.watch(
      prescriptionFormProvider(
        patientId: patientId,
        doctorId: doctorId,
      ).notifier,
    );

    final formState = ref.watch(
      prescriptionFormProvider(patientId: patientId, doctorId: doctorId),
    );

    whenComplete() {
      context.pop();
    }

    Future<void> onSubmit() async {
      final validation = formProvider.validate();

      if (validation != null) {
        AppDialog().show(
          type: DialogType.error,
          title: context.tr.formInvalid,
          message: validation,
        );
        return;
      }

      AppDialog().loading();

      final req = formProvider.toRequest();
      xlog(req.toJson());

      try {
        final res = await getDio.post(
          '/Pharmacist/create-prescription',
          data: req.toJson(),
        );
        AppDialog().dismiss();
        final res2 = GeneralStatusResponse.fromJson(res.data);
        if (res2.success ?? false) {
          AppDialog()
              .show(type: DialogType.success, message: context.tr.success)
              .whenComplete(whenComplete);
        } else {
          AppDialog().show(
            type: DialogType.error,
            message: res2.message ?? context.tr.serverError,
          );
        }
      } catch (e) {
        AppDialog().dismiss();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.createPrescription),
        actions: [
          if (formState.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.unfold_more),
              onPressed: () {
                if (formState.items.any((item) => !item.isExpanded)) {
                  formProvider.expandAllItems();
                } else {
                  formProvider.collapseAllItems();
                }
              },
              tooltip: context.tr.expandCollapseAll,
            ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: formProvider.isFormValid && !formState.isLoading
                ? () => _submitPrescription(ref, context)
                : null,
            tooltip: context.tr.savePrescription,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderWidget(
                patient: formState.patient,
                doctor: formState.doctor,
                onUpdateDoctor: formProvider.updateDoctor,
                onUpdatePatient: formProvider.updatePatient,
              ),
              const SizedBox(height: 24),
              _DiagnosisWidget(
                diagnosis: formState.diagnosis,
                onDiagnosisChanged: (value) {
                  formProvider.updateDiagnosis(value);
                  formProvider.clearError();
                },
              ),
              const SizedBox(height: 32),
              _MedicationsWidget(
                items: formState.items,
                onToggleExpand: formProvider.toggleItemExpansion,
                onRemoveItem: formProvider.removeItem,
                onUpdateField: formProvider.updateItemField2,
                onExpandAll: formProvider.expandAllItems,
                onCollapseAll: formProvider.collapseAllItems,
                onUpdateItemDrug: (index, idname) =>
                    formProvider.updateItemDrug(index: index, drug1: idname),
                onAddNew: () {
                  formProvider.addNewItem();
                  final newIndex = formState.items.length - 1;
                  formProvider.closeItemExpansion(newIndex);
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onSubmit,
                child: Text(context.tr.submit),
              ),
              if (formState.errorMessage != null) ...[
                _buildErrorMessage(formState.errorMessage!),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red[100]!),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void onSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.tr.prescriptionCreatedSuccess),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context, true);
  }

  Future<void> _submitPrescription(WidgetRef ref, BuildContext context) async {
    final formProvider = ref.read(
      prescriptionFormProvider(
        patientId: patientId,
        doctorId: doctorId,
      ).notifier,
    );

    try {
      formProvider.toRequest();
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${context.tr.error}: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class _HeaderWidget extends StatefulWidget {
  final IdName patient;
  final IdName doctor;
  final Function(IdName p) onUpdatePatient;
  final Function(IdName d) onUpdateDoctor;

  const _HeaderWidget({
    required this.onUpdatePatient,
    required this.onUpdateDoctor,
    required this.patient,
    required this.doctor,
  });

  @override
  State<_HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget> {
  void _handelOnPatientSearch() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(
              builder: (context, ref, child) {
                final patients = ref.watch(searchPatientsProvider);
                return patients.when(
                  data: (List<IdName> data) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...data.map(
                                    (m) => ListTile(
                                      onTap: () {
                                        widget.onUpdatePatient(m);
                                        context.pop();
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                        ),
                                        child: Row(children: [Text(m.name)]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    return SizedBox(child: Text(error.toString()));
                  },
                  loading: () {
                    return const SizedBox(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void handelOnDoctorSearch() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(
              builder: (context, ref, child) {
                final doctors = ref.watch(searchDoctorsProvider);
                return doctors.when(
                  data: (List<IdName> data) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...data.map(
                                    (m) => ListTile(
                                      onTap: () {
                                        widget.onUpdateDoctor(m);
                                        context.pop();
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                        ),
                                        child: Row(children: [Text(m.name)]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    return SizedBox(child: Text(error.toString()));
                  },
                  loading: () {
                    return const SizedBox(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: _handelOnPatientSearch,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.tr.patient,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      widget.patient.id == 0
                          ? Icon(Icons.add)
                          : Text(
                              widget.patient.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(height: 40, width: 1, color: Colors.grey[300]),
            ),
            Expanded(
              child: GestureDetector(
                onTap: handelOnDoctorSearch,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.tr.doctor,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      widget.doctor.id == 0
                          ? Icon(Icons.add)
                          : Text(
                              widget.doctor.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiagnosisWidget extends StatelessWidget {
  final String diagnosis;
  final ValueChanged<String> onDiagnosisChanged;

  const _DiagnosisWidget({
    required this.diagnosis,
    required this.onDiagnosisChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr.diagnosis,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: diagnosis,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: context.tr.enterDiagnosisHint,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: onDiagnosisChanged,
        ),
      ],
    );
  }
}

class _MedicationsWidget extends StatefulWidget {
  final List<PrescriptionItemForm> items;
  final Function(int) onToggleExpand;
  final Function(int) onRemoveItem;
  final void Function(int, String, String) onUpdateField;
  final void Function(int, IdName) onUpdateItemDrug;
  final VoidCallback onExpandAll;
  final VoidCallback onCollapseAll;
  final VoidCallback onAddNew;

  const _MedicationsWidget({
    required this.items,
    required this.onToggleExpand,
    required this.onRemoveItem,
    required this.onUpdateField,
    required this.onExpandAll,
    required this.onCollapseAll,
    required this.onAddNew,
    required this.onUpdateItemDrug,
  });

  @override
  State<_MedicationsWidget> createState() => _MedicationsWidgetState();
}

class _MedicationsWidgetState extends State<_MedicationsWidget> {
  @override
  Widget build(BuildContext context) {
    final completedItems = widget.items.where((item) => item.isComplete).length;
    final totalItems = widget.items.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr.medications,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  context.tr.itemsCompleted(completedItems, totalItems),
                  style: TextStyle(
                    fontSize: 14,
                    color: completedItems == totalItems
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Tooltip(
                  message: context.tr.expandAll,
                  child: IconButton(
                    icon: const Icon(Icons.expand, size: 20),
                    onPressed: widget.onExpandAll,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Tooltip(
                  message: context.tr.collapseAll,
                  child: IconButton(
                    icon: const Icon(Icons.compress, size: 20),
                    onPressed: widget.onCollapseAll,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _buildCollapsibleMedicationCard(index, widget.items[index]);
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add_circle_outline, size: 20),
            label: Text(context.tr.addNewMedication),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.blue[50],
              foregroundColor: Colors.blue[700],
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.blue.shade100),
              ),
            ),
            onPressed: widget.onAddNew,
          ),
        ),
      ],
    );
  }

  Widget _buildCollapsibleMedicationCard(int index, PrescriptionItemForm item) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: item.isComplete ? Colors.green.shade100 : Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          _buildMedicationHeader(index, item),
          if (item.isExpanded) _buildMedicationContent(index, item),
        ],
      ),
    );
  }

  void handelSearchDialog(int index) async {
    final MedicationSearchResult? selectedDrug =
        await showDialog<MedicationSearchResult>(
          context: context,
          builder: (context) => const SearchDrugsDialog(),
        );

    // If the user tapped outside the dialog or hit the close button, it returns null
    if (selectedDrug != null) {
      print('User selected: ${selectedDrug.brandName}');
      widget.onUpdateItemDrug(
        index,
        IdName(
          name: selectedDrug.brandName ?? selectedDrug.chemicalName ?? '',
          id: selectedDrug.drugId,
        ),
      );
      // Do something with the selected drug (e.g., add to a prescription list)
    }
  }

  Widget _buildMedicationContent(int index, PrescriptionItemForm item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          _buildTextFieldRow(
            label: context.tr.drugName,
            value: item.drug.name,
            readOnly: true,
            icon: Icons.medication_outlined,
            onChanged: (value) => {},
            isRequired: true,
            labelLeading: IconButton(
              onPressed: () => handelSearchDialog(index),
              icon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildTextFieldRow(
                  label: context.tr.quantity,
                  value: item.quantity,
                  icon: Icons.format_list_numbered,
                  onChanged: (value) =>
                      widget.onUpdateField(index, 'quantity', value),
                  keyboardType: TextInputType.number,
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTextFieldRow(
                  label: context.tr.dosage,
                  value: item.dosage,
                  icon: Icons.scale_outlined,
                  onChanged: (value) =>
                      widget.onUpdateField(index, 'dosage', value),
                  hint: context.tr.dosageHint,
                  isRequired: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildTextFieldRow(
                  label: context.tr.frequency,
                  value: item.frequency,
                  icon: Icons.schedule_outlined,
                  onChanged: (value) =>
                      widget.onUpdateField(index, 'frequency', value),
                  hint: context.tr.frequencyHint,
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTextFieldRow(
                  label: context.tr.duration,
                  value: item.duration,
                  icon: Icons.calendar_today_outlined,
                  onChanged: (value) =>
                      widget.onUpdateField(index, 'duration', value),
                  hint: context.tr.durationHint,
                  isRequired: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTextFieldRow(
            label: context.tr.specialInstructions,
            value: item.instructions,
            icon: Icons.info_outline,
            onChanged: (value) =>
                widget.onUpdateField(index, 'instructions', value),
            maxLines: 2,
          ),
          if (item.isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.check, size: 16),
                    label: Text(context.tr.done),
                    onPressed: () => widget.onToggleExpand(index),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMedicationHeader(int index, PrescriptionItemForm item) {
    return Container(
      color: item.isExpanded ? Colors.blue[50] : Colors.grey[50],
      child: ListTile(
        leading: _buildMedicationStatusIcon(item),
        title: _buildMedicationTitle(index, item),
        subtitle: _buildMedicationSubtitle(item),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!item.isExpanded && item.isComplete)
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.check_circle, color: Colors.green, size: 16),
              ),
            IconButton(
              icon: Icon(
                item.isExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.blue,
              ),
              onPressed: () => widget.onToggleExpand(index),
              style: IconButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
              ),
            ),
            if (widget.items.length > 1)
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 18),
                onPressed: () => widget.onRemoveItem(index),
                color: Colors.red,
                style: IconButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                ),
              ),
          ],
        ),
        onTap: () => widget.onToggleExpand(index),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildMedicationStatusIcon(PrescriptionItemForm item) {
    if (item.isComplete) {
      return const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.green,
        child: Icon(Icons.check, size: 16, color: Colors.white),
      );
    } else if (item.drugId.isNotEmpty || item.dosage.isNotEmpty) {
      return const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.orange,
        child: Icon(Icons.edit, size: 16, color: Colors.white),
      );
    } else {
      return const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.grey,
        child: Icon(Icons.add, size: 16, color: Colors.white),
      );
    }
  }

  Widget _buildMedicationTitle(int index, PrescriptionItemForm item) {
    final drugName = item.drug.name.isNotEmpty
        ? item.drug.name
        : context.tr.newMedication;
    return Text(
      '${index + 1}. $drugName',
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
    );
  }

  Widget _buildMedicationSubtitle(PrescriptionItemForm item) {
    if (!item.isExpanded && item.isComplete) {
      return Text(
        '${item.dosage} • ${item.frequency} • ${item.duration}',
        style: const TextStyle(fontSize: 12),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    } else if (item.drugId.isNotEmpty || item.dosage.isNotEmpty) {
      return Text(
        context.tr.incompleteTapToEdit,
        style: TextStyle(fontSize: 12, color: Colors.orange[700]),
      );
    } else {
      return Text(
        context.tr.emptyTapToAdd,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      );
    }
  }

  Widget _buildTextFieldRow({
    required String label,
    required String value,
    required IconData icon,
    required ValueChanged<String> onChanged,
    Widget? labelLeading,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? hint,
    bool isRequired = false,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            if (isRequired)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text('*', style: TextStyle(color: Colors.red)),
              ),
            if (labelLeading != null) labelLeading,
          ],
        ),
        const SizedBox(height: 4),
        if (readOnly) Row(children: [Text(value.isNotEmpty ? value : '...')]),
        if (!readOnly)
          CustomTextField(
            initialValue: value,
            isCompact: true,
            prefixIcon: icon,

            // decoration: InputDecoration(
            //   hintText: hint,
            //   prefixIcon: Icon(icon, size: 20),
            //   border: const OutlineInputBorder(),
            //   contentPadding: EdgeInsets.symmetric(
            //     horizontal: 12,
            //     vertical: maxLines > 1 ? 12 : 0,
            //   ),
            //   filled: true,
            //   fillColor: Colors.white,
            // ),
            keyboardType: keyboardType,
            maxLines: maxLines,
            onChanged: onChanged,
            // labelText: label ?? '',
            hintText: hint ?? label,
          ),
      ],
    );
  }
}
