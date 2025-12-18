import 'package:flutter/material.dart';
import 'package:health_app/features/patients/domain/models/medical_history.dart' show MedicalHistory;
import 'package:health_app/features/patients/repositories/medical_repo.dart' show MedicalHistoryRepository;
import 'package:health_app/features/patients/ui/a.dart' show MedicalHistoryForm;
import 'package:health_app/features/patients/ui/details.dart' show MedicalHistoryDetails;
// import '../widgets/medical_history_form.dart';
// import '../widgets/medical_history_details.dart';
// import '../models/medical_history.dart';
// import '../repositories/medical_history_repository.dart';

class MedicalHistoryPage extends StatefulWidget {
  const MedicalHistoryPage({super.key});

  @override
   State<MedicalHistoryPage> createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  final MedicalHistoryRepository _repository = MedicalHistoryRepository();
  MedicalHistory? _medicalHistory;
  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadMedicalHistory();
  }

  Future<void> _loadMedicalHistory() async {
    setState(() => _isLoading = true);
    
    // For demonstration, create a sample history
    // In real app, you would fetch from API/database
    final history = _repository.createSampleHistory();
    await _repository.saveMedicalHistory(history);
    
    setState(() {
      _medicalHistory = history;
      _isLoading = false;
    });
  }

  Future<void> _saveMedicalHistory(MedicalHistory history) async {
    setState(() => _isLoading = true);
    await _repository.saveMedicalHistory(history);
    setState(() {
      _medicalHistory = history;
      _isLoading = false;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical History'),
        actions: [
          if (_medicalHistory != null && !_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() => _isEditing = true);
              },
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _isEditing
              ? MedicalHistoryForm(
                  initialData: _medicalHistory,
                  onSave: _saveMedicalHistory,
                )
              : _medicalHistory != null
                  ? MedicalHistoryDetails(history: _medicalHistory!)
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No medical history found'),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() => _isEditing = true);
                            },
                            child: const Text('Create Medical History'),
                          ),
                        ],
                      ),
                    ),
      // floatingActionButton: _isEditing
      //     ? FloatingActionButton(
      //         onPressed: () {
      //           // Save logic is handled in the form
      //         },
      //         child: const Icon(Icons.save),
      //       )
      //     : null,
    );
  }
}