import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/doctor/data/requests/medical_record.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog.dart';

import '../../../core/error/app_error.dart';
import '../data/providers/medical_records.dart';

class CreateMedicalRecordDialog extends ConsumerStatefulWidget {
  const CreateMedicalRecordDialog({super.key, required this.patientId});

  final int patientId;

  @override
  ConsumerState<CreateMedicalRecordDialog> createState() =>
      _CreateMedicalRecordDialogState();
}

class _CreateMedicalRecordDialogState
    extends ConsumerState<CreateMedicalRecordDialog> {
  final diagnosisController = TextEditingController();
  final notesController = TextEditingController();
  final symptomsController = TextEditingController();
  final treatmentController = TextEditingController();

  int _currentStep = 0;
  final List<GlobalKey<FormState>> _formKeys = List.generate(
    4,
    (_) => GlobalKey<FormState>(),
  );

  @override
  void dispose() {
    diagnosisController.dispose();
    notesController.dispose();
    symptomsController.dispose();
    treatmentController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_formKeys[_currentStep].currentState!.validate()) {
      if (_currentStep < 3) setState(() => _currentStep++);
    }
  }

  void _previousStep() {
    if (_currentStep > 0) setState(() => _currentStep--);
  }

  Future<void> _submitRecord() async {
    if (!_formKeys[_currentStep].currentState!.validate()) return;

    final record = MedicalRecordRequest(
      patientId: widget.patientId,
      diagnosis: diagnosisController.text,
      notes: notesController.text,
      symptoms: symptomsController.text,
      treatment: treatmentController.text,
      recordDate: DateTime.now(),
    );

    AppDialog().loading(message: context.tr.loading);
    final res = await appRepo.addMedicalRecord(record.toJson());
    AppDialog().dismiss();

    res.when(
      success: (s) {
        ref.read(medicalRecordsStoreProvider.notifier).addMedicalRecord(record);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr.successCreateRecord),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      },
      error: (er) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr.errorCreateRecord(er.msg)),
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> stepTitles = [
      context.tr.diagnosis,
      context.tr.symptoms,
      context.tr.treatmentDetails,
      context.tr.additionalNotes,
    ];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Header Section ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr.createMedicalHistory,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        context.tr.stepProgress(
                          _currentStep + 1,
                          stepTitles.length,
                        ),
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: (_currentStep + 1) / stepTitles.length,
              backgroundColor: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
              minHeight: 6,
            ),
            const SizedBox(height: 24),

            // --- Animated Content ---
            Flexible(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: KeyedSubtree(
                  key: ValueKey(_currentStep),
                  child: SingleChildScrollView(child: _buildStepContent()),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // --- Action Buttons ---
            Row(
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _previousStep,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(context.tr.previous),
                    ),
                  ),
                if (_currentStep > 0) const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _currentStep < stepTitles.length - 1
                        ? _nextStep
                        : _submitRecord,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _currentStep < stepTitles.length - 1
                          ? context.tr.next
                          : context.tr.confirm,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _stepWrapper(
          0,
          context.tr.diagnosis,
          diagnosisController,
          context.tr.enterDiagnosisHint,
          isRequired: true,
        );
      case 1:
        return _stepWrapper(
          1,
          context.tr.symptoms,
          symptomsController,
          context.tr.enterSymptomsHint,
          isRequired: true,
        );
      case 2:
        return _stepWrapper(
          2,
          context.tr.treatmentDetails,
          treatmentController,
          context.tr.enterTreatmentHint,
          isRequired: true,
        );
      case 3:
        return _stepWrapper(
          3,
          context.tr.additionalNotes,
          notesController,
          context.tr.additionalNotesHint,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _stepWrapper(
    int stepIdx,
    String label,
    TextEditingController controller,
    String hint, {
    bool isRequired = false,
  }) {
    return Form(
      key: _formKeys[stepIdx],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: controller,
            hintText: hint,
            maxLines: 5,
            validator: isRequired
                ? (value) => (value == null || value.isEmpty)
                      ? context.tr.requiredField
                      : null
                : null,
            labelText: '',
          ),
        ],
      ),
    );
  }
}
