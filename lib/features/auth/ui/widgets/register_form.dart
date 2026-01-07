import 'package:flutter/material.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/features/auth/ui/widgets/login_form.dart';
import 'package:health_app/shared/ex.dart';
import '../../../../core/constants/app_layout.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController idCardController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  final VoidCallback onLogin;
  final bool isLoading;
    final String selectedUserType;
  // final Function(String s) onUserTypeChanged;
  final ValueChanged<String?> onUserTypeChanged;

  const RegisterForm({
    super.key,
    required this.phoneController,
    required this.passwordController,
    required this.onLogin,
    required this.isLoading,
    required this.nameController,
    required this.passwordConfirmController,
    required this.idCardController, required this.selectedUserType, required this.onUserTypeChanged, required this.emailController,
  });
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (passwordConfirmController.text != passwordController.text) {
      return 'Password dont match';
    }
    return null;
  }

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
      children: [
                Center(
          child: CustomDropdownField(
            value: selectedUserType,
            items: userTypeItems,
            onChanged: onUserTypeChanged,
            labelText: localizations.userType,
            hintText: localizations.selectUserType,
            prefixIcon: Icons.person,
            validator: (value) {
              // phoneController.
              if (value == null || value.isEmpty) {
                return 'Please select user type';
              }
              return null;
            },
          ),
        ),
        CustomTextField(
          controller: nameController,
          labelText: context.tr.name,
          prefixIcon: Icons.person,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
                CustomTextField(
          controller: emailController,
          labelText: context.tr.email,
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),

        CustomTextField(
          controller: phoneController,
          labelText: localizations.phoneNumber,
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter phone number';
            }
            if (!RegExp(r'^[0-9]{9}$').hasMatch(value)) {
              return 'Please enter a valid 10-digit phone number';
            }
            return null;
          },
        ),
        CustomTextField(
          controller: idCardController,
          labelText: localizations.idCardNumber,
          prefixIcon: Icons.cast_rounded,
          keyboardType: TextInputType.phone,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter Id number';
          //   }
          //   if (!RegExp(r'^[0-9]{14}$').hasMatch(value)) {
          //     return 'Please enter a valid 14-digit Id number';
          //   }
          //   return null;
          // },
        ),
        CustomTextField(
          controller: passwordController,
          labelText: localizations.password,
          prefixIcon: Icons.lock,
          obscureText: true,
          validator: passwordValidator,
        ),
        CustomTextField(
          controller: passwordConfirmController,
          labelText: localizations.passwordConfirmation,
          prefixIcon: Icons.lock,
          obscureText: true,
          validator: passwordValidator,
        ),
        CustomButton(
          onPressed: onLogin,
          text: localizations.register,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
