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
          content: Text('Error picking file: ${e.toString()}'),
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
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (widget.passwordConfirmController.text !=
        widget.passwordController.text) {
      return 'Password don\'t match';
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
                return 'Please select user type';
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
              return 'Please enter your name';
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
              return 'Please enter your email';
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
              return 'Please enter phone number';
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
            labelText: 'Date of birth',
            isDatePicker: true,
            lastDate: DateTime.now(),
            validator: (a) {
              if (a == null || a.isEmpty) {
                return 'You must enter a valid date';
              }
              try {
                final aa = DateTime.tryParse(a);
              } catch (e) {
                return 'You must enter a valid date';
              }
              return null;
            },
          ),

        if (widget.userType == UserType.doctor ||
            widget.userType == UserType.pharmacist)
          CustomTextField(
            controller: widget.licenseNumberController,
            labelText: 'License number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter license number';
              }
              return null;
            },
          ),

        // License Document File Picker Section
        // if (
        // // false
        // // widget.userType == UserType.doctor ||
        // widget.userType == UserType.pharmacist)
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       // Hidden text field for file URL
        //       Opacity(
        //         opacity: 0,
        //         child: CustomTextField(
        //           controller: widget.licenseDocumentUrlController,
        //           labelText: '',
        //         ),
        //       ),

        //       Text(
        //         'License Document',
        //         style: TextStyle(
        //           fontSize: 14,
        //           fontWeight: FontWeight.w500,
        //           color: Theme.of(
        //             context,
        //           ).colorScheme.onSurface.withOpacity(0.8),
        //         ),
        //       ),
        //       const SizedBox(height: 8),

        //       // File picker button
        //       OutlinedButton(
        //         onPressed: _isPickingFile ? null : _pickLicenseDocument,
        //         style: OutlinedButton.styleFrom(
        //           minimumSize: const Size(double.infinity, 50),
        //           side: BorderSide(
        //             color: Theme.of(context).colorScheme.outline,
        //           ),
        //           backgroundColor: Theme.of(context).colorScheme.surface,
        //         ),
        //         child: _isPickingFile
        //             ? const SizedBox(
        //                 height: 20,
        //                 width: 20,
        //                 child: CircularProgressIndicator(strokeWidth: 2),
        //               )
        //             : Row(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   const Icon(Icons.attach_file),
        //                   const SizedBox(width: 8),
        //                   Text(
        //                     _licenseFileName.isEmpty
        //                         ? 'Choose License Document'
        //                         : 'Change Document',
        //                   ),
        //                 ],
        //               ),
        //       ),

        //       // Selected file info
        //       if (_licenseFileName.isNotEmpty)
        //         Padding(
        //           padding: const EdgeInsets.only(top: 8.0),
        //           child: Container(
        //             padding: const EdgeInsets.all(12),
        //             decoration: BoxDecoration(
        //               color: Theme.of(context).colorScheme.surfaceVariant,
        //               borderRadius: BorderRadius.circular(8),
        //               border: Border.all(
        //                 color: Theme.of(context).colorScheme.outline,
        //                 width: 0.5,
        //               ),
        //             ),
        //             child: Row(
        //               children: [
        //                 Icon(
        //                   _licenseFileName.toLowerCase().endsWith('.pdf')
        //                       ? Icons.picture_as_pdf
        //                       : Icons.description,
        //                   color: Theme.of(context).primaryColor,
        //                   size: 24,
        //                 ),
        //                 const SizedBox(width: 12),
        //                 Expanded(
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         _licenseFileName,
        //                         style: TextStyle(
        //                           fontWeight: FontWeight.w500,
        //                           fontSize: 14,
        //                           overflow: TextOverflow.ellipsis,
        //                         ),
        //                       ),
        //                       if (_selectedLicenseFile != null)
        //                         Text(
        //                           _formatFileSize(
        //                             _selectedLicenseFile!.lengthSync(),
        //                           ),
        //                           style: TextStyle(
        //                             fontSize: 12,
        //                             color: Theme.of(
        //                               context,
        //                             ).colorScheme.onSurface.withOpacity(0.6),
        //                           ),
        //                         ),
        //                     ],
        //                   ),
        //                 ),
        //                 IconButton(
        //                   onPressed: _removeSelectedFile,
        //                   icon: const Icon(Icons.close, size: 20),
        //                   padding: EdgeInsets.zero,
        //                   constraints: const BoxConstraints(),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),

        //       // Help text
        //       Padding(
        //         padding: const EdgeInsets.only(top: 4.0),
        //         child: Text(
        //           'Accepted formats: PDF, JPG, PNG, DOC (Max 10MB)',
        //           style: TextStyle(
        //             fontSize: 12,
        //             color: Theme.of(
        //               context,
        //             ).colorScheme.onSurface.withOpacity(0.6),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(height: 16),
        //     ],
        //   ),
        if (widget.userType == UserType.doctor)
          CustomTextField(
            controller: widget.hospitalController,
            labelText: 'Hospital',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter hospital name';
              }
              return null;
            },
          ),

        if (widget.userType == UserType.doctor)
          CustomTextField(
            controller: widget.specializationController,
            labelText: 'Specialization',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter specialization';
              }
              return null;
            },
          ),

        if (widget.userType == UserType.pharmacist)
          CustomTextField(
            controller: widget.pharmacyNameController,
            labelText: 'Pharmacy name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter pharmacy name';
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
