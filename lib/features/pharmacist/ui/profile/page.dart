import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerState, ConsumerStatefulWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart' show accountProvider;
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Pharmacist;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/doctor/ui/profile.dart';
import 'package:health_app/features/pharmacist/data/requests/profile.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/pages/profile/profile_page.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';

class EditPharmacistProfileScreen extends ConsumerStatefulWidget {
  const EditPharmacistProfileScreen({super.key, required this.pharmacist});

  final Pharmacist pharmacist;

  @override
  ConsumerState createState() => _EditPharmacistProfileScreenState();
}

class _EditPharmacistProfileScreenState
    extends ConsumerState<EditPharmacistProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // 1. Use controllers instead of rebuilding the UI on every keystroke
  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _licenseCtrl;
  late final TextEditingController _pharmacyCtrl;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current pharmacist data
    _nameCtrl = TextEditingController(text: widget.pharmacist.fullName);
    _phoneCtrl = TextEditingController(text: widget.pharmacist.phoneNumber);
    _emailCtrl = TextEditingController(text: widget.pharmacist.email);
    _licenseCtrl = TextEditingController(text: widget.pharmacist.licenseNumber);
    _pharmacyCtrl = TextEditingController(text: widget.pharmacist.pharmacyName);
  }

  @override
  void dispose() {
    // Always dispose controllers to prevent memory leaks
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _licenseCtrl.dispose();
    _pharmacyCtrl.dispose();
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // --- Profile Picture Placeholder ---
                Center(child: ProfileAvatar(userId: widget.pharmacist.userId)),
                const SizedBox(height: 32),

                // --- Personal Information Section ---
                _buildSectionHeader(
                  context,
                  context.tr.personalInfo ?? 'Personal Information',
                ),
                const SizedBox(height: 16),

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
                  // initialValue: _emailCtrl.text,
                  readOnly: true,
                ),
                const SizedBox(height: 32),

                // --- Professional Information Section ---
                _buildSectionHeader(
                  context,
                  context.tr.professionalInfo ?? 'Professional Details',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _licenseCtrl,
                  labelText: context.tr.licenseNumber ?? 'License Number',
                  prefixIcon: Icons.badge_rounded,
                  validator: (v) => (v == null || v.isEmpty)
                      ? context.tr.requiredField
                      : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _pharmacyCtrl,
                  labelText: context.tr.pharmacyName ?? 'Pharmacy Name',
                  prefixIcon: Icons.local_pharmacy_rounded,
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
                      flex: 2,
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

    // Build the updated pharmacist object from controllers
    final updatedPharmacist = widget.pharmacist.copyWith(
      fullName: _nameCtrl.text,
      phoneNumber: _phoneCtrl.text,
      email: _emailCtrl.text,
      licenseNumber: _licenseCtrl.text,
      pharmacyName: _pharmacyCtrl.text,
    );

    AppDialog().loading(message: context.tr.loading);

    try {
      // Assuming PharmacistProfileRequestData requires the updated fields
      final response = await appRepo.updatePharmacistProfile(
        PharmacistProfileRequestData.fromJson(updatedPharmacist.toJson()),
      );

      if (!mounted) return;
      AppDialog().dismiss();

      response.when(
        error: (error) =>
            _showSnackBar('${context.tr.error}: $error', isError: true),
        success: (data) {
          _showSnackBar(context.tr.changesSavedSuccessfully, isError: false);
          // Assuming you want to go back and invalidate providers like before
          _goBack();
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _goBack() {
    ref.invalidateAllAuthProviders(); // Assuming this is an extension method you have
    context.mayPop();
  }
}

class PharmacistProfileScreen extends ConsumerStatefulWidget {
  const PharmacistProfileScreen({super.key});

  @override
  ConsumerState createState() => _PharmacistProfileScreenState();
}

class _PharmacistProfileScreenState
    extends ConsumerState<PharmacistProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(allAcountsProvider);
    final pharmacist = auth.pharmacist?.pharmacist;
    if (pharmacist == null) {
      return NoAuthScreen();
    }
    xlog(auth);
    return ProfilePageBuilder(
      account: ProfileAccount(
        userId: pharmacist.userId,
        fullName: pharmacist.fullName,
        email: pharmacist.email,
        address: pharmacist.pharmacyName,
      ),
      onEditProfile: () {
        context.to(EditPharmacistProfileScreen(pharmacist: pharmacist));
      },
      onLoginAsPatient: () {
        final patientAc = auth.patient?.patient;
        if (patientAc != null) {
          // context.to(patient_app.HomePage());
          ref.read(accountProvider.notifier).changeAccount(patientAc);
        }
      },
    );
  }
}
