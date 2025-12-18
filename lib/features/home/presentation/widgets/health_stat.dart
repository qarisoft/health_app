import 'package:flutter/material.dart';
import 'package:health_app/core/constants/text_variant.dart' show TextVariant;
import 'package:health_app/shared/widgets/app_text.dart';
import 'package:health_app/core/constants/app_colors.dart';
import 'package:health_app/core/constants/app_layout.dart';
// import 'package:health_app/core/enums/text_variant.dart';

class HealthStatsCard extends StatelessWidget {
  const HealthStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppLayout.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusLarge),
        border: Border.all(color: AppColors.textDisabled.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'This Week',
            variant: TextVariant.titleMedium,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: AppLayout.spacingMedium),
          Row(
            children: [
              Expanded(
                child: _StatItem(
                  value: '120/80',
                  label: 'Blood Pressure',
                  icon: Icons.monitor_heart,
                  color: AppColors.primary,
                  progress: 0.8,
                ),
              ),
              const SizedBox(width: AppLayout.spacingMedium),
              Expanded(
                child: _StatItem(
                  value: '72',
                  label: 'Heart Rate',
                  icon: Icons.favorite,
                  color: AppColors.error,
                  progress: 0.6,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppLayout.spacingMedium),
          Row(
            children: [
              Expanded(
                child: _StatItem(
                  value: '98.6°F',
                  label: 'Temperature',
                  icon: Icons.thermostat,
                  color: AppColors.warning,
                  progress: 0.9,
                ),
              ),
              const SizedBox(width: AppLayout.spacingMedium),
              Expanded(
                child: _StatItem(
                  value: '95%',
                  label: 'Oxygen Level',
                  icon: Icons.air,
                  color: AppColors.success,
                  progress: 0.95,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppLayout.spacingMedium),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // View detailed stats
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary.withOpacity(0.1),
                foregroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: 'View Detailed Report',
                    variant: TextVariant.buttonSmall,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  final double progress;

  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppLayout.paddingMedium),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: AppText(
                  text: label,
                  variant: TextVariant.caption,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AppText(
            text: value,
            variant: TextVariant.titleMedium,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: color.withOpacity(0.2),
            color: color,
            borderRadius: BorderRadius.circular(4),
            minHeight: 4,
          ),
        ],
      ),
    );
  }
}