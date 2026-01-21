import 'package:flutter/material.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/api/api_repositories2.dart';

import '../../domain/models/prescription.dart';

class EditPrescriptionDialog extends StatefulWidget {
  final Prescription prescription;

  const EditPrescriptionDialog({super.key, required this.prescription});

  @override
  State<EditPrescriptionDialog> createState() => _EditPrescriptionDialogState();
}

class _EditPrescriptionDialogState extends State<EditPrescriptionDialog> {
  final _formKey = GlobalKey<FormState>();
  
  // Top level controllers
  late TextEditingController _diagnosisController;
  late TextEditingController _notesController;
  
  // List of items - we keep this in state to allow adding/removing rows
  late List<PrescriptionItem> _editableItems;

  @override
  void initState() {
    super.initState();
    _diagnosisController = TextEditingController(text: widget.prescription.diagnosis);
    _notesController = TextEditingController(text: widget.prescription.notes);
    _editableItems = List.from(widget.prescription.items);
  }

  void _addNewItem() {
    setState(() {
      _editableItems.add(PrescriptionItem(medicationName: '', dosage: ''));
    });
  }

  void _removeItem(int index) {
    setState(() {
      _editableItems.removeAt(index);
    });
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      // Create the updated object using Freezed's copyWith
      final updatedPrescription = widget.prescription.copyWith(
        diagnosis: _diagnosisController.text,
        notes: _notesController.text,
        items: _editableItems,
      );
      // final res = di<AppRepositories>().updatePrescriptionStatus(id, status, notes);
      Navigator.pop(context, updatedPrescription);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Prescription"),
      content: SizedBox(
        width: double.maxFinite,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _diagnosisController,
                  decoration: const InputDecoration(labelText: 'Diagnosis'),
                ),
                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(labelText: 'Notes'),
                ),
                const Divider(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Medications", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextButton.icon(
                      onPressed: _addNewItem,
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text("Add Item"),
                    ),
                  ],
                ),
                ..._editableItems.asMap().entries.map((entry) {
                  int idx = entry.key;
                  PrescriptionItem item = entry.value;
                  return _buildItemRow(item, idx);
                }),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
        ElevatedButton(onPressed: _save, child: const Text("Save Changes")),
      ],
    );
  }

  Widget _buildItemRow(PrescriptionItem item, int index) {
    return Card(
      color: Colors.grey[50],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: item.medicationName,
                    decoration: const InputDecoration(labelText: 'Medication'),
                    onChanged: (val) => _editableItems[index] = _editableItems[index].copyWith(medicationName: val),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () => _removeItem(index),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: item.dosage,
                    decoration: const InputDecoration(labelText: 'Dosage'),
                    onChanged: (val) => _editableItems[index] = _editableItems[index].copyWith(dosage: val),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: item.frequency,
                    decoration: const InputDecoration(labelText: 'Freq'),
                    onChanged: (val) => _editableItems[index] = _editableItems[index].copyWith(frequency: val),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}