import 'package:flutter/material.dart';
import 'package:health_app/shared/ex.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_layout.dart';

class MedicineScheduleCard extends StatefulWidget {
  const MedicineScheduleCard({super.key});

  @override
  State<MedicineScheduleCard> createState() => _MedicineScheduleCardState();
}

class _MedicineScheduleCardState extends State<MedicineScheduleCard> {
  // Mock data
  final List<Map<String, dynamic>> medicines = [
    {
      'name': 'Paracetamol',
      'dosage': '500mg',
      'time': '08:00 AM',
      'taken': false,
    },
    {
      'name': 'Vitamin C',
      'dosage': '1000mg',
      'time': '02:00 PM',
      'taken': false,
    },
    {
      'name': 'Antihistamine',
      'dosage': '10mg',
      'time': '08:00 PM',
      'taken': true,
    },
  ];

  // void _markAsTaken(int index) {
  //   setState(() {
  //     medicines[index]['taken'] = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;

    if (medicines.isEmpty) {
      return Padding(
        padding: AppLayout.paddingHorizontalMedium,
        child: Card(
          color: AppColors.medicineCard,
          child: Padding(
            padding: AppLayout.paddingAllLarge,
            child: Center(
              child: Text(
                localizations.noMedicineScheduled,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: AppLayout.paddingHorizontalMedium,
      child: Card(
        color: AppColors.medicineCard,
        child: Padding(
          padding: AppLayout.paddingAllMedium,
          child: Column(
            children: medicines.map((medicine) {
              final index = medicines.indexOf(medicine);
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == medicines.length - 1 ? 0 : AppLayout.marginMedium,
                ),
                child: ListTile(
                  // leading: Container(
                  //   width: 50,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.primaryLight,
                  //     borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
                  //   ),
                  //   child: const Icon(Icons.medication, color: AppColors.primary),
                  // ),
                  title: Text(
                    medicine['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  // subtitle: Text('${medicine['dosage']} • ${medicine['time']}'),
                  // trailing: medicine['taken']
                  //     ? const Chip(
                  //         label: Text('Taken'),
                  //         backgroundColor: AppColors.success,
                  //         labelStyle: TextStyle(color: Colors.white),
                  //       )
                  //     : CustomButton(
                  //         onPressed: () => _markAsTaken(index),
                  //         text: localizations.takeMedicine,
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 16,
                  //           vertical: 8,
                  //         ),
                  //       ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}