import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/models.dart';
// import '../models/patient_profile.dart';

class AllergyDialog extends ConsumerStatefulWidget {
  final Allergy? allergy;
  final List<String> severityLevels;
  final Function(Allergy) onSave;

  const AllergyDialog({
    super.key,
    this.allergy,
    required this.severityLevels,
    required this.onSave,
  });

  @override
  ConsumerState<AllergyDialog> createState() => _AllergyDialogState();
}

class _AllergyDialogState extends ConsumerState<AllergyDialog> {
  late Allergy _allergy;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _allergy = widget.allergy ?? Allergy();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.allergy == null ? 'إضافة حساسية جديدة' : 'تعديل الحساسية'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _allergy.allergenName,
                decoration: const InputDecoration(
                  labelText: 'اسم المادة المسببة للحساسية',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'الرجاء إدخال اسم المادة' : null,
                onChanged: (value) => setState(() {
                  _allergy = _allergy.copyWith(allergenName: value);
                }),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _allergy.reaction,
                decoration: const InputDecoration(
                  labelText: 'رد الفعل',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() {
                  _allergy = _allergy.copyWith(reaction: value);
                }),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _allergy.severity.isNotEmpty ? _allergy.severity : null,
                decoration: const InputDecoration(
                  labelText: 'شدة الحساسية',
                  border: OutlineInputBorder(),
                ),
                items: widget.severityLevels.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _allergy = _allergy.copyWith(severity: value ?? '');
                  });
                },
                validator: (value) => value == null ? 'الرجاء اختيار الشدة' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _save,
          child: const Text('حفظ'),
        ),
      ],
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(_allergy);
      Navigator.pop(context);
    }
  }
}




class MedicationDialog extends StatefulWidget {
  final CurrentMedication? medication;
  final Function(CurrentMedication) onSave;

  const MedicationDialog({
    super.key,
    this.medication,
    required this.onSave,
  });

  @override
  State<MedicationDialog> createState() => _MedicationDialogState();
}

class _MedicationDialogState extends State<MedicationDialog> {
  final _formKey = GlobalKey<FormState>();
  late CurrentMedication _medication;

  @override
  void initState() {
    super.initState();
    _medication = widget.medication ?? CurrentMedication();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.medication == null ? 'إضافة دواء جديد' : 'تعديل الدواء'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _medication.medicationName,
                decoration: const InputDecoration(
                  labelText: 'اسم الدواء',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'الرجاء إدخال اسم الدواء' : null,
                onChanged: (value) => _medication = _medication.copyWith(medicationName: value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _medication.dosage,
                decoration: const InputDecoration(
                  labelText: 'الجرعة',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'الرجاء إدخال الجرعة' : null,
                onChanged: (value) => _medication = _medication.copyWith(dosage: value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _medication.frequency,
                decoration: const InputDecoration(
                  labelText: 'التكرار',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'الرجاء إدخال التكرار' : null,
                onChanged: (value) => _medication = _medication.copyWith(frequency: value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _medication.duration,
                decoration: const InputDecoration(
                  labelText: 'المدة',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _medication = _medication.copyWith(duration: value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _medication.instructions,
                decoration: const InputDecoration(
                  labelText: 'التعليمات',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => _medication = _medication.copyWith(instructions: value),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _save,
          child: const Text('حفظ'),
        ),
      ],
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(_medication);
      Navigator.pop(context);
    }
  }
}



class SurgeryDialog extends StatefulWidget {
  final Surgery? surgery;
  final Function(Surgery) onSave;

  const SurgeryDialog({
    super.key,
    this.surgery,
    required this.onSave,
  });

  @override
  State<SurgeryDialog> createState() => _SurgeryDialogState();
}

class _SurgeryDialogState extends State<SurgeryDialog> {
  final _formKey = GlobalKey<FormState>();
  late Surgery _surgery;

  @override
  void initState() {
    super.initState();
    _surgery = widget.surgery ?? Surgery();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.surgery == null ? 'إضافة عملية جراحية' : 'تعديل العملية الجراحية'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _surgery.surgeryName,
                decoration: const InputDecoration(
                  labelText: 'اسم العملية',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'الرجاء إدخال اسم العملية' : null,
                onChanged: (value) => _surgery = _surgery.copyWith(surgeryName: value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _surgery.description,
                decoration: const InputDecoration(
                  labelText: 'وصف العملية',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => _surgery = _surgery.copyWith(description: value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _surgery.hospital,
                decoration: const InputDecoration(
                  labelText: 'المستشفى',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _surgery = _surgery.copyWith(hospital: value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _surgery.surgeon,
                decoration: const InputDecoration(
                  labelText: 'اسم الجراح',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _surgery = _surgery.copyWith(surgeon: value),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'تاريخ العملية',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    _surgery.surgeryDate.isNotEmpty
                        ? DateFormat('yyyy-MM-dd').format(DateTime.parse(_surgery.surgeryDate))
                        : 'اختر تاريخ العملية',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _save,
          child: const Text('حفظ'),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _surgery = _surgery.copyWith(surgeryDate: picked.toIso8601String());
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(_surgery);
      Navigator.pop(context);
    }
  }
}



class ChronicDiseaseDialog extends StatefulWidget {
  final ChronicDisease? disease;
  final Function(ChronicDisease) onSave;

  const ChronicDiseaseDialog({
    super.key,
    this.disease,
    required this.onSave,
  });

  @override
  State<ChronicDiseaseDialog> createState() => _ChronicDiseaseDialogState();
}

class _ChronicDiseaseDialogState extends State<ChronicDiseaseDialog> {
  final _formKey = GlobalKey<FormState>();
  late ChronicDisease _disease;

  @override
  void initState() {
    super.initState();
    _disease = widget.disease ?? ChronicDisease();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.disease == null ? 'إضافة مرض مزمن' : 'تعديل المرض المزمن'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _disease.diseaseName,
                decoration: const InputDecoration(
                  labelText: 'اسم المرض',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'الرجاء إدخال اسم المرض' : null,
                onChanged: (value) => _disease = _disease.copyWith(diseaseName: value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _disease.description,
                decoration: const InputDecoration(
                  labelText: 'وصف المرض',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => _disease = _disease.copyWith(description: value),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'تاريخ التشخيص',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    _disease.diagnosisDate.isNotEmpty
                        ? DateFormat('yyyy-MM-dd').format(DateTime.parse(_disease.diagnosisDate))
                        : 'اختر تاريخ التشخيص',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _save,
          child: const Text('حفظ'),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _disease = _disease.copyWith(diagnosisDate: picked.toIso8601String());
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(_disease);
      Navigator.pop(context);
    }
  }
}