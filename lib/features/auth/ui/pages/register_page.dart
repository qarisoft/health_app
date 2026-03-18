import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_app/core/constants/app_colors.dart' show AppColors;
import 'package:health_app/core/constants/app_layout.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/data/requests/doctor.dart';
import 'package:health_app/features/auth/data/requests/patient.dart';
import 'package:health_app/features/auth/data/requests/pharmacist.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:health_app/features/auth/ui/widgets/register_form.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:health_app/shared/widgets/text_button.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userTypeController = TextEditingController(
    text: PHARMACIST_KEY,
    // text: PATIENT_KEY,
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
    text: 'emaidsadsa@dsad.dsa'.dev,
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '123456789'.dev,
  );
  final TextEditingController _idCardController = TextEditingController(
    text: 'gdvtf54ef543'.dev,
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'pa32543vssword'.dev,
  );
  final TextEditingController passwordConfirmController = TextEditingController(
    text: 'pa32543vssword'.dev,
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
  final bool _isLoading = false;
  File? _selectedLicenseFile;

  Future<void> _handleLicenseDocumentPicked(File? file) async {
    if (file == null) return;

    try {
      // 1. Get the permanent directory for the app
      final directory = await getApplicationDocumentsDirectory();

      // 2. Extract the original filename
      final fileName = p.basename(file.path);

      // 3. Create the new permanent path
      final permanentPath_ = p.join(directory.path, 'healthapp');
      if (!Directory(permanentPath_).existsSync()) {
        await Directory(permanentPath_).create();
      }

      final permanentPath = p.join(permanentPath_, fileName);

      final savedFile = await file.copy(permanentPath);

      setState(() {
        _selectedLicenseFile = File(permanentPath);
      });

      debugPrint("File saved permanently at: ${_selectedLicenseFile?.path}");
    } catch (e) {
      debugPrint("Error saving file: $e");
      // Handle error (e.g., show a snackbar)
    }
  }

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
                  title: context.tr.success,
                  message: '${succes.message} ',
                  content: Column(
                    children: [
                      Text(context.tr.patientCode),
                      if (succes is PatientRegisteredResponse)
                        Text(succes.data?.patientCode ?? ''),
                      // Text(succes),
                    ],
                  ),
                )
                .whenComplete(goBack);
          },
          error: (e) {
            AppDialog().show(title: 'Error', message: e.msg);
          },
        );
      }
    }
  }

  void goBack() {
    context.pop();
  }

  Future<ErrorOr<PatientRegisteredResponse>> _registerPatient() async {
    final data = PatientRegisterRequest(
      confirmPassword: passwordConfirmController.text,
      nationalId: _idCardController.text,
      password: _passwordController.text,
      fullName: nameController.text,
      dateOfBirth: DateTime.parse(_dateOfBirthController.text),
      phoneNumber: _phoneController.text,
      email: _emailController.text,
    );

    return await appRepo.registerPatient(data.toJson());
  }

  Future<ErrorOr<GeneralResponse>> _registerDoctor() async {
    final data = DoctorRegisterRequest(
      nationalId: _idCardController.text,
      password: _passwordController.text,
      confirmPassword: passwordConfirmController.text,
      fullName: nameController.text,
      email: _emailController.text,
      phoneNumber: _phoneController.text,
      licenseNumber: licenseNumberController.text,
      specialization: specializationController.text,
      hospital: hospitalController.text,
      // dateOfBirth: DateTime.parse(_dateOfBirthController.text),
      // licenseDocumentUrl: licenseDocumentUrlController.text,
    );

    return await appRepo.registerDoctor(data);
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
      // licenseDocument:
      //     _selectedLicenseFile?.path ?? licenseDocumentUrlController.text,
      pharmacyName: pharmacyNameController.text,
    );
    // xlog(_selectedLicenseFile?.path ?? '');

    return await appRepo.registerPharmacist(data);
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
                  onLicenseDocumentPicked: _handleLicenseDocumentPicked,
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
