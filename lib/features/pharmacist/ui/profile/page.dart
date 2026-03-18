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
                  // controller: _emailCtrl,
                  labelText: context.tr.email,
                  prefixIcon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  initialValue: _emailCtrl.text,
                  readOnly: true,
                  // validator: (v) {
                  //   if (v == null || v.isEmpty) return context.tr.requiredField;
                  //   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                  //     return context.tr.invalidEmail;
                  //   }
                  //   return null;
                  // },
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

//
// class EditPharmacistProfileScreen extends ConsumerStatefulWidget {
//   const EditPharmacistProfileScreen({super.key, required this.pharmacist});
//
//   final Pharmacist pharmacist;
//
//   @override
//   ConsumerState createState() => _EditPharmacistProfileScreenState();
// }
//
// class _EditPharmacistProfileScreenState
//     extends ConsumerState<EditPharmacistProfileScreen> {
//   late Pharmacist _editedPharmacist;
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _editedPharmacist = widget.pharmacist;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(context.tr.edit)),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               spacing: 20,
//               children: [
//                 SizedBox(height: 10),
//                 // Full Name Field
//                 _buildTextField(
//                   label: 'الاسم الكامل',
//                   value: _editedPharmacist.fullName,
//                   icon: Icons.person,
//                   onChanged: (value) {
//                     setState(() {
//                       _editedPharmacist = _editedPharmacist.copyWith(
//                         fullName: value,
//                       );
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'الرجاء إدخال الاسم الكامل';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 // // Specialization Field
//
//                 // Phone Number Field
//                 _buildTextField(
//                   label: 'رقم الهاتف',
//                   value: _editedPharmacist.phoneNumber,
//                   icon: Icons.phone,
//                   keyboardType: TextInputType.phone,
//                   onChanged: (value) {
//                     setState(() {
//                       _editedPharmacist = _editedPharmacist.copyWith(
//                         phoneNumber: value,
//                       );
//                     });
//                   },
//                   validator: phoneNumberValidator,
//                 ),
//
//                 // Email Field
//                 _buildTextField(
//                   label: 'البريد الإلكتروني',
//                   value: _editedPharmacist.email,
//                   icon: Icons.email,
//                   keyboardType: TextInputType.emailAddress,
//                   onChanged: (value) {
//                     setState(() {
//                       _editedPharmacist = _editedPharmacist.copyWith(
//                         email: value,
//                       );
//                     });
//                   },
//                   validator: emailValidator,
//                 ),
//
//                 // License Number Field
//                 _buildTextField(
//                   label: 'رقم الرخصة',
//                   value: _editedPharmacist.licenseNumber,
//                   icon: Icons.badge,
//                   onChanged: (value) {
//                     setState(() {
//                       _editedPharmacist = _editedPharmacist.copyWith(
//                         licenseNumber: value,
//                       );
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'الرجاء إدخال رقم الرخصة';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 // Pharmaciy Field
//                 _buildTextField(
//                   label: 'الصيدلية',
//                   value: _editedPharmacist.pharmacyName,
//                   icon: Icons.local_pharmacy,
//                   onChanged: (value) {
//                     setState(() {
//                       _editedPharmacist = _editedPharmacist.copyWith(
//                         pharmacyName: value,
//                       );
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'الرجاء إدخال اسم الصيدلية';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//
//                 // Action Buttons
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // Save changes here
//                             // You would typically call an API to update the doctor profile
//                             _saveChanges();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           backgroundColor: Colors.green,
//                         ),
//                         child: const Text(
//                           'حفظ التغييرات',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {
//                           setState(() {
//                             // _isEditing = false;
//                             _editedPharmacist =
//                                 widget.pharmacist; // Reset changes
//                             context.mayPop();
//                           });
//                         },
//                         style: OutlinedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           side: const BorderSide(color: Colors.red),
//                         ),
//                         child: const Text(
//                           'إلغاء',
//                           style: TextStyle(fontSize: 16, color: Colors.red),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required String label,
//     required String value,
//     required IconData icon,
//     required Function(String) onChanged,
//     required String? Function(String?) validator,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextFormField(
//       initialValue: value,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: Colors.blue),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//         filled: true,
//         fillColor: Colors.grey[50],
//       ),
//       keyboardType: keyboardType,
//       onChanged: onChanged,
//       validator: validator,
//     );
//   }
//
//   String _formatDate(String dateString) {
//     if (dateString.isEmpty) return 'غير محدد';
//
//     try {
//       final date = DateTime.parse(dateString);
//       return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//     } catch (e) {
//       return dateString;
//     }
//   }
//
//   void _showSnak(SnackBar snak) {
//     // Show success message
//     ScaffoldMessenger.of(context).showSnackBar(snak);
//   }
//
//   void goBack() {
//     ref.invalidateAllAuthProviders();
//     context.mayPop();
//   }
//
//   void _saveChanges() async {
//     AppDialog().loading(message: 'جاري التعديل, الرجاء الانتضار');
//     xlog('saving ${_editedPharmacist.toJson()}');
//
//     try {
//       // Simulate API call
//       await Future.delayed(const Duration(seconds: 1));
//       final a = await appRepo.updatePharmacistProfile(
//         PharmacistProfileRequestData.fromJson(_editedPharmacist.toJson()),
//       );
//
//       AppDialog().dismiss();
//       // log(a.data)
//       a.when(
//         error: (error) {},
//         success: (data) {
//           AppDialog()
//               .show(
//                 title: 'Good',
//                 message: "تم الحفض بنجاح!!",
//                 type: DialogType.success,
//               )
//               .whenComplete(goBack);
//           // context.mayPop();
//         },
//       );
//
//       _showSnak(
//         const SnackBar(
//           content: Text('تم حفظ التغييرات بنجاح'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       // Show error message
//       _showSnak(
//         SnackBar(
//           content: Text('فشل في حفظ التغييرات: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       // Hide loading dialog
//       // if (context.mounted) {
//       //   Navigator.of(context, rootNavigator: true).pop();
//       // }
//     }
//   }
// }
