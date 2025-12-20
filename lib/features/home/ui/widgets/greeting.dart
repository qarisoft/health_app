import 'package:flutter/material.dart';
import 'package:health_app/core/constants/text_variant.dart' show TextVariant;
import 'package:health_app/shared/widgets/app_text.dart';
import 'package:health_app/core/constants/app_colors.dart';
// import 'package:health_app/core/enums/text_variant.dart';

class HomeGreeting extends StatelessWidget {
  final String userName;

  const HomeGreeting({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.9),
            AppColors.textSecondary,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Good Morning,',
                  variant: TextVariant.titleMedium,
                  color: Colors.white.withOpacity(0.9),
                ),
                const SizedBox(height: 4),
                AppText(
                  text: userName,
                  variant: TextVariant.headlineSmall,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                AppText(
                  text: 'Take care of your health today!',
                  variant: TextVariant.bodyMedium,
                  color: Colors.white.withOpacity(0.8),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://api.dicebear.com/7.x/avataaars/svg?seed=John',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}