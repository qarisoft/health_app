import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/features/auth/ui/widgets/login_form.dart';
import 'package:health_app/shared/ex.dart';
import '../../../../core/constants/app_layout.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController idCardController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController dateOfBirthController;
  final TextEditingController passwordConfirmController;
  final TextEditingController licenseNumberController;
  final TextEditingController licenseDocumentUrlController;
  final TextEditingController pharmacyNameController;
  final TextEditingController specializationController;
  final TextEditingController hospitalController;
  final UserType userType;
  final VoidCallback onLogin;
  final bool isLoading;
  final String selectedUserType;
  final ValueChanged<String?> onUserTypeChanged;
  final Function(File?)?
  onLicenseDocumentPicked; // Callback for the picked file

  const RegisterForm({
    super.key,
    required this.phoneController,
    required this.passwordController,
    required this.onLogin,
    required this.isLoading,
    required this.nameController,
    required this.passwordConfirmController,
    required this.dateOfBirthController,
    required this.idCardController,
    required this.selectedUserType,
    required this.onUserTypeChanged,
    required this.emailController,
    required this.userType,
    required this.licenseNumberController,
    required this.licenseDocumentUrlController,
    required this.pharmacyNameController,
    required this.specializationController,
    required this.hospitalController,
    this.onLicenseDocumentPicked, // Add this parameter
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  File? _selectedLicenseFile;
  String _licenseFileName = '';
  bool _isPickingFile = false;

  Future<void> _pickLicenseDocument() async {
    setState(() {
      _isPickingFile = true;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx'],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile platformFile = result.files.first;

        if (platformFile.path != null) {
          File file = File(platformFile.path!);

          setState(() {
            _selectedLicenseFile = file;
            _licenseFileName = platformFile.name;
            widget.licenseDocumentUrlController.text = platformFile.name;
          });

          // Notify parent about the picked file
          if (widget.onLicenseDocumentPicked != null) {
            widget.onLicenseDocumentPicked!(file);
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${context.tr.errorPickingFile}: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isPickingFile = false;
      });
    }
  }

  void _removeSelectedFile() {
    setState(() {
      _selectedLicenseFile = null;
      _licenseFileName = '';
      widget.licenseDocumentUrlController.clear();
    });

    // Notify parent about file removal
    if (widget.onLicenseDocumentPicked != null) {
      widget.onLicenseDocumentPicked!(null);
    }
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1048576) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / 1048576).toStringAsFixed(1)} MB';
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return context.tr.enterPassword;
    }
    if (value.length < 6) {
      return context.tr.passwordTooShort;
    }
    if (widget.passwordConfirmController.text !=
        widget.passwordController.text) {
      return context.tr.passwordsDoNotMatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;
    final userTypeItems = [
      DropdownMenuItem(value: PATIENT_KEY, child: Text(localizations.patient)),
      DropdownMenuItem(
        value: PHARMACIST_KEY,
        child: Text(localizations.pharmacist),
      ),
      DropdownMenuItem(value: DOCTOR_KEY, child: Text(localizations.doctor)),
    ];

    return Column(
      spacing: AppLayout.spacingMedium,
      children: [
        Center(
          child: CustomDropdownField(
            value: widget.selectedUserType,
            items: userTypeItems,
            onChanged: widget.onUserTypeChanged,
            labelText: localizations.userType,
            hintText: localizations.selectUserType,
            prefixIcon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr.pleaseSelectUserType;
              }
              return null;
            },
          ),
        ),
        CustomTextField(
          controller: widget.nameController,
          labelText: context.tr.name,
          prefixIcon: Icons.person,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.tr.pleaseEnterName;
            }
            return null;
          },
        ),
        CustomTextField(
          controller: widget.emailController,
          labelText: context.tr.email,
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.tr.pleaseEnterEmail;
            }
            return null;
          },
        ),
        CustomTextField(
          controller: widget.phoneController,
          labelText: localizations.phoneNumber,
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.tr.pleaseEnterPhoneNumber;
            }
            return null;
          },
        ),
        CustomTextField(
          controller: widget.idCardController,
          labelText: localizations.idCardNumber,
          prefixIcon: Icons.cast_rounded,
          keyboardType: TextInputType.phone,
        ),
        CustomTextField(
          controller: widget.passwordController,
          labelText: localizations.password,
          prefixIcon: Icons.lock,
          showPasswordToggle: true,
          obscureText: true,
          validator: passwordValidator,
        ),
        CustomTextField(
          controller: widget.passwordConfirmController,
          labelText: localizations.passwordConfirmation,
          prefixIcon: Icons.lock,
          obscureText: true,
          showPasswordToggle: true,
          validator: passwordValidator,
        ),
        if (widget.userType == UserType.patient)
          CustomTextField(
            controller: widget.dateOfBirthController,
            labelText: context.tr.dateOfBirth,
            isDatePicker: true,
            lastDate: DateTime.now(),
            validator: (a) {
              if (a == null || a.isEmpty) {
                return context.tr.invalidDate;
              }
              try {
                final aa = DateTime.tryParse(a);
              } catch (e) {
                return context.tr.invalidDate;
              }
              return null;
            },
          ),

        if (widget.userType == UserType.doctor ||
            widget.userType == UserType.pharmacist)
          CustomTextField(
            controller: widget.licenseNumberController,
            labelText: context.tr.licenseNumber,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr.pleaseEnterLicenseNumber;
              }
              return null;
            },
          ),

        if (widget.userType == UserType.doctor)
          CustomTextField(
            controller: widget.hospitalController,
            labelText: context.tr.hospitalName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr.requiredField;
              }
              return null;
            },
          ),

        if (widget.userType == UserType.doctor)
          CustomTextField(
            controller: widget.specializationController,
            labelText: context.tr.specialization,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr.pleaseEnterSpecialization;
              }
              return null;
            },
          ),

        if (widget.userType == UserType.pharmacist)
          CustomTextField(
            controller: widget.pharmacyNameController,
            labelText: context.tr.pharmacyName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr.pleaseEnterPharmacyName;
              }
              return null;
            },
          ),

        CustomButton(
          onPressed: widget.onLogin,
          text: localizations.register,
          isLoading: widget.isLoading,
        ),
      ],
    );
  }
}
