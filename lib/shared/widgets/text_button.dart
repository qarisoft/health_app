import 'package:flutter/material.dart';
import 'package:health_app/core/constants/app_colors.dart';

class CustomTextBuuton extends StatelessWidget {
  const CustomTextBuuton({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        // localizations.createAccount,
        style: const TextStyle(
          color: AppColors.secondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}