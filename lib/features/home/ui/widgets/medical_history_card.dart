import 'package:flutter/material.dart';
// import 'package:health_app/l10n/app_localizations.dart';
import 'package:health_app/shared/ex.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_layout.dart';

class MedicalHistoryCard extends StatelessWidget {
  const MedicalHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;
    
    // Mock data - in real app, this would come from a repository
    final medicalHistory = [
      {'date': '2024-01-15', 'diagnosis': 'Common Cold', 'doctor': 'Dr. Smith'},
      {'date': '2023-12-10', 'diagnosis': 'Annual Checkup', 'doctor': 'Dr. Johnson'},
      {'date': '2023-11-05', 'diagnosis': 'Flu Vaccination', 'doctor': 'Dr. Williams'},
    ];

    if (medicalHistory.isEmpty) {
      return Padding(
        padding: AppLayout.paddingHorizontalMedium,
        child: Card(
          color: AppColors.historyCard,
          child: Padding(
            padding: AppLayout.paddingAllLarge,
            child: Center(
              child: Text(
                localizations.noMedicalHistory,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: AppLayout.paddingHorizontalMedium,
        itemCount: medicalHistory.length,
        itemBuilder: (context, index) {
          final history = medicalHistory[index];
          return Container(
            width: 280,
            margin: const EdgeInsets.only(right: AppLayout.marginMedium),
            child: Card(
              color: AppColors.historyCard,
              child: Padding(
                padding: AppLayout.paddingAllMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          history['date']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          history['diagnosis']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'By ${history['doctor']!}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          // View details
                        },
                        child: const Text('View Details'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}