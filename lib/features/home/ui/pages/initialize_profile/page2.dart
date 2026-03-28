import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/features/auth/domain/models/patient.dart';
import 'package:health_app/shared/ex.dart';
import 'package:intl/intl.dart';

import '../../../../../di.dart' show appRepo;
import 'p.dart';

class InitializeProfilePage2 extends ConsumerStatefulWidget {
  const InitializeProfilePage2({super.key, this.pprofile, this.onBackPressed});

  final VoidCallback? onBackPressed;

  final Patient? pprofile;

  @override
  ConsumerState<InitializeProfilePage2> createState() =>
      _InitializeProfilePage2State();
}

class _InitializeProfilePage2State
    extends ConsumerState<InitializeProfilePage2> {
  final _formKey = GlobalKey<FormState>();

  // Controllers managed in State to avoid disposal issues
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileProvider);

    _fullNameController = TextEditingController(
      text: widget.pprofile?.fullName ?? profile.fullName,
    );
    _phoneController = TextEditingController(
      text: widget.pprofile?.phoneNumber ?? profile.phoneNumber,
    );
    _emailController = TextEditingController(
      text: widget.pprofile?.email ?? profile.email,
    );
    _addressController = TextEditingController(
      text: widget.pprofile?.address ?? profile.address,
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentStep = ref.watch(
      pProfileProvider.select((s) => s.currentStep),
    );
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'إنشاء الملف الشخصي',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // _goBack()
            context.mayPop().whenComplete(() {
              widget.onBackPressed?.call();
            });
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildStepper(currentStep),
            Expanded(
              child: IndexedStack(
                index: currentStep,
                children: [
                  PersonalInfoStep(
                    formKey: _formKey,
                    fullNameController: _fullNameController,
                    phoneController: _phoneController,
                    emailController: _emailController,
                    addressController: _addressController,
                  ),
                  MedicalInfoStep(),
                ],
              ),
            ),
            _buildBottomNavigation(currentStep, isLoading),
          ],
        ),
      ),
    );
  }

  Widget _buildStepper(int currentStep) {
    final steps = ['الشخصية', 'الطبية'];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: List.generate(steps.length, (index) {
              bool isDone = index < currentStep;
              bool isCurrent = index == currentStep;
              return Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCurrent || isDone
                            ? Colors.blue
                            : Colors.grey[300],
                        border: isCurrent
                            ? Border.all(color: Colors.blueAccent, width: 2)
                            : null,
                      ),
                      child: Center(
                        child: isDone
                            ? const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              )
                            : Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: isCurrent || isDone
                                      ? Colors.white
                                      : Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                      ),
                    ),
                    if (index != steps.length - 1)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: isDone ? Colors.blue : Colors.grey[300],
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          Text(
            steps[currentStep],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(int currentStep, bool isLoading) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              children: [
                if (currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () =>
                          ref.read(pProfileProvider.notifier).previousStep(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(context.tr.previous),
                    ),
                  ),
                if (currentStep > 0) const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () async {
                      final a = await appRepo.getPatientFullProfile();
                      a.whenOrNull(
                        success: (d) {
                          xlog(jsonEncode(d.toJson()));
                        },
                      );
                      // _handleNext(currentStep);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentStep == 1
                          ? Colors.green
                          : Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      currentStep == 1 ? context.tr.confirm : context.tr.next,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _handleNext(int currentStep) {
    if (currentStep == 0) {
      if (_formKey.currentState!.validate()) {
        ref.read(pProfileProvider.notifier).nextStep();
      }
    } else {
      _submit();
      // ref.read(pProfileProvider.notifier).nextStep();
    }
  }

  void _goBack() {
    if (ref.read(currentStepProvider) > 0) {
      ref.read(pProfileProvider.notifier).previousStep();
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _submit() async {
    await ref.read(pProfileProvider.notifier).updateProfile();
    context.mayPop();
  }
}

// --- Steps Sub-Widgets ---

class PersonalInfoStep extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController addressController;

  const PersonalInfoStep({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.phoneController,
    required this.emailController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(pProfileProvider.notifier);
    final profile = ref.watch(profileProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          spacing: 16,
          children: [
            _buildField(
              controller: fullNameController,
              label: 'الاسم الكامل',
              icon: Icons.person,
              onChanged: notifier.updateFullName,
              validator: (v) => v!.isEmpty ? 'الرجاء إدخال الاسم' : null,
            ),

            _buildDateField(
              context,
              profile.dateOfBirth,
              notifier.updateDateOfBirth,
            ),

            _buildGenderPicker(profile.gender, notifier.updateGender),

            _buildField(
              controller: phoneController,
              label: 'رقم الهاتف',
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
              onChanged: notifier.updatePhoneNumber,
            ),

            _buildField(
              controller: emailController,
              label: 'البريد الإلكتروني',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              onChanged: notifier.updateEmail,
            ),
            _buildField(
              controller: addressController,
              label: 'العنوان',
              icon: Icons.home,
              keyboardType: TextInputType.text,
              onChanged: notifier.updateAddress,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Function(String) onChanged,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
      ),
    );
  }

  Widget _buildDateField(
    BuildContext context,
    String value,
    Function(String) onSave,
  ) {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime(1990),
          firstDate: DateTime(1920),
          lastDate: DateTime.now(),
        );
        if (date != null) onSave(date.toIso8601String());
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'تاريخ الميلاد',
          prefixIcon: const Icon(Icons.calendar_month, color: Colors.blue),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          value.isEmpty
              ? 'اختر التاريخ'
              : DateFormat('yyyy-MM-dd').format(DateTime.parse(value)),
        ),
      ),
    );
  }

  Widget _buildGenderPicker(int selected, Function(int) onSelect) {
    return Row(
      children: [
        Expanded(
          child: _genderBtn('ذكر', 1, Icons.male, selected == 1, onSelect),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _genderBtn('أنثى', 2, Icons.female, selected == 2, onSelect),
        ),
      ],
    );
  }

  Widget _genderBtn(
    String label,
    int val,
    IconData icon,
    bool active,
    Function(int) onSelect,
  ) {
    return InkWell(
      onTap: () => onSelect(val),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: active ? Colors.blue[50] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: active ? Colors.blue : Colors.grey[300]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: active ? Colors.blue : Colors.grey),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class MedicalInfoStep extends ConsumerWidget {
  MedicalInfoStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(pProfileProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          DropdownButtonFormField<int>(
            initialValue: profile.bloodType == 0 ? null : profile.bloodType,
            decoration: InputDecoration(
              labelText: 'فصيلة الدم',
              prefixIcon: const Icon(Icons.bloodtype, color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: List.generate(
              8,
              (i) => DropdownMenuItem(
                value: i.next,
                child: Text(i.next.bloodTypeString()),
              ),
            ),
            onChanged: (v) => notifier.updateBloodType(v!),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _numField(
                  'الوزن (كجم)',
                  profile.weight,
                  notifier.updateWeight,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _numField(
                  'الطول (سم)',
                  profile.height,
                  notifier.updateHeight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextOnlyField(
            'جهة اتصال الطوارئ',
            profile.emergencyContact,
            notifier.updateEmergencyContact,
          ),
          const SizedBox(height: 16),
          _buildTextOnlyField(
            'رقم هاتف الطوارئ',
            profile.emergencyPhone,
            notifier.updateEmergencyPhone,
            keyboard: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  Widget _numField(String label, double val, Function(double) onSave) {
    return TextFormField(
      initialValue: val > 0 ? val.toString() : '',
      keyboardType: TextInputType.number,
      onChanged: (v) => onSave(double.tryParse(v) ?? 0),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildTextOnlyField(
    String label,
    String val,
    Function(String) onSave, {
    TextInputType? keyboard,
  }) {
    return TextFormField(
      initialValue: val,
      keyboardType: keyboard,
      onChanged: onSave,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// Helper for repetitive list steps
Widget _buildListStep(
  BuildContext context,
  String title,
  List items,
  IconData icon,
  VoidCallback onAdd,
  Function(int) onTap,
  Function(int) onDel,
) {
  return Column(
    children: [
      ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.blue, size: 30),
          onPressed: onAdd,
        ),
      ),
      Expanded(
        child: items.isEmpty
            ? Center(child: Text('لا يوجد $title مضافة'))
            : ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (c, i) => Card(
                  child: ListTile(
                    leading: Icon(icon, color: Colors.blue),
                    title: Text(items[i].toString()),
                    // Simplified: Models should have a descriptive toString or specific name field
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => onDel(i),
                    ),
                    onTap: () => onTap(i),
                  ),
                ),
              ),
      ),
    ],
  );
}
