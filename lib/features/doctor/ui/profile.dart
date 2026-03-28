import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Doctor;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/pages/profile/profile_page.dart'
    show ProfilePageBuilder, ProfileAccount, ProfileAvatar;
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:lottie/lottie.dart';
// import your Doctor model and repo here

class EditDoctorProfilePage extends ConsumerStatefulWidget {
  const EditDoctorProfilePage({super.key, required this.doctor});

  final Doctor doctor;

  @override
  ConsumerState createState() => _EditDoctorProfilePageState();
}

class _EditDoctorProfilePageState extends ConsumerState<EditDoctorProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // 1. Use controllers instead of rebuilding the UI on every keystroke
  late final TextEditingController _nameCtrl;
  late final TextEditingController _specCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _licenseCtrl;
  late final TextEditingController _hospitalCtrl;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current doctor data
    _nameCtrl = TextEditingController(text: widget.doctor.fullName);
    _specCtrl = TextEditingController(text: widget.doctor.specialization);
    _phoneCtrl = TextEditingController(text: widget.doctor.phoneNumber);
    _emailCtrl = TextEditingController(text: widget.doctor.email);
    _licenseCtrl = TextEditingController(text: widget.doctor.licenseNumber);
    _hospitalCtrl = TextEditingController(text: widget.doctor.hospital);
  }

  @override
  void dispose() {
    // Always dispose controllers to prevent memory leaks
    _nameCtrl.dispose();
    _specCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _licenseCtrl.dispose();
    _hospitalCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.editProfile ?? 'Edit Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      // SafeArea inside Scaffold body is usually better for background colors
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Profile Picture Placeholder ---
                Center(child: ProfileAvatar(userId: widget.doctor.userId)),

                const SizedBox(height: 32),

                // --- Personal Information Section ---
                _buildSectionHeader(
                  context,
                  context.tr.personalInfo ?? 'Personal Information',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _nameCtrl,
                  labelText: context.tr.name,
                  prefixIcon: Icons.person_rounded,
                  validator: (v) => (v == null || v.isEmpty)
                      ? context.tr.requiredField
                      : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _phoneCtrl,
                  labelText: context.tr.phoneNumber,
                  prefixIcon: Icons.phone_rounded,
                  keyboardType: TextInputType.phone,
                  validator: (v) {
                    if (v == null || v.isEmpty) return context.tr.requiredField;
                    if (!RegExp(r'^[0-9]{9,15}$').hasMatch(v)) {
                      return context.tr.invalidPhone;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _emailCtrl,
                  labelText: context.tr.email,
                  prefixIcon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.isEmpty) return context.tr.requiredField;
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                      return context.tr.invalidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // --- Professional Information Section ---
                _buildSectionHeader(
                  context,
                  context.tr.professionalInfo ?? 'Professional Details',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _specCtrl,
                  labelText: context.tr.specialization,
                  prefixIcon: Icons.medical_services_rounded,
                  validator: (v) => (v == null || v.isEmpty)
                      ? context.tr.requiredField
                      : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _licenseCtrl,
                  labelText: context.tr.idCardNumber,
                  prefixIcon: Icons.badge_rounded,
                  validator: (v) => (v == null || v.isEmpty)
                      ? context.tr.requiredField
                      : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _hospitalCtrl,
                  labelText: context.tr.hospitalName,
                  prefixIcon: Icons.local_hospital_rounded,
                  validator: (v) => (v == null || v.isEmpty)
                      ? context.tr.requiredField
                      : null,
                ),
                const SizedBox(height: 40),

                // --- Action Buttons ---
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: context.mayPop,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(color: Colors.grey.shade400),
                        ),
                        child: Text(
                          context.tr.cancel,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2, // Make the primary action wider
                      child: ElevatedButton(
                        onPressed: _saveChanges,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          context.tr.saveChanges,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    // 2. Build the updated doctor object from controllers
    final updatedDoctor = widget.doctor.copyWith(
      fullName: _nameCtrl.text,
      specialization: _specCtrl.text,
      phoneNumber: _phoneCtrl.text,
      email: _emailCtrl.text,
      licenseNumber: _licenseCtrl.text,
      hospital: _hospitalCtrl.text,
    );

    AppDialog().loading(message: context.tr.loading);

    try {
      final response = await appRepo.updateDoctorProfile(
        updatedDoctor.toJson(),
      );

      if (!mounted) return;
      AppDialog().dismiss();

      response.when(
        error: (error) =>
            _showSnackBar('${context.tr.error}: $error', isError: true),
        success: (data) {
          _showSnackBar(context.tr.changesSavedSuccessfully, isError: false);
          // Optional: Pop the screen after successful save
          context.mayPop();
        },
      );
    } catch (e) {
      if (!mounted) return;
      AppDialog().dismiss();
      _showSnackBar('${context.tr.error}: $e', isError: true);
    }
  }

  void _showSnackBar(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade600 : Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        // Makes the snackbar float above the bottom rather than stick to it
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}

class DoctorProfileScreen extends ConsumerStatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  ConsumerState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends ConsumerState<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(allAcountsProvider);
    final doctor = auth.doctor?.doctor;
    if (doctor == null) {
      return NoAuthScreen();
    }
    xlog(auth);
    return ProfilePageBuilder(
      account: ProfileAccount(
        userId: doctor.userId,
        fullName: doctor.fullName,
        email: doctor.email,
        address: doctor.hospital,
      ),
      onEditProfile: () {
        context.to(EditDoctorProfilePage(doctor: doctor));
      },
      onLoginAsPatient: () {
        final patientAc = auth.patient?.patient;
        if (patientAc != null) {
          ref.read(accountProvider.notifier).changeAccount(patientAc);
        }
      },
    );
  }
}

// NoAuthScreen class stays the same...
class NoAuthScreen extends StatelessWidget {
  const NoAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Lottie.asset(
                AppAssets.pleaseLoginAgain,
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              Text(
                context.tr.readyToGetStarted,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                context.tr.loginDescription,
                style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.login),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(context.tr.login),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(context.tr.createAccount),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
