import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  // Font families
  static const String primaryFontFamily = 'Inter';
  static const String secondaryFontFamily = 'Poppins';

  // Text style variants
  static const TextStyle displayLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
    height: 1.12,
    letterSpacing: -0.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w400,
    height: 1.16,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.22,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.29,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.33,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 1.27,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.15,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
  );

  // Custom text styles
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.6,
    letterSpacing: 0.1,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.25,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.38,
    letterSpacing: 0.25,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.5,
  );

  // Rich text styles
  static const TextStyle richTextBody = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.57,
  );

  static const TextStyle richTextHeading = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.44,
  );

  // Form text styles
  static const TextStyle formLabel = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
  );

  static const TextStyle formHint = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
  );

  static const TextStyle formError = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
  );

  // Card text styles
  static const TextStyle cardTitle = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
  );

  static const TextStyle cardCaption = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
  );

  // App-specific styles
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle bottomNavLabel = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
  );

  static const TextStyle chipLabel = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.38,
  );
}
