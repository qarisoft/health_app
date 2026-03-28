import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/doctor/data/providers/prescriptions.dart';
import 'package:health_app/features/doctor/data/providers/search_patient.dart';
import 'package:health_app/features/doctor/data/requests/prescription.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog.dart';

class CreatePrescriptionDialog extends ConsumerStatefulWidget {
  const CreatePrescriptionDialog({super.key, required this.patientId});

  final int patientId;

  @override
  ConsumerState<CreatePrescriptionDialog> createState() =>
      _CreatePrescriptionDialogState();
}

class _CreatePrescriptionDialogState
    extends ConsumerState<CreatePrescriptionDialog> {
  // General Info Controllers
  final diagnosisController = TextEditingController();
  final notesController = TextEditingController();

  // Temporary Medication Item Controllers
  final medNameController = TextEditingController();
  final dosageController = TextEditingController();
  final freqController = TextEditingController();
  final instrController = TextEditingController();

  int _currentStep = 0;
  final List<PrescriptionItem> _items = [];
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  void dispose() {
    diagnosisController.dispose();
    notesController.dispose();
    medNameController.dispose();
    dosageController.dispose();
    freqController.dispose();
    instrController.dispose();
    super.dispose();
  }

  void _addMedication() {
    if (_formKeys[1].currentState!.validate()) {
      setState(() {
        _items.add(
          PrescriptionItem(
            medicationName: medNameController.text,
            dosage: dosageController.text,
            frequency: freqController.text,
            instructions: instrController.text,
          ),
        );
        // Clear item controllers for next medicine
        medNameController.clear();
        dosageController.clear();
        freqController.clear();
        instrController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> stepTitles = [
      '${context.tr.diagnosisLabel} & ${context.tr.notes}',
      context.tr.medications,
    ];

    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.tr.prescriptions} - ${context.tr.status} ${_currentStep + 1}/2',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            stepTitles[_currentStep],
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: (_currentStep + 1) / 2),
        ],
      ),
      content: SizedBox(width: double.maxFinite, child: _buildStepContent()),
      actions: _buildActions(),
      scrollable: true,
    );
  }

  Widget _buildStepContent() {
    final controller = TextEditingController();
    final k = GlobalKey<FormState>();

    void handelSearchDialog() {
      showDialog(
        context: context,
        builder: (context) {
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
                              Row(children: [Text(context.tr.search)]),
                              TextFormField(
                                controller: controller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.tr.requiredField;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            if (k.currentState!.validate()) {
                              final dio = appRepo.getDio();
                              final res = await dio.get(
                                '/Doctor/search-drugs?query=${controller.text}',
                              );
                              final data = res.data;
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
                                        medicationSearchResultsProvider
                                            .notifier,
                                      )
                                      .init(d);
                                }
                              }
                            }
                          },
                          child: Text(context.tr.search),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...drugs.map(
                                  (m) => ListTile(
                                    onTap: () {
                                      medNameController.text =
                                          m.brandName ?? m.scientificName ?? '';
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

    if (_currentStep == 0) {
      return Form(
        key: _formKeys[0],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: diagnosisController,
              labelText: context.tr.diagnosisLabel,
              validator: (v) => v!.isEmpty ? context.tr.requiredField : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: notesController,
              labelText: context.tr.notes,
              maxLines: 3,
            ),
          ],
        ),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // List of already added medications
          if (_items.isNotEmpty) ...[
            Text(
              '${context.tr.medications}:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ..._items.asMap().entries.map(
              (entry) => ListTile(
                title: Text(entry.value.medicationName),
                subtitle: Text(
                  '${entry.value.dosage} - ${entry.value.frequency}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => setState(() => _items.removeAt(entry.key)),
                ),
              ),
            ),
            const Divider(),
          ],

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: handelSearchDialog,
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),

          // Add new medication form
          Form(
            key: _formKeys[1],
            child: Column(
              children: [
                CustomTextField(
                  controller: medNameController,
                  labelText: context.tr.medicineName,
                  validator: (v) =>
                      v!.isEmpty ? context.tr.requiredField : null,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: dosageController,
                        labelText: context.tr.dosage,
                        validator: (v) =>
                            v!.isEmpty ? context.tr.requiredField : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: freqController,
                        labelText: context.tr.frequency,
                        validator: (v) =>
                            v!.isEmpty ? context.tr.requiredField : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: instrController,
                  labelText: context.tr.notes, // Instructions
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: _addMedication,
                  icon: const Icon(Icons.add),
                  label: Text(context.tr.addToList),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  List<Widget> _buildActions() {
    return [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(context.tr.cancel),
      ),
      if (_currentStep > 0)
        TextButton(
          onPressed: () => setState(() => _currentStep--),
          child: Text(context.tr.previous),
        ),
      ElevatedButton(
        onPressed: _currentStep == 0
            ? () {
                if (_formKeys[0].currentState!.validate()) {
                  setState(() => _currentStep++);
                }
              }
            : _submitPrescription,
        child: Text(_currentStep == 0 ? context.tr.next : context.tr.confirm),
      ),
    ];
  }

  Future<void> _submitPrescription() async {
    if (_items.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.tr.requiredField)));
      return;
    }

    final req = PrescriptionRequest(
      patientId: widget.patientId,
      diagnosis: diagnosisController.text,
      notes: notesController.text,
      items: _items,
      prescriptionDate: DateTime.now(),
    );

    AppDialog().loading();
    bool isOk = false;
    try {
      final res = await appRepo.addPrescription(req.toJson());
      res.when(
        success: (s) {
          ref.read(prescriptionsStoreProvider.notifier).addPrescription(req);
          isOk = true;
        },
        error: (er) => xlog(er),
      );
    } finally {
      AppDialog().dismiss();
      context.pop();
    }

    if (isOk) {
      showSuccess();
    }
  }

  void showSuccess() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(context.tr.success)));
  }
}
