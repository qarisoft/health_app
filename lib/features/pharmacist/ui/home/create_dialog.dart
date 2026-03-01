// lib/features/prescription/presentation/pages/create_prescription_page.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/data/responses/base/base_response.dart';
import 'package:health_app/features/doctor/data/providers/search_patient.dart'
    show medicationSearchResultsProvider, MedicationSearchResult;
import 'package:health_app/features/pharmacist/data/providers/create_rescription.dart';
import 'package:health_app/features/pharmacist/data/providers/search_provider.dart';
import 'package:health_app/features/pharmacist/data/requests/create_prescription.dart';
import 'package:health_app/shared/functions.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
// import '../providers/prescription_provider.dart';

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
    // final key = GlobalKey<FormState>();
    whenComplete() {
      context.pop();
    }

    Future<void> onSubmit(
      // CreatePrescriptionRequest req,
      // VoidCallback whenComplete,
    ) async {
      final validation = formProvider.validate();

      if (validation != null) {
        AppDialog().show(
          type: DialogType.error,
          title: 'Form is not valid ',
          message: validation + formState.toString(),
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
        // try {
        // xlog(res.data);
        if (res2.success ?? false) {
          AppDialog()
              .show(type: DialogType.success, message: 'Success')
              .whenComplete(whenComplete);
        } else {
          // } catch (e) {
          AppDialog().show(
            type: DialogType.error,
            message: res2.message ?? 'server error',
          );
        }
        // }
      } catch (e) {
        AppDialog().dismiss();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Prescription'),
        actions: [
          // Expand/Collapse All Button
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
              tooltip: 'Expand/Collapse All',
            ),
          // Save Button
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: formProvider.isFormValid && !formState.isLoading
                ? () => _submitPrescription(ref, context)
                : null,
            tooltip: 'Save Prescription',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Info Widget
              _HeaderWidget(
                patient: formState.patient,
                doctor: formState.doctor,
                onUpdateDoctor: formProvider.updateDoctor,
                onUpdatePatient: formProvider.updatePatient,
              ),
              const SizedBox(height: 24),

              // Diagnosis Widget
              _DiagnosisWidget(
                diagnosis: formState.diagnosis,
                onDiagnosisChanged: (value) {
                  formProvider.updateDiagnosis(value);
                  formProvider.clearError();
                },
              ),
              const SizedBox(height: 32),

              // Medications Widget
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
                  // Expand the newly added item
                  final newIndex = formState.items.length - 1;
                  formProvider.closeItemExpansion(newIndex);
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onSubmit,
                // if (key.currentState!.validate()) {
                // onSubmitwhenComplete);
                // }
                child: Text('submit'),
              ),

              // Error Message
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
    // Show success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Prescription created successfully'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate back
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
      // Here you would call your repository/service
      // final request =
      formProvider.toRequest();

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
      );
    }
  }
}

