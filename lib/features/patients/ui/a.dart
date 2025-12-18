import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/features/patients/domain/models/medical_history.dart'
    show BloodType, Gender, MedicalHistory;
import 'package:health_app/l10n/app_localizations.dart' show AppLocalizations;
import 'package:health_app/shared/ex.dart';
// import '../models/medical_history.dart';/

class MedicalHistoryForm extends StatefulWidget {
  final MedicalHistory? initialData;
  final Function(MedicalHistory) onSave;

  const MedicalHistoryForm({super.key, this.initialData, required this.onSave});

  @override
  State<MedicalHistoryForm> createState() => _MedicalHistoryFormState();
}

class _MedicalHistoryFormState extends State<MedicalHistoryForm> {
  final _formKey = GlobalKey<FormState>();
  late MedicalHistory _medicalHistory;

  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _emergencyNameController =
      TextEditingController();
  final TextEditingController _emergencyPhoneController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _medicalHistory =
        widget.initialData ??
        MedicalHistory(
          patientId: '',
          patientName: '',
          dateOfBirth: DateTime.now(),
          gender: Gender.male,
          phoneNumber: '',
          email: '',
          address: '',
          emergencyContactName: '',
          emergencyContactPhone: '',
          emergencyContactRelationship: '',
          height: 0,
          weight: 0,
          bloodType: BloodType.aNegative,
          isSmoker: false,
          cigarettesPerDay: 0,
          isAlcoholConsumer: false,
          alcoholFrequency: '',
          usesRecreationalDrugs: false,
          recreationalDrugsDetails: '',
          exerciseFrequency: '',
          dietaryPreferences: '',
          lastUpdated: DateTime.now(),
          createdAt: DateTime.now(),
        );

