import 'package:flutter/material.dart';
import 'package:health_app/core/constants/text_variant.dart' show TextVariant;
import 'package:health_app/shared/widgets/app_text.dart';
import 'package:health_app/core/constants/app_colors.dart';
import 'package:health_app/core/constants/app_layout.dart';
// import 'package:health_app/core/enums/text_variant.dart';

enum QuickAction {
  medication,
  appointment,
  emergency,
  report,
}

class QuickActions extends StatelessWidget {
  final Function(QuickAction) onActionSelected;

  const QuickActions({super.key, required this.onActionSelected});

  @override
  Widget build(BuildContext context) {
    final actions = [
      _ActionItem(
        icon: Icons.medication,
        label: 'Medication',
        color: AppColors.primary,
        action: QuickAction.medication,
      ),
      _ActionItem(
        icon: Icons.calendar_today,
        label: 'Appointment',
        color: AppColors.textSecondary,
        action: QuickAction.appointment,
      ),
      _ActionItem(
        icon: Icons.emergency,
        label: 'Emergency',
        color: AppColors.error,
        action: QuickAction.emergency,
      ),
      _ActionItem(
        icon: Icons.assessment,
        label: 'Report',
        color: AppColors.secondary,
        action: QuickAction.report,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: AppLayout.spacingMedium,
        mainAxisSpacing: AppLayout.spacingMedium,
        childAspectRatio: 0.9,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return GestureDetector(
          onTap: () => onActionSelected(action.action),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: action.color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(action.icon, color: action.color),
                ),
                const SizedBox(height: 8),
                AppText(
                  text: action.label,
                  variant: TextVariant.caption,
                  fontWeight: FontWeight.w500,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ActionItem {
  final IconData icon;
  final String label;
  final Color color;
  final QuickAction action;

  _ActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.action,
  });
}