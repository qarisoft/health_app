import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:health_app/features/doctor/data/models/prescription.dart';

import '../../data/requests/prescription.dart'; // Adjust path as needed

class PrescriptionCard extends StatelessWidget {
  final PrescriptionRequest prescription;
  const PrescriptionCard({super.key, required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.medication, color: Colors.white),
        ),
        title: Text(
          prescription.diagnosis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat('yyyy-MM-dd – kk:mm').format(
            prescription.prescriptionDate ?? DateTime.now(),
          ),
          style: const TextStyle(fontSize: 12),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (prescription.notes != null && prescription.notes!.isNotEmpty) ...[
                  _infoRow(Icons.note_alt, 'Doctor\'s Notes', prescription.notes!),
                  const Divider(height: 24),
                ],
                const Text(
                  'Medications:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                // Loop through medication items
                ...prescription.items.map((item) => _medicationItemTile(item)),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Patient ID: ${prescription.patientId}',
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

  // Custom tile for each medication in the prescription
  Widget _medicationItemTile(PrescriptionItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.medicationName,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'Qty: ${item.quantity}',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('${item.dosage} — ${item.frequency}', style: const TextStyle(fontSize: 13)),
          if (item.instructions != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Instr: ${item.instructions}',
                style: TextStyle(fontSize: 12, color: Colors.grey[700], fontStyle: FontStyle.italic),
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