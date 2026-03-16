import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ex.dart';

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال رقم الهاتف';
  }
  if (!RegExp(r'^[0-9]{9,15}$').hasMatch(value)) {
    return 'رقم الهاتف غير صالح';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال البريد الإلكتروني';
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'البريد الإلكتروني غير صالح';
  }
  return null;
}

String? notEmptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'you must add one letter at least';
  }
  return null;
}

// Helper to format raw API dates into clean UI strings
String formatDate(String isoDateString) {
  try {
    final DateTime parsedDate = DateTime.parse(isoDateString);

    // Choose the format you prefer:
    // Option 1: 'Mar 2, 2026'
    return DateFormat('MMM d, yyyy').format(parsedDate);

    // Option 2 (with time): 'Mar 2, 2026 at 12:09 AM'
    // return DateFormat('MMM d, yyyy \'at\' h:mm a').format(parsedDate);
  } catch (e) {
    // Fallback to the original string if parsing fails for any reason
    return isoDateString;
  }
}

enum Gender {
  male(1, 'Male', 'ذكر'),
  female(2, 'Female', 'أنثى');

  final int value;
  final String englishName;
  final String arabicName;

  const Gender(this.value, this.englishName, this.arabicName);

  String getDisplayName(BuildContext context) {
    return context.isArabic ? arabicName : englishName;
  }

  static Gender fromValue(int value) {
    return Gender.values.firstWhere((e) => e.value == value);
  }
}

enum BloodType {
  aPositive(1, 'A+', 'A+'),
  aNegative(2, 'A-', 'A-'),
  bPositive(3, 'B+', 'B+'),
  bNegative(4, 'B-', 'B-'),
  abPositive(5, 'AB+', 'AB+'),
  abNegative(6, 'AB-', 'AB-'),
  oPositive(7, 'O+', 'O+'),
  unknown(0, 'n', 'n'),
  oNegative(8, 'O-', 'O-');

  final int value;
  final String symbol;
  final String arabicSymbol;

  const BloodType(this.value, this.symbol, this.arabicSymbol);

  String getDisplaySymbol(BuildContext context) {
    return context.isArabic ? arabicSymbol : symbol;
  }

  static BloodType fromValue(int value) {
    return BloodType.values.firstWhere((e) => e.value == value);
  }
}
