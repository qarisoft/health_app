import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/features/doctor/data/providers/prescriptions.dart';
// import 'package:health_app/features/doctor/data/models/prescription.dart';
import 'package:health_app/features/doctor/data/requests/prescription.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';

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

  final List<String> _stepTitles = ['Diagnosis & Notes', 'Medications'];

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
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prescription - Step ${_currentStep + 1}/2',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            _stepTitles[_currentStep],
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
    if (_currentStep == 0) {
      return Form(
        key: _formKeys[0],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: diagnosisController,
              labelText: 'Diagnosis',
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: notesController,
              labelText: 'Doctor Notes',
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
            const Text(
              'Current Items:',
              style: TextStyle(fontWeight: FontWeight.bold),
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
          // Add new medication form
          Form(
            key: _formKeys[1],
            child: Column(
              children: [
                CustomTextField(
                  controller: medNameController,
                  labelText: 'Medicine Name',
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: dosageController,
                        labelText: 'Dosage',
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: freqController,
                        labelText: 'Freq.',
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: instrController,
                  labelText: 'Instructions',
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: _addMedication,
                  icon: const Icon(Icons.add),
                  label: const Text('Add to List'),
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
        child: const Text('Cancel'),
      ),
      if (_currentStep > 0)
        TextButton(
          onPressed: () => setState(() => _currentStep--),
          child: const Text('Back'),
        ),
      ElevatedButton(
        onPressed: _currentStep == 0
            ? () {
                if (_formKeys[0].currentState!.validate())
                  setState(() => _currentStep++);
              }
            : _submitPrescription,
        child: Text(_currentStep == 0 ? 'Next' : 'Submit Prescription'),
      ),
    ];
  }

  Future<void> _submitPrescription() async {
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add at least one medicine')),
      );
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
    final res = await di<AppRepositories>().addPrescription(req.toJson());
    AppDialog().dismiss();

    res.when(
      success: (s) {
        ref.read(prescriptionsStoreProvider.notifier).addPrescription(req);
        Navigator.pop(context, true);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Success')));
      },
      error: (er) => xlog(er),
    );
  }
}