// Header Widget
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
  int get patientId => widget.patient.id;
  int get doctorId => widget.doctor.id;
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
                    return SizedBox(
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
                final patients = ref.watch(searchDoctorsProvider);
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
                    return SizedBox(
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
            // Patient Section
            Expanded(
              child: GestureDetector(
                onTap: _handelOnPatientSearch,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Patient',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Flexible(
                        child: Text(
                          widget.patient.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(height: 40, width: 1, color: Colors.grey[300]),
            ),

            // Doctor Section
            Expanded(
              child: GestureDetector(
                onTap: handelOnDoctorSearch,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Doctor',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Flexible(
                        child: Text(
                          widget.doctor.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
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

// Diagnosis Widget
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
        const Text(
          'Diagnosis',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: diagnosis,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Enter patient diagnosis...',
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: onDiagnosisChanged,
        ),
      ],
    );
  }
}

// Medications Widget
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
        // Medications Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Medications',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  '$completedItems of $totalItems completed',
                  style: TextStyle(
                    fontSize: 14,
                    color: completedItems == totalItems
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
              ],
            ),
            // Quick Actions
            Row(
              children: [
                // Expand All Button
                Tooltip(
                  message: 'Expand All',
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
                // Collapse All Button
                Tooltip(
                  message: 'Collapse All',
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

        // Medications List
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _buildCollapsibleMedicationCard(index, widget.items[index]);
          },
        ),

        // Add Medication Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add_circle_outline, size: 20),
            label: const Text('Add New Medication'),
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
          // Header (Always visible)
          _buildMedicationHeader(index, item),

          // Collapsible Content
          if (item.isExpanded) _buildMedicationContent(index, item),
        ],
      ),
    );
  }

  void handelSearchDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        final k = GlobalKey<FormState>();
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(
              builder: (context, ref, child) {
                final drugs = ref.watch(medicationSearchResultsProvider);
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: Column(
                    children: [
                      Form(
                        key: k,
                        child: Column(
                          spacing: 6,
                          children: [
                            Row(children: [Text('search')]),
                            TextFormField(
                              controller: controller,
                              validator: notEmptyValidator,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          if (k.currentState!.validate()) {
                            // xlog('ssssssssssssssssssssssssssss');
                            // ref.invalidate(searchMedicationProvider(identifier: ''));
                            final dio = getDio;
                            final res = await dio.get(
                              '/Pharmacist/search-drugs?query=${controller.text}',
                            );
                            final data = res.data;
                            // xlog(data.toString());
                            xlog(data.runtimeType);
                            if (data.runtimeType == List) {
                              final d = (data as List<dynamic>)
                                  .map(
                                    (s) => MedicationSearchResult.fromJson(s),
                                  )
                                  .toList();
                              if (d.runtimeType ==
                                  List<MedicationSearchResult>) {
                                ref
                                    .read(
                                      medicationSearchResultsProvider.notifier,
                                    )
                                    .init(d);
                              }
                            }
                          }
                        },
                        child: Text('search'),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...drugs.map(
                                (m) => ListTile(
                                  onTap: () {
                                    widget.onUpdateItemDrug(
                                      index,
                                      IdName(
                                        name:
                                            m.brandName ?? m.chemicalName ?? '',
                                        id: m.drugId,
                                      ),
                                    );

                                    context.pop();
                                  },
                                  title: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: Row(
                                      children: [Text(m.brandName ?? '')],
                                    ),
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
            ),
          ),
        );
      },
    );
  }

  Widget _buildMedicationContent(int index, PrescriptionItemForm item) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildTextFieldRow(
            label: 'Drug ID',
            value: item.drug.name,
            readOnly: true,

            icon: Icons.medication_outlined,
            onChanged: (value) => {},
            // keyboardType: TextInputType.number,
            isRequired: true,
            labelLeading: IconButton(
              onPressed: () => handelSearchDialog(index),
              icon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _buildTextFieldRow(
                  label: 'Quantity',
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
                  label: 'Dosage',
                  value: item.dosage,
                  icon: Icons.scale_outlined,
                  onChanged: (value) =>
                      widget.onUpdateField(index, 'dosage', value),
                  hint: 'e.g., 500mg',
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
                  label: 'Frequency',
                  value: item.frequency,
                  icon: Icons.schedule_outlined,
                  onChanged: (value) =>
                      widget.onUpdateField(index, 'frequency', value),
                  hint: 'e.g., Twice daily',
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTextFieldRow(
                  label: 'Duration',
                  value: item.duration,
                  icon: Icons.calendar_today_outlined,
                  onChanged: (value) =>
                      widget.onUpdateField(index, 'duration', value),
                  hint: 'e.g., 7 days',
                  isRequired: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          _buildTextFieldRow(
            label: 'Special Instructions (Optional)',
            value: item.instructions,
            icon: Icons.info_outline,
            onChanged: (value) =>
                widget.onUpdateField(index, 'instructions', value),
            maxLines: 2,
          ),

          // Quick Actions
          if (item.isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.check, size: 16),
                    label: const Text('Done'),
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
        : 'New Medication';
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
        'Incomplete • Tap to edit',
        style: TextStyle(fontSize: 12, color: Colors.orange[700]),
      );
    } else {
      return const Text(
        'Empty • Tap to add details',
        style: TextStyle(fontSize: 12, color: Colors.grey),
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
          TextFormField(
            initialValue: value,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(icon, size: 20),
              border: const OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: maxLines > 1 ? 12 : 0,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            keyboardType: keyboardType,
            maxLines: maxLines,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
