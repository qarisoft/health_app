import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/constants/app_colors.dart' show AppColors;
import 'package:health_app/core/constants/app_layout.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/di.dart';
// import 'package:health_app/core/user/user.dart' hide UserType;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/l10n/app_localizations.dart' show AppLocalizations;
import 'package:health_app/shared/ex.dart';
// import 'package:health_app/shared/widgets/dialog/app_dialog.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog.dart';
// import 'package:health_app/shared/widgets/dialog/app_dialog.dart';
// import 'package:health_app/shared/widgets/dialog/dialog_manager.dart'
// show DialogManager;
import 'package:health_app/shared/widgets/text_button.dart';

import '../widgets/biometric_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/login_form.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // final ValueChanged d =(value) {

  // }
  final TextEditingController _userTypeController = TextEditingController(
    text: PATIENT_KEY,
  );
  final TextEditingController _idCardNumberController = TextEditingController(
    // text: DEV_ENV ? 'patient1234' : null,
    text: DEV_ENV ? '5000000001' : null,
    // text: DEV_ENV ? '5000000002' : null,
    // text: DEV_ENV ? 'gdvtf54e4f543' : null,
    // text: DEV_ENV ? 'gdvtf54ef543' : null,
    // text: DEV_ENV ? '20000000010005' : null,
    // text: DEV_ENV ? '3000000001' : null,
    // text: DEV_ENV ? '2000000102' : null,
    // text: DEV_ENV ? '1234567899' : null,
  );
  final TextEditingController _passwordController = TextEditingController(
    // text: DEV_ENV ? 'pa32543vssword' : null,
    text: DEV_ENV ? 'Admin@123' : null,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _isLoading = false;

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      AppDialog().loading(message: context.tr.loading);

      final auth = await appRepo.login(
        identifier: _idCardNumberController.text,
        password: _passwordController.text,
      );

      AppDialog().dismiss();
      ref.invalidateAllAuthProviders();

      auth.when(
        success: (succes) {},
        error: (e) {
          AppDialog().show(title: 'Error', message: e.msg);
        },
      );
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
        child: Padding(
          padding: AppLayout.paddingAllLarge,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Logo/Title
                AppTitle(localizations: localizations),
                const SizedBox(height: 8),
                LoginTitle(localizations: localizations),
                const SizedBox(height: 40),
                // Login Form
                LoginForm(
                  phoneController: _idCardNumberController,
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
    _idCardNumberController.dispose();
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
