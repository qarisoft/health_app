import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/constants/app_colors.dart' show AppColors;
import 'package:health_app/core/constants/app_layout.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/core/user/user.dart';
import 'package:health_app/l10n/app_localizations.dart' show AppLocalizations;
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/login_form.dart';
import '../widgets/biometric_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final ValueChanged d =(value) {

  // }
  final TextEditingController _userTypeController = TextEditingController(
    text: PATIENT_KEY,
  );
  final TextEditingController _phoneController = TextEditingController(
    text: DEV_ENV ? '123456789' : null,
  );
  final TextEditingController _passwordController = TextEditingController(
    text: DEV_ENV ? '123456789' : null,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void goHome() {
    context.toNamed('/home');
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      final sh = di<SharedPreferences>();
      await sh.setString(AUTH_TYPE_KEY, _userTypeController.text);
      final authType = _userTypeController.text;
      Map<String, dynamic>? auth;

      if (authType == DOCTOR_KEY) {
        auth = DoctorEntity().toJson();
      }

      if (authType == ADMIN_KEY) {
        auth = DoctorEntity().toJson();
      }

      if (authType == PHARMACIST_KEY) {
        auth = DoctorEntity().toJson();
      }

      if (authType == PATIENT_KEY) {
        auth = PatientEntity().toJson();
      }

      sh.setString(AUTH_KEY, jsonEncode(auth));

      setState(() => _isLoading = false);

      // Navigate to home page
      // goHome();
      // Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<void> _handleBiometricAuth() async {
    // Biometric authentication logic
    final result = await BiometricButton.authenticate(
      context: context,
      localizedReason: context.tr.biometricAuth,
    );

    if (result) {
      result.log();
      // Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppLayout.paddingAllLarge,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Logo/Title
                AppTitle(localizations: localizations),
                const SizedBox(height: 8),
                LoginTitle(localizations: localizations),
                const SizedBox(height: 40),
                // Login Form
                LoginForm(
                  phoneController: _phoneController,
                  passwordController: _passwordController,
                  onLogin: _handleLogin,
                  isLoading: _isLoading,

                  selectedUserType: _userTypeController.text,
                  onUserTypeChanged: (String? value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _userTypeController.text = value;
                    });
                  },
                ),
                const SizedBox(height: AppLayout.spacingLarge),
                // Biometric Button
                BiometricButtonWidget(onPressed: _handleBiometricAuth),
                const SizedBox(height: AppLayout.spacingMedium),
                // Forgot Password
                ForgetPasswordButton(localizations: localizations),
                RegisterButton(),
                // Center(
                //   child:
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FormField(
        builder: (field) {
          // field.
          return CustomTextBuuton(
            text: context.tr.createAccount,
            onTap: () {
              context.toNamed(AppRoutes.register);
              // context.tr.
            },
          );
        },
      ),
    );
  }
}

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key, required this.localizations});

  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          // Handle forgot password
        },
        child: Text(
          localizations.forgotPassword,
          style: const TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key, required this.localizations});

  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        localizations.loginTitle,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.localizations});

  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        localizations.appTitle,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
