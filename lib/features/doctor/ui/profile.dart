import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Doctor;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:health_app/features/auth/domain/models/patient.dart';

class DoctorProfilePage extends StatefulWidget {
  final Doctor doctor;

  const DoctorProfilePage({Key? key, required this.doctor}) : super(key: key);

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  bool _isEditing = false;
  late Doctor _editedDoctor;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _editedDoctor = widget.doctor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'تعديل الملف الشخصي' : 'الملف الشخصي للطبيب'),
        centerTitle: true,
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _isEditing ? _buildEditForm() : _buildProfileView(),
      ),
    );
  }

  Widget _buildProfileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Header
        _buildProfileHeader(),
        const SizedBox(height: 24),

        // Personal Information
        _buildSection(
          title: 'المعلومات الشخصية',
          children: [
            _buildInfoItem(
              icon: Icons.person,
              label: 'الاسم الكامل',
              value: _editedDoctor.fullName,
            ),
            _buildInfoItem(
              icon: Icons.phone,
              label: 'رقم الهاتف',
              value: _editedDoctor.phoneNumber,
            ),
            _buildInfoItem(
              icon: Icons.email,
              label: 'البريد الإلكتروني',
              value: _editedDoctor.email,
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Professional Information
        _buildSection(
          title: 'المعلومات المهنية',
          children: [
            _buildInfoItem(
              icon: Icons.medical_services,
              label: 'التخصص',
              value: _editedDoctor.specialization,
            ),
            _buildInfoItem(
              icon: Icons.badge,
              label: 'رقم الرخصة',
              value: _editedDoctor.licenseNumber,
            ),
            _buildInfoItem(
              icon: Icons.local_hospital,
              label: 'المستشفى',
              value: _editedDoctor.hospital,
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Account Information
        _buildSection(
          title: 'معلومات الحساب',
          children: [
            _buildInfoItem(
              icon: Icons.person_pin,
              label: 'رقم المستخدم',
              value: _editedDoctor.userId.toString(),
            ),
            _buildInfoItem(
              icon: Icons.calendar_today,
              label: 'تاريخ الإنشاء',
              value: _formatDate(_editedDoctor.createdAt),
            ),
            _buildInfoItem(
              icon: Icons.update,
              label: 'آخر تحديث',
              value: _formatDate(_editedDoctor.updatedAt),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Avatar
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

            // Doctor Name
            Text(
              _editedDoctor.fullName.isNotEmpty
                  ? _editedDoctor.fullName
                  : 'الدكتور',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Specialization
            if (_editedDoctor.specialization.isNotEmpty)
              Text(
                _editedDoctor.specialization,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

            const SizedBox(height: 8),

            // Hospital
            if (_editedDoctor.hospital.isNotEmpty)
              Text(
                _editedDoctor.hospital,
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
            // Section Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // Divider
            Container(height: 1, color: Colors.grey[300]),
            const SizedBox(height: 12),

            // Section Content
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
                  value.isNotEmpty ? value : 'غير محدد',
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name Field
          _buildTextField(
            label: 'الاسم الكامل',
            value: _editedDoctor.fullName,
            icon: Icons.person,
            onChanged: (value) {
              setState(() {
                _editedDoctor = _editedDoctor.copyWith(fullName: value);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال الاسم الكامل';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Specialization Field
          _buildTextField(
            label: 'التخصص',
            value: _editedDoctor.specialization,
            icon: Icons.medical_services,
            onChanged: (value) {
              setState(() {
                _editedDoctor = _editedDoctor.copyWith(specialization: value);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال التخصص';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Phone Number Field
          _buildTextField(
            label: 'رقم الهاتف',
            value: _editedDoctor.phoneNumber,
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              setState(() {
                _editedDoctor = _editedDoctor.copyWith(phoneNumber: value);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال رقم الهاتف';
              }
              if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
                return 'رقم الهاتف غير صالح';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Email Field
          _buildTextField(
            label: 'البريد الإلكتروني',
            value: _editedDoctor.email,
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              setState(() {
                _editedDoctor = _editedDoctor.copyWith(email: value);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'البريد الإلكتروني غير صالح';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // License Number Field
          _buildTextField(
            label: 'رقم الرخصة',
            value: _editedDoctor.licenseNumber,
            icon: Icons.badge,
            onChanged: (value) {
              setState(() {
                _editedDoctor = _editedDoctor.copyWith(licenseNumber: value);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال رقم الرخصة';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Hospital Field
          _buildTextField(
            label: 'المستشفى',
            value: _editedDoctor.hospital,
            icon: Icons.local_hospital,
            onChanged: (value) {
              setState(() {
                _editedDoctor = _editedDoctor.copyWith(hospital: value);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال اسم المستشفى';
              }
              return null;
            },
          ),

          const SizedBox(height: 32),

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
                      _isEditing = false;
                      _editedDoctor = widget.doctor; // Reset changes
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

  void _saveChanges() async {
    // Show loading dialog
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    AppDialog().loading(message: 'dasd das dsad dsadsa fdasfds');

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      final a = await di<AppRepositories>().updateDoctorProfile(
        _editedDoctor.toJson(),
      );

      AppDialog().dismiss();
      // log(a.data)
      a.when(
        error: (error) {},
        success: (data) {
          setState(() {
            _editedDoctor = Doctor.fromJson(
              data.doctor?.toJson() ?? _editedDoctor.toJson(),
            );
          });
        },
      );

      // Update local state
      setState(() {
        _isEditing = false;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم حفظ التغييرات بنجاح'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
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

// Example usage in another file:
class DoctorProfileScreen extends StatelessWidget {
  final Doctor doctor = Doctor(
    id: 1,
    userId: 106,
    fullName: 'د. أحمد محمد',
    specialization: 'أمراض القلب',
    phoneNumber: '0551234567',
    email: 'ahmed.mohamed@example.com',
    licenseNumber: 'MED-123456',
    hospital: 'مستشفى الملك فهد',
    createdAt: '2025-12-16T19:49:28.853Z',
    updatedAt: '2025-12-16T19:52:21.197Z',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Almarai', // Arabic font
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: DoctorProfilePage(doctor: doctor),
      ),
    );
  }
}
