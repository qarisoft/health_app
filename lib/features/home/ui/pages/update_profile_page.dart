import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/shared/ex.dart';
import 'package:intl/intl.dart';

import '../../data/responses/patient_full_profile.dart';
import '../../models/models.dart'
    hide
        PatientProfile; // Ensure models are imported for Allergy, Surgery, etc.

class UpdateProfilePage extends ConsumerStatefulWidget {
  final PatientFullProfile initialData; // CHANGED to accept Full Profile

  const UpdateProfilePage({super.key, required this.initialData});

  @override
  ConsumerState<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends ConsumerState<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Personal Info Controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  // Emergency Controllers
  late TextEditingController _emergencyNameController;
  late TextEditingController _emergencyPhoneController;

  // Vitals Controllers
  late TextEditingController _weightController;
  late TextEditingController _heightController;

  // State variables for dropdowns and dates
  late int _selectedGender;
  late int _selectedBloodType;
  late String _selectedDateOfBirth;

  // State lists for Medical History
  late List<Allergy> _allergies;
  late List<ChronicDisease> _diseases;
  late List<Surgery> _surgeries;
  late List<CurrentMedication> _medications;

  @override
  void initState() {
    super.initState();
    final p = widget.initialData.patient;

    // Initialize Base Profile
    _nameController = TextEditingController(text: p.fullName);
    _emailController = TextEditingController(text: p.email);
    _phoneController = TextEditingController(text: p.phoneNumber);
    _addressController = TextEditingController(text: p.address);
    _emergencyNameController = TextEditingController(text: p.emergencyContact);
    _emergencyPhoneController = TextEditingController(text: p.emergencyPhone);
    _weightController = TextEditingController(text: p.weight.toString());
    _heightController = TextEditingController(text: p.height.toString());

    _selectedGender = p.gender;
    _selectedBloodType = p.bloodType;
    _selectedDateOfBirth = p.dateOfBirth;

    // Initialize Lists (making mutable copies)
    _allergies = List.from(widget.initialData.allergies);
    _diseases = List.from(widget.initialData.chronicDiseases);
    _surgeries = List.from(widget.initialData.surgeries);
    _medications = List.from(widget.initialData.currentMedications);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(Function(String) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      onDateSelected(DateFormat('yyyy-MM-dd').format(picked));
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // 1. Rebuild the base PatientProfile
      final updatedPatient = PatientProfile(
        id: widget.initialData.patient.id,
        userId: widget.initialData.patient.userId,
        createdAt: widget.initialData.patient.createdAt,
        updatedAt: DateTime.now().toIso8601String(),
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        address: _addressController.text.trim(),
        emergencyContact: _emergencyNameController.text.trim(),
        emergencyPhone: _emergencyPhoneController.text.trim(),
        weight:
            int.tryParse(_weightController.text) ??
            widget.initialData.patient.weight,
        height:
            int.tryParse(_heightController.text) ??
            widget.initialData.patient.height,
        gender: _selectedGender,
        bloodType: _selectedBloodType,
        dateOfBirth: _selectedDateOfBirth,
      );

      // 2. Rebuild the PatientFullProfile
      final updatedFullProfile = PatientFullProfile(
        patient: updatedPatient,
        allergies: _allergies,
        chronicDiseases: _diseases,
        surgeries: _surgeries,
        currentMedications: _medications,
      );

      // TODO: Call your provider/repo
      // ref.read(updateFullProfileProvider(updatedFullProfile));

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.tr.updateSuccessful)));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr.editProfile), elevation: 0),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // --- Personal Info ---
            _buildSectionHeader(context.tr.medicalProfile),
            _buildTextField(context.tr.fullName, _nameController, Icons.person),
            _buildTextField(
              context.tr.emailAddress,
              _emailController,
              Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField(
              context.tr.phoneNumber,
              _phoneController,
              Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            _buildTextField(
              context.tr.address,
              _addressController,
              Icons.location_on,
            ),
            const SizedBox(height: 16),
            _buildMainDatePickerField(),
            const SizedBox(height: 16),
            _buildGenderDropdown(),
            const SizedBox(height: 24),

            // --- Vitals ---
            _buildSectionHeader(context.tr.vitalsAndPhysical),
            Row(
              children: [
                Expanded(child: _buildBloodTypeDropdown()),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    context.tr.weight,
                    _weightController,
                    Icons.monitor_weight,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    context.tr.height,
                    _heightController,
                    Icons.height,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // --- Emergency Contact ---
            _buildSectionHeader(context.tr.emergencyContact),
            _buildTextField(
              context.tr.emergencyContactName,
              _emergencyNameController,
              Icons.contact_emergency,
            ),
            _buildTextField(
              context.tr.emergencyContactPhone,
              _emergencyPhoneController,
              Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const Divider(height: 48),

            // --- Medical History Lists ---
            _buildListSection<Allergy>(
              title: context.tr.allergies,
              items: _allergies,
              itemBuilder: (item) => '${item.allergenName} - ${item.severity}',
              onDelete: (index) => setState(() => _allergies.removeAt(index)),
              onAdd: _showAddAllergyDialog,
              addLabel: context.tr.addAllergy,
            ),
            const SizedBox(height: 16),

            _buildListSection<ChronicDisease>(
              title: context.tr.chronicDiseases,
              items: _diseases,
              itemBuilder: (item) =>
                  '${item.diseaseName} (${item.diagnosisDate})',
              onDelete: (index) => setState(() => _diseases.removeAt(index)),
              onAdd: _showAddDiseaseDialog,
              addLabel: context.tr.addDisease,
            ),
            const SizedBox(height: 16),

            _buildListSection<Surgery>(
              title: context.tr.surgeries,
              items: _surgeries,
              itemBuilder: (item) =>
                  '${item.surgeryName} (${item.surgeryDate})',
              onDelete: (index) => setState(() => _surgeries.removeAt(index)),
              onAdd: _showAddSurgeryDialog,
              addLabel: context.tr.addSurgery,
            ),
            const SizedBox(height: 16),

            _buildListSection<CurrentMedication>(
              title: context.tr.currentMedications,
              items: _medications,
              itemBuilder: (item) => '${item.medicationName} - ${item.dosage}',
              onDelete: (index) => setState(() => _medications.removeAt(index)),
              onAdd: _showAddMedicationDialog,
              addLabel: context.tr.addMedication,
            ),
            const SizedBox(height: 32),

            // --- Save Button ---
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                context.tr.saveChanges,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // HELPER BUILDERS
  // ==========================================

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueGrey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildMainDatePickerField() {
    return InkWell(
      onTap: () =>
          _pickDate((date) => setState(() => _selectedDateOfBirth = date)),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: context.tr.dateOfBirth,
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.blueGrey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          _selectedDateOfBirth.isNotEmpty
              ? _selectedDateOfBirth
              : context.tr.notProvided,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedGender,
      decoration: InputDecoration(
        labelText: 'Gender',
        prefixIcon: const Icon(Icons.wc, color: Colors.blueGrey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      items: [
        DropdownMenuItem(value: 1, child: Text(context.tr.genderMale)),
        DropdownMenuItem(value: 2, child: Text(context.tr.genderFemale)),
        DropdownMenuItem(value: 0, child: Text(context.tr.genderOther)),
      ],
      onChanged: (val) {
        if (val != null) setState(() => _selectedGender = val);
      },
    );
  }

  Widget _buildBloodTypeDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedBloodType >= 0 && _selectedBloodType < 8
          ? _selectedBloodType
          : 0,
      decoration: InputDecoration(
        labelText: context.tr.blood,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      items: List.generate(8, (index) {
        return DropdownMenuItem(
          value: index.next,
          child: Text(index.next.bloodTypeString()),
        );
      }),
      onChanged: (val) {
        if (val != null) setState(() => _selectedBloodType = val);
      },
    );
  }

  // Generic List Builder for Medical Data
  Widget _buildListSection<T>({
    required String title,
    required List<T> items,
    required String Function(T) itemBuilder,
    required Function(int) onDelete,
    required VoidCallback onAdd,
    required String addLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(title),
        ...items.asMap().entries.map((entry) {
          int idx = entry.key;
          T item = entry.value;
          return Card(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: ListTile(
              title: Text(itemBuilder(item)),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onDelete(idx),
              ),
            ),
          );
        }),
        TextButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
          label: Text(addLabel),
        ),
      ],
    );
  }
  // ==========================================
  // DIALOGS FOR ADDING MEDICAL HISTORY
  // ==========================================

  void _showAddAllergyDialog() {
    final nameCtrl = TextEditingController();
    final reactionCtrl = TextEditingController();
    final severityCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.tr.addAllergy),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(ctx),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(labelText: context.tr.name),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: reactionCtrl,
                  decoration: InputDecoration(
                    labelText: context.tr.reaction(''),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: severityCtrl,
                  decoration: InputDecoration(labelText: context.tr.severity),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _allergies.add(
                        Allergy(
                          allergenName: nameCtrl.text,
                          reaction: reactionCtrl.text,
                          severity: severityCtrl.text,
                        ),
                      );
                    });
                    Navigator.pop(ctx);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    context
                        .tr
                        .saveChanges, // Or context.tr.add, whichever you prefer
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddDiseaseDialog() {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    showDialog(
      context: context,
      builder: (ctx) => Dialog.fullscreen(
        child: StatefulBuilder(
          builder: (ctx, setDialogState) => Scaffold(
            appBar: AppBar(
              title: Text(context.tr.addDisease),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(ctx),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameCtrl,
                    decoration: InputDecoration(labelText: context.tr.name),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: descCtrl,
                    decoration: InputDecoration(
                      labelText: context.tr.description,
                    ),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(date),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setDialogState(
                          () => date = DateFormat('yyyy-MM-dd').format(picked),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _diseases.add(
                          ChronicDisease(
                            diseaseName: nameCtrl.text,
                            description: descCtrl.text,
                            diagnosisDate: date,
                          ),
                        );
                      });
                      Navigator.pop(ctx);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      context.tr.saveChanges,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAddSurgeryDialog() {
    final nameCtrl = TextEditingController();
    final hospitalCtrl = TextEditingController();
    final surgeonCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    showDialog(
      context: context,
      builder: (ctx) => Dialog.fullscreen(
        child: StatefulBuilder(
          builder: (ctx, setDialogState) => Scaffold(
            appBar: AppBar(
              title: Text(context.tr.addSurgery),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(ctx),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameCtrl,
                    decoration: InputDecoration(labelText: context.tr.name),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: hospitalCtrl,
                    decoration: InputDecoration(
                      labelText: context.tr.hospital(''),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: surgeonCtrl,
                    decoration: InputDecoration(
                      labelText: context.tr.surgeon(''),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: descCtrl,
                    decoration: InputDecoration(
                      labelText: context.tr.description,
                    ),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(date),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setDialogState(
                          () => date = DateFormat('yyyy-MM-dd').format(picked),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _surgeries.add(
                          Surgery(
                            surgeryName: nameCtrl.text,
                            hospital: hospitalCtrl.text,
                            surgeon: surgeonCtrl.text,
                            description: descCtrl.text,
                            surgeryDate: date,
                          ),
                        );
                      });
                      Navigator.pop(ctx);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      context.tr.saveChanges,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAddMedicationDialog() {
    final nameCtrl = TextEditingController();
    final dosageCtrl = TextEditingController();
    final freqCtrl = TextEditingController();
    final durCtrl = TextEditingController();
    final instCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.tr.addMedication),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(ctx),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(labelText: context.tr.name),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: dosageCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Dosage (e.g. 500mg)',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: freqCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Frequency (e.g. 2x a day)',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: durCtrl,
                  decoration: InputDecoration(labelText: context.tr.duration),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: instCtrl,
                  decoration: InputDecoration(
                    labelText: context.tr.instructions,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _medications.add(
                        CurrentMedication(
                          medicationName: nameCtrl.text,
                          dosage: dosageCtrl.text,
                          frequency: freqCtrl.text,
                          duration: durCtrl.text,
                          instructions: instCtrl.text,
                        ),
                      );
                    });
                    Navigator.pop(ctx);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    context.tr.saveChanges,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
