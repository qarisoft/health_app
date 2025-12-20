import 'package:flutter/material.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/constants/app_colors.dart' show AppColors;
import 'package:health_app/core/constants/app_layout.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/features/auth/ui/widgets/register_form.dart';
// import 'package:health_app/l10n/app_context.tr.dart' show AppLocalizations;
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/text_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _phoneController = TextEditingController(
    text: '123456789'.dev,
  );
  final TextEditingController _idCardController = TextEditingController(
    text: '12345678912345'.dev,
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'password'.dev,
  );
  final TextEditingController passwordConfirmController = TextEditingController(
    text: 'password'.dev,
  );
  final TextEditingController nameController = TextEditingController(
    text: 'name'.dev,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void goHome() {
    context.toNamed(AppRoutes.home);
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _isLoading = false);
      // Navigate to home page
      goHome();
      // Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _onLoginInested() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // final localizations = context.tr;

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
                _AppTitle(),
                const SizedBox(height: 8),
                _RegisterTitle(),
                const SizedBox(height: 40),
                // Login Form
                RegisterForm(
                  phoneController: _phoneController,
                  passwordController: _passwordController,
                  onLogin: _handleLogin,
                  isLoading: _isLoading,
                  nameController: nameController,
                  passwordConfirmController: passwordConfirmController,
                  idCardController: _idCardController,
                ),
                const SizedBox(height: AppLayout.spacingLarge),
                Center(
                  child: CustomTextBuuton(
                    text: context.tr.login,
                    onTap: _onLoginInested,
                  ),
                ),
                // Biometric Button
                // BiometricButtonWidget(onPressed: _handleBiometricAuth),
                // const SizedBox(height: AppLayout.spacingMedium),
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

class _RegisterTitle extends StatelessWidget {
  const _RegisterTitle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.tr.createAccount,
        style: context.theme.textTheme.titleLarge?.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.tr.appTitle,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
