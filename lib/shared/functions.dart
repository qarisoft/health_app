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
