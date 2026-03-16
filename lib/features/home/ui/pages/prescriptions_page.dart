import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/features/home/data/providers/prescriptions.dart';

import '../../../pharmacist/domain/models/prescription.dart';
import '../../../pharmacist/ui/prescriptions/page.dart' show PrescriptionCard;

class PatientPrescriptionsScreen extends ConsumerStatefulWidget {
  const PatientPrescriptionsScreen({super.key});

  @override
  ConsumerState createState() => _PatientPrescriptionsScreenState();
}

class _PatientPrescriptionsScreenState
    extends ConsumerState<PatientPrescriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    final res = ref.watch(patientPrescriptionsProvider);
    // xlog(res);
    // return
    return Scaffold(
      appBar: AppBar(title: Text('Prescriptions')),
      body: res.when(
        data: (d) {
          xlog(d.prescriptions);
          final prescriptions = d.prescriptions;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: prescriptions.length,
            itemBuilder: (context, index) =>
                PrescriptionCard(prescription: prescriptions[index]),
          );
        },
        error: (e, s) {
          return SingleChildScrollView(child: Column());
        },
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}



class PrescriptionCard extends StatelessWidget {
  final Prescription prescription;

  const PrescriptionCard({super.key, required this.prescription});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: theme.dividerColor.withOpacity(0.1)),
      ),
      child: ExpansionTile(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        leading: CircleAvatar(
          backgroundColor:
          prescription.getStatus() == PrescriptionStatusEnum.dispensed
              ? Colors.blue
              : Colors.grey,
          child: Icon(
            Icons.person,
            // color: prescription.getStatus() == PrescriptionStatusEnum.dispensed
            //     ? Colors.blue
            //     : Colors.grey,
          ),
        ),
        title: Text(
          prescription.doctorName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("status: ${getPrescriptionStatusString(prescription.status)}"),
        // subtitle: Text("Diagnosis: ${prescription.diagnosis}"),
        // trailing: _buildPopupMenu(context, prescription),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: 8),
                if (prescription.diagnosis.isNotEmpty)
                  _buildInfoRow(
                    Icons.note_alt_outlined,
                    "Diagnosis",
                    prescription.diagnosis,
                  ),
                const SizedBox(height: 8),
                if (prescription.notes.isNotEmpty)
                  _buildInfoRow(
                    Icons.note_alt_outlined,
                    "Notes",
                    prescription.notes,
                  ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Medication Plan",
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...prescription.items.map(
                      (item) => _buildMedicationItem(context, item),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$label: $value",
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationItem(BuildContext context, PrescriptionItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.medication, color: Colors.blue, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.medicationName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${item.dosage} • ${item.frequency}",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
