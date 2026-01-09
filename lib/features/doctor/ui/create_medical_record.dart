import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/features/doctor/data/providers/medical_records.dart';
import 'package:health_app/features/doctor/data/requests/medical_record.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';

// class  extends ConsumerStatefulWidget {
//   const ({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _State();
// }

// class _State extends ConsumerState<> {

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

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

  // Step titles
  final List<String> _stepTitles = [
    'Diagnosis',
    'Symptoms',
    'Treatment Plan',
    'Additional Notes',
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
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create Medical Record - Step ${_currentStep + 1}/${_stepTitles.length}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            _stepTitles[_currentStep],
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (_currentStep + 1) / _stepTitles.length,
            backgroundColor: Colors.grey[200],
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      content: SizedBox(width: double.maxFinite, child: _buildStepContent()),
      actions: _buildActions(),
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
                labelText: 'Primary Diagnosis',
                hintText: 'Enter the main diagnosis',
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a diagnosis';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the primary medical condition or diagnosis.',
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
                labelText: 'Symptoms',
                hintText: 'List all symptoms separated by commas',
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the symptoms';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Describe the symptoms experienced by the patient.',
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
                labelText: 'Treatment Plan',
                hintText: 'Describe the treatment plan',
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a treatment plan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Outline the prescribed treatment, medication, and follow-up care.',
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
                labelText: 'Additional Notes',
                hintText: 'Any additional observations or recommendations',
                maxLines: 4,
              ),
              const SizedBox(height: 8),
              Text(
                'Add any other relevant information about the patient\'s condition.',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        );

      default:
        return Container();
    }
  }

  List<Widget> _buildActions() {
    return [
      // Cancel button
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),

      // Previous button (show only if not on first step)
      if (_currentStep > 0)
        TextButton(onPressed: _previousStep, child: const Text('Previous')),

      // Next/Submit button
      ElevatedButton(
        onPressed: _currentStep < _stepTitles.length - 1
            ? _nextStep
            : _submitRecord,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(
          _currentStep < _stepTitles.length - 1 ? 'Next' : 'Submit',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ];
  }

  void _nextStep() {
    if (_formKeys[_currentStep].currentState!.validate()) {
      setState(() {
        if (_currentStep < _stepTitles.length - 1) {
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

      AppDialog().loading(message: 'please wait, processing,,,');

      final res = await di<AppRepositories>().addMedicalRecord(record.toJson());
      AppDialog().dismiss();
      await ref
          .read(medicalRecordsStoreProvider.notifier)
          .addMedicalRecord(record);

      res.when(
        success: (s) {
          xlog(s);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Medical record created successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context, true); // Return success
        },
        error: (er) {
          xlog(er);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${er.msg}'),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    }
  }
}
