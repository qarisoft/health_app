import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/doctor/data/providers/prescriptions.dart';
// import 'package:health_app/features/doctor/data/models/prescription.dart';
import 'package:health_app/features/doctor/data/requests/prescription.dart';
import 'package:health_app/features/doctor/ui/create_prescription.dart';
import 'package:health_app/features/doctor/ui/medical_record.dart';
import 'package:health_app/features/doctor/ui/widgets/prescreption_card.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/auth_state.dart';

class PrescreptionsPage extends ConsumerStatefulWidget {
  const PrescreptionsPage({super.key});

  @override
  ConsumerState<PrescreptionsPage> createState() => _PrescreptionsPageState();
}

class _PrescreptionsPageState extends ConsumerState<PrescreptionsPage> {
  /// Opens the multi-step wizard to create a new prescription
  void _handleOnCreate(int patientId) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => CreatePrescriptionDialog(patientId: patientId),
    );

    // If a prescription was added, the provider should auto-update
    // via the notifier in your submit logic.
    if (result == true) {
      xlog("Prescription added for patient: $patientId");
    }
  }

  /// Opens search dialog and finds patient by ID or Code
  void _handleSearchPress() async {
    final identifier = await showDialog<String>(
      context: context,
      builder: (context) => const SingleInputDialog(),
    );

    if (identifier != null && identifier.isNotEmpty) {
      final res = await di<AppRepositories>().searchPatient(identifier);
      res.when(
        success: (json) {
          final response = PatientProfileResponse.fromJson(json);
          if (response.patient != null) {
            _handleOnCreate(response.patient!.id);
          }
        },
        error: (error) {
          xlog(error);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Patient not found: ${error.msg}')),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(prescriptionsStoreProvider);

    // Grouping Logic: Map<PatientID, List<Prescriptions>>
    final Map<int, List<PrescriptionRequest>> groupedPrescriptions = {};
    for (var p in data.prescriptions) {
      groupedPrescriptions.putIfAbsent(p.patientId, () => []).add(p);
    }

    final patientIds = groupedPrescriptions.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Prescriptions'),
        centerTitle: true,
        elevation: 0,
      ),
      body: data.prescriptions.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: patientIds.length,
              itemBuilder: (context, index) {
                final patientId = patientIds[index];
                final records = groupedPrescriptions[patientId]!;

                return _buildPatientGroup(patientId, records);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleSearchPress,
        label: const Text('New Prescription'),
        icon: const Icon(Icons.add_moderator),
      ),
    );
  }

  /// UI for empty state
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_edu, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No prescriptions found.',
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }

  /// UI for a group of prescriptions belonging to one patient
  Widget _buildPatientGroup(int patientId, List<PrescriptionRequest> records) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Group Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.person, size: 16, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Text(
                'Patient ID: $patientId',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              Chip(
                visualDensity: VisualDensity.compact,
                label: Text(
                  '${records.length} Records',
                  style: const TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // List of Cards for this patient
        ...records.map((r) => PrescriptionCard(prescription: r)),
        const SizedBox(height: 20), // Separation before next patient
      ],
    );
  }
}

