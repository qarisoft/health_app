import 'package:flutter/material.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/shared/ex.dart';
import '../../../../core/constants/app_layout.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;
  final bool isLoading;
  final String selectedUserType;
  // final Function(String s) onUserTypeChanged;
  final ValueChanged<String?> onUserTypeChanged;

  const LoginForm({
    super.key,
    required this.phoneController,
    required this.passwordController,
    required this.onLogin,
    required this.isLoading,
    required this.selectedUserType,
    required this.onUserTypeChanged,
  });

  // static String patient ='patient';
  // static String doctor ='doctor';
  // static String admin ='admin';
  // static String pharmacist ='pharmacist';

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;
    final userTypeItems = [
      DropdownMenuItem(value: PATIENT_KEY, child: Text(localizations.patient)),
      DropdownMenuItem(
        value: PHARMACIST_KEY,
        child: Text(localizations.pharmacist),
      ),
      DropdownMenuItem(value: DOCTOR_KEY, child: Text(localizations.doctor)),
      DropdownMenuItem(value: ADMIN_KEY, child: Text(localizations.admin)),
    ];

    return Column(
      spacing: AppLayout.spacingMedium,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Center(
        //   child: CustomDropdownField(
        //     value: selectedUserType,
        //     items: userTypeItems,
        //     onChanged: onUserTypeChanged,
        //     labelText: localizations.userType,
        //     hintText: localizations.selectUserType,
        //     prefixIcon: Icons.person,
        //     validator: (value) {
        //       // phoneController.
        //       if (value == null || value.isEmpty) {
        //         return 'Please select user type';
        //       }
        //       return null;
        //     },
        //   ),
        // ),
        CustomTextField(
          controller: phoneController,
          labelText: localizations.idCardNumber,
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter phone number';
            }
            if (!RegExp(r'^[0-9]{14}$').hasMatch(value)) {
              return 'Please enter a valid 14-digit number';
            }
            return null;
          },
        ),
        CustomTextField(
          controller: passwordController,
          labelText: localizations.password,
          prefixIcon: Icons.lock,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
        CustomButton(
          onPressed: onLogin,
          text: localizations.login,
          isLoading: isLoading,
        ),
      ],
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
      items: items,
      onChanged: onChanged,
      validator: validator,
      isExpanded: true,
      hint: hintText != null ? Text(hintText!) : null,
    );
  }
}
