import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Doctor;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/home/ui/pages/p.dart' as patient_app;
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:lottie/lottie.dart';

class DoctorProfileScreen extends ConsumerStatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  ConsumerState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends ConsumerState<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DoctorProfilePage extends ConsumerStatefulWidget {
  const DoctorProfilePage({super.key}); // Removed doctor parameter

  @override
  ConsumerState<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends ConsumerState<DoctorProfilePage> {
  bool _isEditing = false;
  Doctor? _editedDoctor; // Made nullable to handle initialization
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(accountProvider);

    // Extract doctor from provider
    final doctorAc = authState.whenOrNull(
      account: (account, _) => account.whenOrNull(doctor: (d) => d),
    );

    if (doctorAc != null) {
      // Initialize internal state from provider if not already done
      _editedDoctor ??= doctorAc;

      return Scaffold(
        appBar: AppBar(
          title: Text(_isEditing ? context.tr.editProfile : context.tr.profile),
          centerTitle: true,
          actions: [
            if (!_isEditing)
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => setState(() => _isEditing = true),
              ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: _isEditing ? _buildEditForm() : _buildProfileView(),
        ),
      );
    }
    return const NoAuthScreen();
  }

  Widget _buildProfileView() {
    final doctor = _editedDoctor!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileHeader(doctor.fullName),
        const SizedBox(height: 24),
        Consumer(
          builder: (context, ref, _) {
            final patientAc = ref.watch(
              allAcountsProvider.select((s) => s.patient),
            );
            return TextButton(
              onPressed: () {
                if (patientAc != null) {
                  ref
                      .read(accountProvider.notifier)
                      .changeAccount(patientAc.patient);
                  context.to(patient_app.HomePage());
                }
              },
              child: Text(context.tr.loginAsPatient),
            );
          },
        ),
        _buildSection(
          title: context.tr.personalInformation,
          children: [
            _buildInfoItem(
              icon: Icons.person,
              label: context.tr.name,
              value: doctor.fullName,
            ),
            _buildInfoItem(
              icon: Icons.phone,
              label: context.tr.phoneNumber,
              value: doctor.phoneNumber,
            ),
            _buildInfoItem(
              icon: Icons.email,
              label: context.tr.email,
              value: doctor.email,
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildSection(
          title: context.tr.medicalInformation,
          children: [
            _buildInfoItem(
              icon: Icons.medical_services,
              label: context.tr.specialization,
              value: doctor.specialization,
            ),
            _buildInfoItem(
              icon: Icons.badge,
              label: context.tr.idCardNumber,
              value: doctor.licenseNumber,
            ),
            _buildInfoItem(
              icon: Icons.local_hospital,
              label: context.tr.hospitalName,
              value: doctor.hospital,
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildSection(
          title: context.tr.settings,
          children: [
            _buildInfoItem(
              icon: Icons.person_pin,
              label: context.tr.patientId,
              value: doctor.userId.toString(),
            ),
            _buildInfoItem(
              icon: Icons.calendar_today,
              label: context.tr.createdAt,
              value: _formatDate(doctor.createdAt),
            ),
            _buildInfoItem(
              icon: Icons.update,
              label: context.tr.lastUpdated,
              value: _formatDate(doctor.updatedAt),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Consumer(
          builder: (context, ref, _) {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await ref.read(authRecordStateProvider.notifier).logOut();
                  if (context.mounted) Navigator.of(context).maybePop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                ),
                child: Text(
                  context.tr.logout,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildProfileHeader(String? name) {
    final doctor = _editedDoctor!;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              child: const Icon(Icons.person, size: 50, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Text(
              name ??
                  (doctor.fullName.isNotEmpty
                      ? doctor.fullName
                      : context.tr.doctor),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            if (doctor.specialization.isNotEmpty)
              Text(
                doctor.specialization,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 8),
            if (doctor.hospital.isNotEmpty)
              Text(
                doctor.hospital,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
            Container(height: 1, color: Colors.grey[300]),
            const SizedBox(height: 12),
            Column(children: children),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  value.isNotEmpty ? value : context.tr.notSpecified,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditForm() {
    final doctor = _editedDoctor!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
            label: context.tr.name,
            value: doctor.fullName,
            icon: Icons.person,
            onChanged: (v) =>
                setState(() => _editedDoctor = doctor.copyWith(fullName: v)),
            validator: (v) =>
                (v == null || v.isEmpty) ? context.tr.requiredField : null,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: context.tr.specialization,
            value: doctor.specialization,
            icon: Icons.medical_services,
            onChanged: (v) => setState(
              () => _editedDoctor = doctor.copyWith(specialization: v),
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? context.tr.requiredField : null,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: context.tr.phoneNumber,
            value: doctor.phoneNumber,
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            onChanged: (v) =>
                setState(() => _editedDoctor = doctor.copyWith(phoneNumber: v)),
            validator: (v) {
              if (v == null || v.isEmpty) return context.tr.requiredField;
              if (!RegExp(r'^[0-9]{10,15}$').hasMatch(v))
                return context.tr.invalidPhone;
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: context.tr.email,
            value: doctor.email,
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (v) =>
                setState(() => _editedDoctor = doctor.copyWith(email: v)),
            validator: (v) {
              if (v == null || v.isEmpty) return context.tr.requiredField;
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v))
                return context.tr.invalidEmail;
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: context.tr.idCardNumber,
            value: doctor.licenseNumber,
            icon: Icons.badge,
            onChanged: (v) => setState(
              () => _editedDoctor = doctor.copyWith(licenseNumber: v),
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? context.tr.requiredField : null,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: context.tr.hospitalName,
            value: doctor.hospital,
            icon: Icons.local_hospital,
            onChanged: (v) =>
                setState(() => _editedDoctor = doctor.copyWith(hospital: v)),
            validator: (v) =>
                (v == null || v.isEmpty) ? context.tr.requiredField : null,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) _saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    context.tr.saveChanges,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() => _isEditing = false),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: Text(
                    context.tr.cancel,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    required IconData icon,
    required Function(String) onChanged,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
    );
  }

  String _formatDate(String dateString) {
    if (dateString.isEmpty) return context.tr.notSpecified;
    try {
      final date = DateTime.parse(dateString);
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }

  void _saveChanges() async {
    if (_editedDoctor == null) return;

    AppDialog().loading(message: context.tr.loading);
    try {
      await Future.delayed(const Duration(seconds: 1));
      final a = await appRepo.updateDoctorProfile(_editedDoctor!.toJson());
      AppDialog().dismiss();

      a.when(
        error: (error) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${context.tr.error}: $error'),
            backgroundColor: Colors.red,
          ),
        ),
        success: (data) {
          setState(() {
            _editedDoctor = Doctor.fromJson(
              data.doctor?.toJson() ?? _editedDoctor!.toJson(),
            );
            _isEditing = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr.changesSavedSuccessfully),
              backgroundColor: Colors.green,
            ),
          );
        },
      );
    } catch (e) {
      AppDialog().dismiss();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${context.tr.error}: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
                  onPressed: () => Navigator.pushNamed(context, '/login'),
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
                  onPressed: () => Navigator.pushNamed(context, '/register'),
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
