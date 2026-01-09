// ignore_for_file: dead_code

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

class DoctorMedicalRecord extends ConsumerStatefulWidget {
  const DoctorMedicalRecord({super.key});

  @override
  ConsumerState<DoctorMedicalRecord> createState() => _DoctorMedicalRecordState();
}

class _DoctorMedicalRecordState extends ConsumerState<DoctorMedicalRecord> {
  void handelOnCreate(int patientId) async {
    await showDialog(
      context: context,
      builder: (context) {
        return CreateMedicalRecordDialog(patientId: patientId);
      },
    );
  }

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
    final dataState = ref.watch(medicalRecordsStoreProvider);
    
    // --- Grouping Logic ---
    // Convert List<MedicalRecordRequest> to Map<int, List<MedicalRecordRequest>>
    final Map<int, List<MedicalRecordRequest>> groupedRecords = {};
    for (var record in dataState.records) {
      groupedRecords.putIfAbsent(record.patientId, () => []).add(record);
    }
    final patientIds = groupedRecords.keys.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Medical Records'), centerTitle: true),
      body: dataState.records.isEmpty
          ? const Center(child: Text('No records found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: patientIds.length,
              itemBuilder: (context, index) {
                final patientId = patientIds[index];
                final recordsForPatient = groupedRecords[patientId]!;

                return _PatientRecordGroup(
                  patientId: patientId,
                  records: recordsForPatient,
                );
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

/// A wrapper widget to show the Patient Header and their specific records
class _PatientRecordGroup extends StatelessWidget {
  final int patientId;
  final List<MedicalRecordRequest> records;

  const _PatientRecordGroup({required this.patientId, required this.records});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Patient Header
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Row(
            children: [
              const Icon(Icons.person, size: 20, color: Colors.blueGrey),
              const SizedBox(width: 8),
              Text(
                'Patient ID: $patientId',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
              const Spacer(),
              Text(
                '${records.length} records',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        // List of specific records for this patient
        ...records.map((record) => _MedicalRecordCard(record: record)).toList(),
        const Divider(height: 32, thickness: 1),
      ],
    );
  }
}

class _MedicalRecordCard extends StatelessWidget {
  final MedicalRecordRequest record;
  const _MedicalRecordCard({required this.record});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.assignment, color: Colors.white, size: 20),
        ),
        title: Text(
          record.diagnosis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat('yyyy-MM-dd – kk:mm').format(record.recordDate ?? DateTime.now()),
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
        Icon(icon, size: 18, color: Colors.grey[600]),
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
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Identifier',
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              Navigator.pop(context, _controller.text);
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}