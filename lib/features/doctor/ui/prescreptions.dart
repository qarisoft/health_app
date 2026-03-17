import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/doctor/data/providers/prescriptions.dart';
// import 'package:health_app/features/doctor/data/models/prescription.dart';
import 'package:health_app/features/doctor/data/requests/prescription.dart';
import 'package:health_app/features/doctor/data/responses/patient_response.dart'
    show PatientResponse;
import 'package:health_app/features/doctor/ui/create_prescription.dart';
import 'package:health_app/features/doctor/ui/medical_record.dart';
import 'package:health_app/features/doctor/ui/widgets/prescreption_card.dart';
import 'package:health_app/shared/ex.dart' show AppEx;
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/k.dart';

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
  }

  /// Opens search dialog and finds patient by ID or Code
  void _handleSearchPress() async {
    final identifier = await showDialog<String>(
      context: context,
      builder: (context) => const SingleInputDialog(),
    );
    AppDialog().loading();

    if (identifier != null && identifier.isNotEmpty) {
      final res = await appRepo.searchPatient(identifier);

      res.when(
        success: (json) {
          AppDialog().dismiss();
          final response = PatientResponse.fromJson(json);
          if (response.success) {
            _handleOnCreate(response.patient?.id ?? 1);
          }
          // final response = PatientProfileResponse.fromJson(json);
          // if (response.patient != null) {
          // }
        },
        error: (error) {
          AppDialog().dismiss();
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
          ? PrescriptionsEmptyScreen(onCreate: _handleSearchPress)
          : Scaffold(
              floatingActionButton: FloatingActionButton.extended(
                onPressed: _handleSearchPress,
                label: const Text('New Prescription'),
                icon: const Icon(Icons.add_moderator),
              ),
              body: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: patientIds.length,
                itemBuilder: (context, index) {
                  final patientId = patientIds[index];
                  final records = groupedPrescriptions[patientId]!;

                  return _buildPatientGroup(patientId, records);
                },
              ),
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

// class PrescriptionsEmptyScreen extends StatelessWidget {
//   const PrescriptionsEmptyScreen({super.key, required this.onCreate});
//
//   final VoidCallback onCreate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 32.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // 1. Adjusted Lottie size (since we removed the padding in the JSON)
//           Lottie.asset(
//             AppAssets.prescriptionsEmpty,
//             width: 250,
//             height: 250,
//             fit: BoxFit.contain,
//           ),
//
//           const SizedBox(height: 24),
//
//           // 2. Added a clear Title
//           Text(
//             'No Prescriptions',
//             style: Theme.of(
//               context,
//             ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 12),
//
//           // 3. Added descriptive Subtitle for better UX
//           Text(
//             'It looks like you haven’t added any prescriptions yet. Start by creating your first prescription.',
//             textAlign: TextAlign.center,
//             style: Theme.of(
//               context,
//             ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
//           ),
//
//           const SizedBox(height: 32),
//
//           // 4. Added a primary Action Button
//           ElevatedButton.icon(
//             onPressed: onCreate,
//             icon: const Icon(Icons.add),
//             label: const Text('Create New Prescription'),
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class PrescriptionsEmptyScreen extends StatelessWidget {
  const PrescriptionsEmptyScreen({super.key, required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.prescriptionsEmpty,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          Text(
            context.tr.noPrescriptions,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            context.tr.noPrescriptionsDescription,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: onCreate,
            icon: const Icon(Icons.add),
            label: Text(context.tr.createNewPrescription),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
