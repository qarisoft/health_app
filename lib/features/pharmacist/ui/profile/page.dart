import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show
        Consumer,
        ProviderListenableSelect,
        ConsumerWidget,
        WidgetRef,
        ConsumerState,
        ConsumerStatefulWidget;
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart' show accountProvider;
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Pharmacist;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/doctor/ui/profile.dart';
import 'package:health_app/features/pharmacist/data/requests/profile.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/functions.dart';
import 'package:health_app/shared/pages/profile/profile_page.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:health_app/features/auth/domain/models/patient.dart';

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
      onEditProfile: () {},
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

class EditPharmacistProfileScreen extends ConsumerStatefulWidget {
  const EditPharmacistProfileScreen({super.key, required this.pharmacist});

  final Pharmacist pharmacist;

  @override
  ConsumerState createState() => _EditPharmacistProfileScreenState();
}

class _EditPharmacistProfileScreenState
    extends ConsumerState<EditPharmacistProfileScreen> {
  // bool _isInitialized = false;
  late Pharmacist _editedPharmacist;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _editedPharmacist = widget.pharmacist;
    // _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          // Full Name Field
          _buildTextField(
            label: 'الاسم الكامل',
            value: _editedPharmacist.fullName,
            icon: Icons.person,
            onChanged: (value) {
              setState(() {
                _editedPharmacist = _editedPharmacist.copyWith(fullName: value);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال الاسم الكامل';
              }
              return null;
            },
          ),

          // // Specialization Field

          // Phone Number Field
          _buildTextField(
            label: 'رقم الهاتف',
            value: _editedPharmacist.phoneNumber,
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              setState(() {
                _editedPharmacist = _editedPharmacist.copyWith(
                  phoneNumber: value,
                );
              });
            },
            validator: phoneNumberValidator,
          ),

          // Email Field
          _buildTextField(
            label: 'البريد الإلكتروني',
            value: _editedPharmacist.email,
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              setState(() {
                _editedPharmacist = _editedPharmacist.copyWith(email: value);
              });
            },
            validator: emailValidator,
          ),

          // License Number Field
          _buildTextField(
            label: 'رقم الرخصة',
            value: _editedPharmacist.licenseNumber,
            icon: Icons.badge,
            onChanged: (value) {
              setState(() {
                _editedPharmacist = _editedPharmacist.copyWith(
                  licenseNumber: value,
                );
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال رقم الرخصة';
              }
              return null;
            },
          ),

          // Pharmaciy Field
          _buildTextField(
            label: 'الصيدلية',
            value: _editedPharmacist.pharmacyName,
            icon: Icons.local_pharmacy,
            onChanged: (value) {
              setState(() {
                _editedPharmacist = _editedPharmacist.copyWith(
                  pharmacyName: value,
                );
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال اسم الصيدلية';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save changes here
                      // You would typically call an API to update the doctor profile
                      _saveChanges();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'حفظ التغييرات',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      // _isEditing = false;
                      _editedPharmacist = widget.pharmacist; // Reset changes
                      context.mayPop();
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: const Text(
                    'إلغاء',
                    style: TextStyle(fontSize: 16, color: Colors.red),
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
    if (dateString.isEmpty) return 'غير محدد';

    try {
      final date = DateTime.parse(dateString);
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }

  void _showSnak(SnackBar snak) {
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(snak);
  }

  void goBack() {
    ref.invalidateAllAuthProviders();
    context.mayPop();
  }

  void _saveChanges() async {
    AppDialog().loading(message: 'جاري التعديل, الرجاء الانتضار');
    xlog('saving ${_editedPharmacist.toJson()}');

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      final a = await appRepo.updatePharmacistProfile(
        PharmacistProfileRequestData.fromJson(_editedPharmacist.toJson()),
      );

      AppDialog().dismiss();
      // log(a.data)
      a.when(
        error: (error) {},
        success: (data) {
          AppDialog()
              .show(
                title: 'Good',
                message: "تم الحفض بنجاح!!",
                type: DialogType.success,
              )
              .whenComplete(goBack);
          // context.mayPop();
        },
      );

      _showSnak(
        const SnackBar(
          content: Text('تم حفظ التغييرات بنجاح'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Show error message
      _showSnak(
        SnackBar(
          content: Text('فشل في حفظ التغييرات: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      // Hide loading dialog
      // if (context.mounted) {
      //   Navigator.of(context, rootNavigator: true).pop();
      // }
    }
  }
}
