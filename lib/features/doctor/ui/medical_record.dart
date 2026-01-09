
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/doctor/data/providers/medical_records.dart';
import 'package:health_app/features/doctor/data/requests/medical_record.dart';
import 'package:health_app/features/doctor/ui/create_medical_record.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/ex.dart';
import 'package:intl/intl.dart';

final data = [
  MedicalRecordRequest(
    patientId: 32,
    diagnosis: 'sadsdasdsa',
    notes: 'dsadasdas',
    symptoms: 'dsadasdsa',
    treatment: 'dsadas',
    recordDate: DateTime.now(),
  ),
  MedicalRecordRequest(
    patientId: 33,
    diagnosis: 'sadsdasdsa',
    notes: 'dsadasdas',
    symptoms: 'dsadasdsa',
    treatment: 'dsadas',
    recordDate: DateTime.now(),
  ),
];

// Mock Data
final dataList = [
  MedicalRecordRequest(
    patientId: 32,
    diagnosis: 'Acute Gastritis',
    notes: 'Patient should avoid spicy food.',
    symptoms: 'Stomach pain, nausea',
    treatment: 'Antacids and rest',
    recordDate: DateTime.now(),
  ),
  MedicalRecordRequest(
    patientId: 33,
    diagnosis: 'Seasonal Influenza',
    notes: 'Monitor temperature every 4 hours.',
    symptoms: 'Fever, cough, body aches',
    treatment: 'Paracetamol and hydration',
    recordDate: DateTime.now().subtract(const Duration(days: 1)),
  ),
];

class DoctorMedicalRecord extends ConsumerStatefulWidget {
  const DoctorMedicalRecord({super.key});

  @override
  ConsumerState<DoctorMedicalRecord> createState() =>
      _DoctorMedicalRecordState();
}

class _DoctorMedicalRecordState extends ConsumerState<DoctorMedicalRecord> {
  // Logic to open creation dialog
  void handelOnCreate(int patientId) async {
    await showDialog(
      context: context,
      builder: (context) {
        return CreateMedicalRecordDialog(patientId: patientId);
      },
    );
    // Refresh logic could go here
  }

  // Logic for search button
  void handelOnPress() async {


    final id = await showDialog<String>(
      context: context,
      builder: (context) => const SingleInputDialog(),
    );

    if (id != null && id.isNotEmpty) {
      final res = await di<AppRepositories>().searchPatient(id);
      res.when(
        success: (json) {
          final p = PatientProfileResponse.fromJson(json);
          if (p.patient != null) {
            handelOnCreate(p.patient!.id);
          }
        },
        error: (error) => xlog(error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(medicalRecordsStoreProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Medical Records'), centerTitle: true),
      // List of records
      body: data.records.isEmpty
          ? const Center(child: Text('No records found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: data.records.length,
              itemBuilder: (context, index) {
                final record = data.records[index];
                return _MedicalRecordCard(record: record);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: handelOnPress,
        label: const Text('Create'),
        icon: const Icon(Icons.person_search),
      ),
    );
  }
}

// Separate Widget for the Card to keep code clean
class _MedicalRecordCard extends StatelessWidget {
  final MedicalRecordRequest record;
  const _MedicalRecordCard({required this.record});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.assignment, color: Colors.white),
        ),
        title: Text(
          record.diagnosis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat(
            'yyyy-MM-dd – kk:mm',
          ).format(record.recordDate ?? DateTime.now()),
          style: const TextStyle(fontSize: 12),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow(Icons.sick, 'Symptoms', record.symptoms),
                const Divider(),
                _infoRow(Icons.medical_services, 'Treatment', record.treatment),
                const Divider(),
                _infoRow(Icons.note, 'Notes', record.notes),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Patient ID: ${record.patientId}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87, fontSize: 14),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SingleInputDialog extends StatefulWidget {
  const SingleInputDialog({super.key});

  @override
  State<SingleInputDialog> createState() => _SingleInputDialogState();
}

class _SingleInputDialogState extends State<SingleInputDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Find Patient'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Identifier',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
      actions: [
        // TextButton(
        //   onPressed: () => Navigator.pop(context),
        //   child: const Text('Cancel'),
        // ),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              Navigator.pop(context, _controller.text);
            }
          },
          child: const Text('Submit'),
        ),
        SizedBox(height: 10),
        Center(
          child: TextButton(onPressed: () {}, child: const Text('Cancel')),
        ),
      ],
    );
  }
}
