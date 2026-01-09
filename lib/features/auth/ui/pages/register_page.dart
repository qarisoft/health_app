import 'package:flutter/material.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/constants/app_colors.dart' show AppColors;
import 'package:health_app/core/constants/app_layout.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/features/auth/data/requests/doctor.dart';
import 'package:health_app/features/auth/data/requests/patient.dart';
import 'package:health_app/features/auth/data/requests/pharmacist.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:health_app/features/auth/ui/widgets/register_form.dart';
import 'package:health_app/shared/api/api_repositories.dart';
// import 'package:health_app/l10n/app_context.tr.dart' show AppLocalizations;
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:health_app/shared/widgets/text_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userTypeController = TextEditingController(
    text: PATIENT_KEY,
  );
  final TextEditingController nameController = TextEditingController(
    text: 'name'.dev,
  );
  final TextEditingController licenseNumberController = TextEditingController(
    text: '324432432'.dev,
  );
  final TextEditingController _dateOfBirthController = TextEditingController(
    text: '2006-01-08'.dev,
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'email@e.e'.dev,
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '123456789'.dev,
  );
  final TextEditingController _idCardController = TextEditingController(
    text: '12345678dd912345'.dev,
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'password'.dev,
  );
  final TextEditingController passwordConfirmController = TextEditingController(
    text: 'password'.dev,
  );
  final TextEditingController specializationController = TextEditingController(
    text: 'nephrologist'.dev,
  );
  final TextEditingController hospitalController = TextEditingController(
    text: 'hospital name'.dev,
  );
  final TextEditingController pharmacyNameController = TextEditingController(
    text: 'pharmacy name'.dev,
  );
  final TextEditingController licenseDocumentUrlController =
      TextEditingController(text: 'https://google.com'.dev);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void goHome() {
    context.toNamed(AppRoutes.home);
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      if (_formKey.currentState!.validate()) {
        AppDialog().loading(message: "Register, please wait ...");

        final UserType userType = UserType.fromString(_userTypeController.text);

        final authFn = switch (userType) {
          UserType.initial => _registerPatient,

          UserType.patient => _registerPatient,

          UserType.doctor => _registerDoctor,

          UserType.pharmacist => _registerPharmacist,

          UserType.admin => _registerPatient,
        };
        final auth = await authFn();

        AppDialog().dismiss();

        auth.when(
          success: (succes) {
            xlog(succes.toString());
            AppDialog()
                .show(
                  type: DialogType.success,
                  title: 'Success',
                  message: succes.message ?? '',
                )
                .whenComplete(goBack);
            // goHome(succes);
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
  }

  goBack() {
    context.pop();
  }

  Future<ErrorOr<GeneralResponse>> _registerPatient() async {
    final data = PatientRegisterRequest(
      confirmPassword: passwordConfirmController.text,
      nationalId: _idCardController.text,
      password: _passwordController.text,
      fullName: nameController.text,
      dateOfBirth: DateTime.parse(_dateOfBirthController.text),
      phoneNumber: _phoneController.text,
      email: _emailController.text,
    );

    return await di<AppRepositories>().registerPatient(data.toJson());
  }

  Future<ErrorOr<GeneralResponse>> _registerDoctor() async {
    final data = DoctorRegisterRequest(
      confirmPassword: passwordConfirmController.text,
      nationalId: _idCardController.text,
      password: _passwordController.text,
      fullName: nameController.text,
      dateOfBirth: DateTime.parse(_dateOfBirthController.text),
      phoneNumber: _phoneController.text,
      email: _emailController.text,
      licenseNumber: licenseNumberController.text,
      specialization: specializationController.text,
      hospital: hospitalController.text,
      licenseDocumentUrl: licenseDocumentUrlController.text,
    );

    return await di<AppRepositories>().registerDoctor(data.toJson());
  }

  Future<ErrorOr<GeneralResponse>> _registerPharmacist() async {
    final data = PharmacistRegisterRequest(
      confirmPassword: passwordConfirmController.text,
      nationalId: _idCardController.text,
      password: _passwordController.text,
      fullName: nameController.text,
      dateOfBirth: DateTime.parse(_dateOfBirthController.text),
      phoneNumber: _phoneController.text,
      email: _emailController.text,
      licenseNumber: licenseNumberController.text,
      licenseDocumentUrl: licenseDocumentUrlController.text,
      pharmacyName: pharmacyNameController.text,
    );

    return await di<AppRepositories>().registerPharmacist(data.toJson());
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
                  dateOfBirthController: _dateOfBirthController,
                  emailController: _emailController,
                  phoneController: _phoneController,
                  passwordController: _passwordController,
                  onLogin: _handleRegister,
                  isLoading: _isLoading,
                  nameController: nameController,
                  passwordConfirmController: passwordConfirmController,
                  idCardController: _idCardController,
                  selectedUserType: _userTypeController.text,
                  userType: UserType.fromString(_userTypeController.text),
                  onUserTypeChanged: (String? value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _userTypeController.text = value;
                    });
                  },
                  licenseNumberController: licenseNumberController,
                  licenseDocumentUrlController: licenseDocumentUrlController,
                  pharmacyNameController: pharmacyNameController,
                  specializationController: specializationController,
                  hospitalController: hospitalController,
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
