import 'package:flutter/material.dart';
import 'package:health_app/shared/ex.dart';

import '../../domain/patient.dart' show Patient;
// import '../models/patient.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PatientCard({
    super.key,
    required this.patient,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        patient.phoneNumber,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: patient.isActive
                        ? Colors.green[50]
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: patient.isActive ? Colors.green : Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    patient.isActive
                        ? localizations.active
                        : localizations.inactive,
                    style: TextStyle(
                      fontSize: 12,
                      color: patient.isActive ? Colors.green : Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Patient Details
            Row(
              children: [
                Icon(Icons.badge, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  patient.nationalId,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const Spacer(),
                if (patient.gender != null)
                  Row(
                    children: [
                      Icon(
                        patient.gender == 'male'
                            ? Icons.male
                            : patient.gender == 'female'
                            ? Icons.female
                            : Icons.transgender,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        patient.gender == 'male'
                            ? localizations.male
                            : patient.gender == 'female'
                            ? localizations.female
                            : localizations.other,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
              ],
            ),

            if (patient.bloodType != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.bloodtype, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Text(
                    '${localizations.bloodType}: ${patient.bloodType}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ],

            if (patient.dateOfBirth != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.cake, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Text(
                    '${localizations.dateOfBirth}: ${patient.dateOfBirth!.day}/${patient.dateOfBirth!.month}/${patient.dateOfBirth!.year}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ],

            // Actions
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onView,
                  icon: const Icon(Icons.remove_red_eye, color: Colors.blue),
                  tooltip: localizations.view,
                ),
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, color: Colors.green),
                  tooltip: localizations.edit,
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete, color: Colors.red),
                  tooltip: localizations.delete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