    // Initialize controllers with initial data
    if (widget.initialData != null) {
      _patientNameController.text = widget.initialData!.patientName;
      _phoneController.text = widget.initialData!.phoneNumber;
      _addressController.text = widget.initialData!.address;
      _heightController.text = widget.initialData!.height.toString();
      _weightController.text = widget.initialData!.weight.toString();
      // _bloodTypeController.text = widget.initialData!.bloodType;
      _emergencyNameController.text = widget.initialData!.emergencyContactName;
      _emergencyPhoneController.text =
          widget.initialData!.emergencyContactPhone;
      _emailController.text = widget.initialData!.email ?? '';
    }
  }

  @override
  void dispose() {
    _patientNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _bloodTypeController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Information Section
            _buildSectionHeader(localizations.personalInformation),
            _buildTextField(
              label: localizations.patientName,
              controller: _patientNameController,
              validator: (value) =>
                  value!.isEmpty ? localizations.requiredField : null,
            ),
            _buildDateField(
              label: localizations.dateOfBirth,
              initialDate: _medicalHistory.dateOfBirth,
              onDateSelected: (date) {
                setState(() {
                  _medicalHistory = _medicalHistory.copyWith(dateOfBirth: date);
                });
              },
            ),
            _buildDropdownField<Gender>(
              label: localizations.gender,
              value: _medicalHistory.gender,
              items: Gender.values,
              displayBuilder: (gender) =>
                  _getGenderDisplayName(gender, localizations),
              onChanged: (value) {
                setState(() {
                  _medicalHistory = _medicalHistory.copyWith(gender: value!);
                });
              },
            ),

            // Contact Information
            _buildSectionHeader(localizations.contactInformation),
            _buildTextField(
              label: localizations.phoneNumber,
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) return localizations.requiredField;
                if (!RegExp(r'^[0-9]{9,}$').hasMatch(value)) {
                  return localizations.invalidPhone;
                }
                return null;
              },
            ),
            _buildTextField(
              label: localizations.email,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                _medicalHistory = _medicalHistory.copyWith(email: value);
              },
            ),
            _buildTextField(
              label: localizations.address,
              controller: _addressController,
              maxLines: 2,
              validator: (value) =>
                  value!.isEmpty ? localizations.requiredField : null,
            ),

            // Emergency Contact
            _buildSectionHeader(localizations.emergencyContact),
            _buildTextField(
              label: localizations.emergencyContactName,
              controller: _emergencyNameController,
              validator: (value) =>
                  value!.isEmpty ? localizations.requiredField : null,
            ),
            _buildTextField(
              label: localizations.emergencyContactPhone,
              controller: _emergencyPhoneController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) return localizations.requiredField;
                if (!RegExp(r'^[0-9]{9,}$').hasMatch(value)) {
                  return localizations.invalidPhone;
                }
                return null;
              },
            ),

            // Vital Statistics
            _buildSectionHeader(localizations.vitalStatistics),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label:
                        '${localizations.height} (${localizations.heightUnit})',
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return localizations.requiredField;
                      final height = double.tryParse(value);
                      if (height == null || height < 1 || height > 300) {
                        return localizations.invalidHeight;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    label:
                        '${localizations.weight} (${localizations.weightUnit})',
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return localizations.requiredField;
                      final weight = double.tryParse(value);
                      if (weight == null || weight < 1 || weight > 500) {
                        return localizations.invalidWeight;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            _buildBloodTypeDropdown(context),
            // _buildTextField(
            //   label: localizations.bloodType,
            //   controller: _bloodTypeController,
            //   validator: (value) =>
            //       value!.isEmpty ? localizations.requiredField : null,
            // ),

            // Lifestyle
            _buildSectionHeader(localizations.lifestyle),
            _buildSwitchField(
              label: localizations.isSmoker,
              value: _medicalHistory.isSmoker,
              onChanged: (value) {
                setState(() {
                  _medicalHistory = _medicalHistory.copyWith(isSmoker: value);
                });
              },
            ),
            if (_medicalHistory.isSmoker)
              _buildTextField(
                label: localizations.cigarettesPerDay,
                initialValue: _medicalHistory.cigarettesPerDay.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _medicalHistory = _medicalHistory.copyWith(
                    cigarettesPerDay: int.tryParse(value) ?? 0,
                  );
                },
              ),

            _buildSwitchField(
              label: localizations.isAlcoholConsumer,
              value: _medicalHistory.isAlcoholConsumer,
              onChanged: (value) {
                setState(() {
                  _medicalHistory = _medicalHistory.copyWith(
                    isAlcoholConsumer: value,
                  );
                });
              },
            ),
            if (_medicalHistory.isAlcoholConsumer)
              _buildTextField(
                label: localizations.alcoholFrequency,
                initialValue: _medicalHistory.alcoholFrequency,
                onChanged: (value) {
                  _medicalHistory = _medicalHistory.copyWith(
                    alcoholFrequency: value,
                  );
                },
              ),

            _buildSwitchField(
              label: localizations.usesRecreationalDrugs,
              value: _medicalHistory.usesRecreationalDrugs,
              onChanged: (value) {
                setState(() {
                  _medicalHistory = _medicalHistory.copyWith(
                    usesRecreationalDrugs: value,
                  );
                });
              },
            ),
            if (_medicalHistory.usesRecreationalDrugs)
              _buildTextField(
                label: localizations.recreationalDrugsDetails,
                initialValue: _medicalHistory.recreationalDrugsDetails ?? '',
                maxLines: 2,
                onChanged: (value) {
                  _medicalHistory = _medicalHistory.copyWith(
                    recreationalDrugsDetails: value,
                  );
                },
              ),

            _buildTextField(
              label: localizations.exerciseFrequency,
              initialValue: _medicalHistory.exerciseFrequency,
              onChanged: (value) {
                _medicalHistory = _medicalHistory.copyWith(
                  exerciseFrequency: value,
                );
              },
              validator: (value) =>
                  value!.isEmpty ? localizations.requiredField : null,
            ),

            _buildTextField(
              label: localizations.dietaryPreferences,
              initialValue: _medicalHistory.dietaryPreferences,
              maxLines: 2,
              onChanged: (value) {
                _medicalHistory = _medicalHistory.copyWith(
                  dietaryPreferences: value,
                );
              },
              validator: (value) =>
                  value!.isEmpty ? localizations.requiredField : null,
            ),

            // Additional Information
            _buildSectionHeader(localizations.additionalInformation),
            _buildTextField(
              label:
                  '${localizations.chronicConditions} (${localizations.chronicConditionsHint})',
              initialValue: _medicalHistory.chronicConditions?.join(', '),
              maxLines: 3,
              onChanged: (value) {
                final conditions = value
                    .split(',')
                    .map((e) => e.trim())
                    .where((e) => e.isNotEmpty)
                    .toList();
                _medicalHistory = _medicalHistory.copyWith(
                  chronicConditions: conditions,
                );
              },
            ),

            _buildTextField(
              label:
                  '${localizations.allergies} (${localizations.allergiesHint})',
              initialValue: _medicalHistory.allergies?.join(', '),
              maxLines: 3,
              onChanged: (value) {
                final allergies = value
                    .split(',')
                    .map((e) => e.trim())
                    .where((e) => e.isNotEmpty)
                    .toList();
                _medicalHistory = _medicalHistory.copyWith(
                  allergies: allergies,
                );
              },
            ),

            _buildTextField(
              label:
                  '${localizations.currentMedications} (${localizations.currentMedicationsHint})',
              initialValue: _medicalHistory.currentMedications?.join(', '),
              maxLines: 3,
              onChanged: (value) {
                final medications = value
                    .split(',')
                    .map((e) => e.trim())
                    .where((e) => e.isNotEmpty)
                    .toList();
                _medicalHistory = _medicalHistory.copyWith(
                  currentMedications: medications,
                );
              },
            ),

            // Save Button
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _saveForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                ),
                child: Text(
                  localizations.saveMedicalHistory,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  
Widget _buildBloodTypeDropdown(BuildContext context) {
  final localizations = context.tr;
  final screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            localizations.bloodType,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _showSimpleCupertinoPicker(context),
          child: Container(
            width: screenWidth * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: 
                // _medicalHistory.bloodType == BloodType.unknown
                    // ? 
                    Colors.grey.shade300,
                    // : Colors.blue,
                width:  1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _medicalHistory.bloodType == BloodType.unknown
                        ? localizations.selectBloodType
                        : _medicalHistory.bloodType.arabicSymbol,
                    style: TextStyle(
                      fontSize: 16,
                      color: _medicalHistory.bloodType == BloodType.unknown
                          ? Colors.grey[600]
                          : Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: _medicalHistory.bloodType == BloodType.unknown
                      ? Colors.grey[600]
                      : Colors.blue,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
        if (_medicalHistory.bloodType == BloodType.unknown)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 4.0),
            child: Text(
              localizations.requiredField,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    ),
  );
}

void _showSimpleCupertinoPicker(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: screenHeight * 0.4,
        margin: EdgeInsets.only(
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
        ),
        child: Column(
          children: [
            // Top spacing
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            // Picker Container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Picker
                  SizedBox(
                    height: 200,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 44,
                      scrollController: FixedExtentScrollController(
                        initialItem: BloodType.values
                            .where((type) => type != BloodType.unknown)
                            .toList()
                            .indexOf(_medicalHistory.bloodType == BloodType.unknown
                                ? BloodType.aPositive
                                : _medicalHistory.bloodType),
                      ),
                      onSelectedItemChanged: (int index) {
                        final types = BloodType.values.where((type) => type != BloodType.unknown).toList();
                        final selectedType = types[index];
                        setState(() {
                          _medicalHistory = _medicalHistory.copyWith(bloodType: selectedType);
                        });
                      },
                      children: BloodType.values.where((type) => type != BloodType.unknown).map((BloodType type) {
                        return Center(
                          child: Text(
                            type.arabicSymbol,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // Done Button
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey[200]!, width: 0.5),
                      ),
                    ),
                    child: CupertinoButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildBloodTypeDropdown2(BuildContext context) {
  final localizations = context.tr;

  return Center(
    child: SizedBox(
      width: MediaQuery.widthOf(context) * 0.7,
      child: DropdownButtonFormField<BloodType>(
        initialValue: _medicalHistory.bloodType,
        decoration: InputDecoration(
          labelText: localizations.bloodType,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          filled: true,
          fillColor: Colors.grey[50],
          // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        items: BloodType.values.where((type) => type != BloodType.unknown).map((
          BloodType type,
        ) {
          return DropdownMenuItem<BloodType>(
            value: type,
            child: Text(
              type.arabicSymbol,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: (BloodType? value) {
          setState(() {
            _medicalHistory = _medicalHistory.copyWith(
              bloodType: value ?? BloodType.unknown,
            );
          });
        },
        validator: (value) {
          if (value == null || value == BloodType.unknown) {
            return localizations.requiredField;
          }
          return null;
        },
        hint: Text(localizations.selectBloodType),
        // isExpanded: true,
      ),
    ),
  );
}

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextEditingController? controller,
    String? initialValue,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          filled: true,
          fillColor: Colors.grey[50],
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDateField({
    required String label,
    required DateTime initialDate,
    required Function(DateTime) onDateSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (selectedDate != null) {
            onDateSelected(selectedDate);
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Colors.grey[50],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDate(initialDate)),
              const Icon(Icons.calendar_today, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required T value,
    required List<T> items,
    required String Function(T) displayBuilder,
    required Function(T?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField<T>(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          filled: true,
          fillColor: Colors.grey[50],
        ),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(displayBuilder(item)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSwitchField({
    required String label,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),

          // Switch(
          //   value: value,
          //   onChanged: onChanged,
          //   splashRadius: 5,

          // ),
          CupertinoSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _getGenderDisplayName(Gender gender, AppLocalizations localizations) {
    switch (gender) {
      case Gender.male:
        return localizations.male;
      case Gender.female:
        return localizations.female;
      // case Gender.other:
      //   return localizations.other;
      // case Gender.preferNotToSay:
      //   return localizations.preferNotToSay;
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Update the medical history with form data
      final updatedHistory = _medicalHistory.copyWith(
        patientName: _patientNameController.text,
        phoneNumber: _phoneController.text,
        address: _addressController.text,
        height: double.tryParse(_heightController.text) ?? 0,
        weight: double.tryParse(_weightController.text) ?? 0,
        // bloodType: _bloodTypeController.text,
        emergencyContactName: _emergencyNameController.text,
        emergencyContactPhone: _emergencyPhoneController.text,
        lastUpdated: DateTime.now(),
      );

      widget.onSave(updatedHistory);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.tr.medicalHistorySaved)));
    }
  }
}
