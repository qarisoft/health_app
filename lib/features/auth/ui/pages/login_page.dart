import 'package:flutter/material.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/constants/app_colors.dart' show AppColors;
import 'package:health_app/core/constants/app_layout.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/core/user/user.dart';
import 'package:health_app/features/auth/domain/models/auth_state.dart';
// import 'package:health_app/core/user/user.dart' hide UserType;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/l10n/app_localizations.dart' show AppLocalizations;
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/ex.dart';
// import 'package:health_app/shared/widgets/dialog/app_dialog.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
// import 'package:health_app/shared/widgets/dialog/app_dialog.dart';
// import 'package:health_app/shared/widgets/dialog/dialog_manager.dart'
// show DialogManager;
import 'package:health_app/shared/widgets/text_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';
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
  final TextEditingController _idCardNumberController = TextEditingController(
    text: DEV_ENV ? '12345678912345' : null,
  );
  final TextEditingController _passwordController = TextEditingController(
    text: DEV_ENV ? '123456789' : null,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void goHome(AuthRecord auth) {
    // auth.whenOrNull(
    //   (accessToken, role, userId) => ,
    //   // patient: (a) {
    //   //   context.toNamed(AppRoutes.patientHome);
    //   // },
    // );
    switch (auth.role.toLowerCase()) {
      case 'patient':

        // initPatient();
        context.toNamed(AppRoutes.patientHome);

        break;
      case 'doctor':
        context.toNamed(AppRoutes.doctorHome);

      default:
    }
    // switch(auth.role){
    //   // 'patient'=>
    //   case 'patient'=>
    // }
  }


  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      AppDialog().loading(message: "login, please wait ...");
   

      final auth = await di<AppRepositories>().login(
        identifier: _idCardNumberController.text,
        password: _passwordController.text,
      );

      AppDialog().dismiss();

      auth.when(
        success: (succes) {
          xlog(succes.toString());
          goHome(succes);
        },
        error: (e) {
          // AppDialog().info(title: 'Error', message: 'dsadsdsadsadsadsa');
          AppDialog().show(title: 'Error', message: e.msg);
          // AppDialog().success(title: 'Error', message: 'dsadsdsadsadsadsa');
          // AppDialog().toast(e.msg);
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
