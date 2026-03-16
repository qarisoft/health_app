import 'package:intl/intl.dart';

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