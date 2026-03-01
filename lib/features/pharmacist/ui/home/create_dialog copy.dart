// lib/features/prescription/presentation/pages/create_prescription_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/pharmacist/data/providers/create_rescription.dart';
// import '../providers/prescription_provider.dart';

class CreatePrescriptionPage extends ConsumerWidget {
  final int patientId;
  final int doctorId;

  const CreatePrescriptionPage({
    super.key,
    required this.patientId,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formProvider = ref.watch(prescriptionFormProvider(
      patientId: patientId,
      doctorId: doctorId,
    ).notifier);
    
    final formState = ref.watch(prescriptionFormProvider(
      patientId: patientId,
      doctorId: doctorId,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Prescription'),
        actions: [
          // Expand/Collapse All Button
          if (formState.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.unfold_more),
              onPressed: () {
                if (formState.items.any((item) => !item.isExpanded)) {
                  formProvider.expandAllItems();
                } else {
                  formProvider.collapseAllItems();
                }
              },
              tooltip: 'Expand/Collapse All',
            ),
          // Save Button
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: formProvider.isFormValid && !formState.isLoading
                ? () => _submitPrescription(ref, context)
                : null,
            tooltip: 'Save Prescription',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Info
              _buildHeaderInfo(formState),
              const SizedBox(height: 24),
              
              // Diagnosis Section
              _buildDiagnosisSection(formState, formProvider),
              const SizedBox(height: 32),
              
              // Medications Header with Summary
              _buildMedicationsHeader(formState, formProvider),
              const SizedBox(height: 16),
              
              // Medications List
              _buildMedicationsList(formState, formProvider),
              const SizedBox(height: 24),
              
              // Error Message
              if (formState.errorMessage != null) ...[
                _buildErrorMessage(formState.errorMessage!),
                const SizedBox(height: 16),
              ],
              
              // Add Medication Button
              _buildAddButton(formProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfo(PrescriptionFormState state) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text(
                  'Patient ID',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  state.patientId.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              width: 1,
              color: Colors.grey[300],
            ),
            Column(
              children: [
                const Text(
                  'Doctor ID',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  state.doctorId.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagnosisSection(
    PrescriptionFormState state,
    PrescriptionForm formProvider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Diagnosis',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: state.diagnosis,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Enter patient diagnosis...',
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: (value) {
            formProvider.updateDiagnosis(value);
            formProvider.clearError();
          },
        ),
      ],
    );
  }

  Widget _buildMedicationsHeader(
    PrescriptionFormState state,
    PrescriptionForm formProvider,
  ) {
    final completedItems = state.items.where((item) => item.isComplete).length;
    final totalItems = state.items.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Medications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$completedItems of $totalItems completed',
              style: TextStyle(
                fontSize: 14,
                color: completedItems == totalItems ? Colors.green : Colors.orange,
              ),
            ),
          ],
        ),
        // Quick Actions
        Row(
          children: [
            // Expand All Button
            Tooltip(
              message: 'Expand All',
              child: IconButton(
                icon: const Icon(Icons.expand, size: 20),
                onPressed: formProvider.expandAllItems,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Collapse All Button
            Tooltip(
              message: 'Collapse All',
              child: IconButton(
                icon: const Icon(Icons.compress, size: 20),
                onPressed: formProvider.collapseAllItems,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMedicationsList(
    PrescriptionFormState state,
    PrescriptionForm formProvider,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _buildCollapsibleMedicationCard(index, state.items[index], formProvider);
      },
    );
  }

  Widget _buildCollapsibleMedicationCard(
    int index,
    PrescriptionItemForm item,
    PrescriptionForm formProvider,
  ) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: item.isComplete ? Colors.green.shade100 : Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Header (Always visible)
          _buildMedicationHeader(index, item, formProvider),
          
          // Collapsible Content
          if (item.isExpanded) _buildMedicationContent(index, item, formProvider),
        ],
      ),
    );
  }

  Widget _buildMedicationHeader(
    int index,
    PrescriptionItemForm item,
    PrescriptionForm formProvider,
  ) {
    return Container(
      color: item.isExpanded ? Colors.blue[50] : Colors.grey[50],
      child: ListTile(
        leading: _buildMedicationStatusIcon(item),
        title: _buildMedicationTitle(index, item),
        subtitle: _buildMedicationSubtitle(item),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!item.isExpanded && item.isComplete)
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.check_circle, color: Colors.green, size: 16),
              ),
            IconButton(
              icon: Icon(
                item.isExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.blue,
              ),
              onPressed: () => formProvider.toggleItemExpansion(index),
              style: IconButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
              ),
            ),
            if (formProvider.state.items.length > 1)
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 18),
                onPressed: () => formProvider.removeItem(index),
                color: Colors.red,
                style: IconButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                ),
              ),
          ],
        ),
        onTap: () => formProvider.toggleItemExpansion(index),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildMedicationStatusIcon(PrescriptionItemForm item) {
    if (item.isComplete) {
      return const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.green,
        child: Icon(Icons.check, size: 16, color: Colors.white),
      );
    } else if (item.drugId.isNotEmpty || item.dosage.isNotEmpty) {
      return const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.orange,
        child: Icon(Icons.edit, size: 16, color: Colors.white),
      );
    } else {
      return const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.grey,
        child: Icon(Icons.add, size: 16, color: Colors.white),
      );
    }
  }

  Widget _buildMedicationTitle(int index, PrescriptionItemForm item) {
    final drugName = item.drugId.isNotEmpty ? 'Drug #${item.drugId}' : 'New Medication';
    return Text(
      '${index + 1}. $drugName',
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
    );
  }

  Widget _buildMedicationSubtitle(PrescriptionItemForm item) {
    if (!item.isExpanded && item.isComplete) {
      return Text(
        '${item.dosage} • ${item.frequency} • ${item.duration}',
        style: const TextStyle(fontSize: 12),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    } else if (item.drugId.isNotEmpty || item.dosage.isNotEmpty) {
      return Text(
        'Incomplete • Tap to edit',
        style: TextStyle(
          fontSize: 12,
          color: Colors.orange[700],
        ),
      );
    } else {
      return const Text(
        'Empty • Tap to add details',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      );
    }
  }

  Widget _buildMedicationContent(
    int index,
    PrescriptionItemForm item,
    PrescriptionForm formProvider,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildTextFieldRow(
            label: 'Drug ID',
            value: item.drugId,
            icon: Icons.medication_outlined,
            onChanged: (value) => formProvider.updateItemField(
              index: index,
              field: 'drugId',
              value: value,
            ),
            keyboardType: TextInputType.number,
            isRequired: true,
          ),
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                child: _buildTextFieldRow(
                  label: 'Quantity',
                  value: item.quantity,
                  icon: Icons.format_list_numbered,
                  onChanged: (value) => formProvider.updateItemField(
                    index: index,
                    field: 'quantity',
                    value: value,
                  ),
                  keyboardType: TextInputType.number,
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTextFieldRow(
                  label: 'Dosage',
                  value: item.dosage,
                  icon: Icons.scale_outlined,
                  onChanged: (value) => formProvider.updateItemField(
                    index: index,
                    field: 'dosage',
                    value: value,
                  ),
                  hint: 'e.g., 500mg',
                  isRequired: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                child: _buildTextFieldRow(
                  label: 'Frequency',
                  value: item.frequency,
                  icon: Icons.schedule_outlined,
                  onChanged: (value) => formProvider.updateItemField(
                    index: index,
                    field: 'frequency',
                    value: value,
                  ),
                  hint: 'e.g., Twice daily',
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTextFieldRow(
                  label: 'Duration',
                  value: item.duration,
                  icon: Icons.calendar_today_outlined,
                  onChanged: (value) => formProvider.updateItemField(
                    index: index,
                    field: 'duration',
                    value: value,
                  ),
                  hint: 'e.g., 7 days',
                  isRequired: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          _buildTextFieldRow(
            label: 'Special Instructions (Optional)',
            value: item.instructions,
            icon: Icons.info_outline,
            onChanged: (value) => formProvider.updateItemField(
              index: index,
              field: 'instructions',
              value: value,
            ),
            maxLines: 2,
          ),
          
          // Quick Actions
          if (item.isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.check, size: 16),
                    label: const Text('Done'),
                    onPressed: () => formProvider.toggleItemExpansion(index),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextFieldRow({
    required String label,
    required String value,
    required IconData icon,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? hint,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            if (isRequired)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20),
            border: const OutlineInputBorder(),
            contentPadding:  EdgeInsets.symmetric(horizontal: 12, vertical: maxLines > 1 ? 12 : 0),
            filled: true,
            fillColor: Colors.white,
          ),
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red[100]!),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(PrescriptionForm formProvider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add_circle_outline, size: 20),
        label: const Text('Add New Medication'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.blue[50],
          foregroundColor: Colors.blue[700],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.blue.shade100),
          ),
        ),
        onPressed: () {
          formProvider.addNewItem();
          // Expand the newly added item
          final newIndex = formProvider.state.items.length - 1;
          formProvider.toggleItemExpansion(newIndex);
        },
      ),
    );
  }

  Future<void> _submitPrescription(WidgetRef ref, BuildContext context) async {
    final formProvider = ref.read(prescriptionFormProvider(
      patientId: patientId,
      doctorId: doctorId,
    ).notifier);
    
    try {
      // Here you would call your repository/service
      final request = formProvider.toRequest();
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Show success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Prescription created successfully'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Navigate back
      Navigator.pop(context, true);
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}