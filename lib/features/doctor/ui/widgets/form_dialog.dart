import 'package:flutter/material.dart';
import 'package:health_app/core/constants/app_layout.dart';
import 'package:health_app/shared/ex.dart';
import '../../domain/patient.dart' show Patient;

class PatientFormDialog extends StatefulWidget {
  final Patient? patient;
  final Function(Patient) onSubmit;
  final bool isEditing;

  const PatientFormDialog({
    super.key,
    this.patient,
    required this.onSubmit,
    this.isEditing = false,
  });

  @override
  State<PatientFormDialog> createState() => _PatientFormDialogState();
}

class _PatientFormDialogState extends State<PatientFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emergencyController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String? _selectedGender;
  String? _selectedBloodType;
  DateTime? _selectedDate;
  bool _isActive = true;

  final List<String> _bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  final List<String> _genders = ['male', 'female', 'other'];

  @override
  void initState() {
    super.initState();
    if (widget.patient != null) {
      _nameController.text = widget.patient!.name;
      _phoneController.text = widget.patient!.phoneNumber;
      _nationalIdController.text = widget.patient!.nationalId;
      _emailController.text = widget.patient!.email ?? '';
      _addressController.text = widget.patient!.address ?? '';
      _emergencyController.text = widget.patient!.emergencyContact ?? '';
      _notesController.text = widget.patient!.notes ?? '';
      _selectedGender = widget.patient!.gender;
      _selectedBloodType = widget.patient!.bloodType;
      _selectedDate = widget.patient!.dateOfBirth;
      _isActive = widget.patient!.isActive;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _nationalIdController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _emergencyController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;
    // final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      constraints: BoxConstraints(
        // maxWidth: MediaQuery.widthOf(context),
        // maxHeight: MediaQuery.heightOf(context) * 0.8,
      ),
      // color: Colors.red,
      child: Dialog(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.widthOf(context),
          maxHeight: MediaQuery.heightOf(context) * 0.6,
        ),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: AppLayout.spacingMedium,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.isEditing
                    ? localizations.editPatient
                    : localizations.addPatient,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: AppLayout.spacingMedium,
                      children: [
                        // Padding(padding: EdgeInsetsGeometry.all(30),child: Text('data'),)
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: localizations.patientName,
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return localizations.requiredField;
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: localizations.phoneNumber,
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return localizations.requiredField;
                            }
                            if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                              return localizations.invalidPhone;
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _nationalIdController,
                          decoration: InputDecoration(
                            labelText: localizations.nationalId,
                            prefixIcon: const Icon(Icons.badge),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return localizations.requiredField;
                            }
                            if (value.length < 10) {
                              return localizations.invalidNationalId;
                            }
                            return null;
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gender Dropdown
                            Expanded(
                              child: Column(
                                spacing: AppLayout.spacingSmall,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.tr.gender),
                                  DropdownButtonFormField<String>(
                                    initialValue: _selectedGender,
                                    decoration: InputDecoration(
                                      // labelText: localizations.gender,
                                      prefixIcon: const Icon(
                                        Icons.person_outline,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    items: _genders.map((String gender) {
                                      return DropdownMenuItem<String>(
                                        value: gender,
                                        child: Text(
                                          gender == 'male'
                                              ? localizations.male
                                              : gender == 'female'
                                              ? localizations.female
                                              : localizations.other,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return localizations.requiredField;
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),

                            // Blood Type Dropdown
                            Expanded(
                              child: Column(
                                spacing: AppLayout.spacingSmall,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.tr.bloodType),
                                  DropdownButtonFormField<String>(
                                    initialValue: _selectedBloodType,
                                    decoration: InputDecoration(
                                      // labelText: localizations.bloodType,
                                      prefixIcon: const Icon(Icons.bloodtype),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    // padding: EdgeInsets.all(1),
                                    items: _bloodTypes.map((String type) {
                                      return DropdownMenuItem<String>(
                                        value: type,
                                        child: Text(
                                          type,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedBloodType = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: _selectDate,
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: TextEditingController(
                                text: _selectedDate != null
                                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                    : localizations.dateOfBirth,
                              ),
                              decoration: InputDecoration(
                                labelText: localizations.dateOfBirth,
                                prefixIcon: const Icon(Icons.calendar_today),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            labelText: localizations.address,
                            prefixIcon: const Icon(Icons.location_on),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          maxLines: 2,
                        ),

                        // Emergency Contact
                        TextFormField(
                          controller: _emergencyController,
                          decoration: InputDecoration(
                            labelText: localizations.emergencyContact,
                            prefixIcon: const Icon(Icons.emergency),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        TextFormField(
                          controller: _notesController,
                          decoration: InputDecoration(
                            labelText: localizations.notes,
                            hintText: localizations.enterNotes,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          maxLines: 3,
                        ),
                        Row(
                          children: [

                            Switch(
                              value: _isActive,
                              onChanged: (value) {
                                setState(() {
                                  _isActive = value;
                                });
                              },
                              activeThumbColor: Colors.green,
                            ),
                            Text(
                              _isActive
                                  ? localizations.active
                                  : localizations.inactive,
                              style: TextStyle(
                                color: _isActive ? Colors.green : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              //
              Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.s,
                    children: [

                      TextButton(
                        onPressed: _submitForm,
                        child: Text(
                          widget.isEditing
                              ? localizations.update
                              : localizations.add,
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(child: Text(localizations.cancel)),

                    ],
                  ),
                  // Text('data'),
                ],
              ),
              // ,
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final patient = Patient(
        id:
            widget.patient?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        phoneNumber: _phoneController.text,
        nationalId: _nationalIdController.text,
        dateOfBirth: _selectedDate,
        email: _emailController.text.isNotEmpty ? _emailController.text : null,
        address: _addressController.text.isNotEmpty
            ? _addressController.text
            : null,
        emergencyContact: _emergencyController.text.isNotEmpty
            ? _emergencyController.text
            : null,
        bloodType: _selectedBloodType,
        gender: _selectedGender ?? 'male',
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
        isActive: _isActive,
        createdAt: widget.patient?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      widget.onSubmit(patient);
      Navigator.pop(context);
    }
  }
}
