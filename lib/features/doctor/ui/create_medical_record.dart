import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/doctor/data/requests/medical_record.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:health_app/shared/ex.dart';

class CreateMedicalRecordDialog extends ConsumerStatefulWidget {
  const CreateMedicalRecordDialog({super.key, required this.patientId});
  final int patientId;

  @override
  ConsumerState<CreateMedicalRecordDialog> createState() =>
      _CreateMedicalRecordDialogState();
}

class _CreateMedicalRecordDialogState
    extends ConsumerState<CreateMedicalRecordDialog> {
  final TextEditingController diagnosisController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController symptomsController = TextEditingController();
  final TextEditingController treatmentController = TextEditingController();

  // Step tracking
  int _currentStep = 0;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  void dispose() {
    diagnosisController.dispose();
    notesController.dispose();
    symptomsController.dispose();
    treatmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Step titles using localizations
    final List<String> stepTitles = [
      context.tr.medicalRecord, // Using 'Medical Record' for Diagnosis step title if specific one doesn't exist
      context.tr.medicalInformation, // Using 'Medical Information' for Symptoms
      context.tr.treatmentDetails, // 'Treatment Plan' -> 'Treatment Details'
      context.tr.additionalNotes, // 'Additional Notes'
    ];

    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.tr.createMedicalHistory} - ${context.tr.status} ${_currentStep + 1}/${stepTitles.length}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            stepTitles[_currentStep],
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (_currentStep + 1) / stepTitles.length,
            backgroundColor: Colors.grey[200],
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      content: SizedBox(width: double.maxFinite, child: _buildStepContent()),
      actions: _buildActions(stepTitles.length),
      scrollable: true,
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0: // Diagnosis
        return Form(
          key: _formKeys[0],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: diagnosisController,
                labelText: context.tr.medicalRecord,
                hintText: context.tr.enterNotes,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr.requiredField;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Text(
                context.tr.medicalInformation,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        );

      case 1: // Symptoms
        return Form(
          key: _formKeys[1],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: symptomsController,
                labelText: context.tr.medicalInformation,
                hintText: context.tr.enterNotes,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr.requiredField;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Text(
                context.tr.medicalInformation,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        );

      case 2: // Treatment Plan
        return Form(
          key: _formKeys[2],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: treatmentController,
                labelText: context.tr.treatmentDetails,
                hintText: context.tr.enterNotes,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr.requiredField;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Text(
                context.tr.treatmentDetails,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        );

      case 3: // Additional Notes
        return Form(
          key: _formKeys[3],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: notesController,
                labelText: context.tr.additionalNotes,
                hintText: context.tr.additionalNotesHint,
                maxLines: 4,
              ),
              const SizedBox(height: 8),
              Text(
                context.tr.additionalNotes,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        );

      default:
        return Container();
    }
  }

  List<Widget> _buildActions(int totalSteps) {
    return [
      // Cancel button
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(context.tr.cancel),
      ),

      // Previous button (show only if not on first step)
      if (_currentStep > 0)
        TextButton(onPressed: _previousStep, child: Text(context.tr.previous)),

      // Next/Submit button
      ElevatedButton(
        onPressed: _currentStep < totalSteps - 1
            ? _nextStep
            : _submitRecord,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(
          _currentStep < totalSteps - 1 ? context.tr.next : context.tr.confirm,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ];
  }

  void _nextStep() {
    if (_formKeys[_currentStep].currentState!.validate()) {
      setState(() {
        if (_currentStep < 3) {
          _currentStep++;
        }
      });
    }
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  Future<void> _submitRecord() async {
    if (_formKeys[_currentStep].currentState!.validate()) {
      final record = MedicalRecordRequest(
        patientId: widget.patientId,
        diagnosis: diagnosisController.text,
        notes: notesController.text,
        symptoms: symptomsController.text,
        treatment: treatmentController.text,
        recordDate: DateTime.now(),
      );

      AppDialog().loading(message: context.tr.loading);
      // TODO: Submit record logic
    }
  }
}
