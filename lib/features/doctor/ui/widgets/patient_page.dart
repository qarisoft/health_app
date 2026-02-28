import 'package:flutter/material.dart';
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/features/doctor/data/responses/patient_response.dart';
import 'package:health_app/features/doctor/ui/create_medical_record.dart';
import 'package:health_app/features/doctor/ui/create_prescription.dart';

class PatientFloatingButton extends StatefulWidget {
  const PatientFloatingButton({super.key, required this.patientId});
  final int patientId;

  @override
  State<PatientFloatingButton> createState() => _PatientFloatingButtonState();
}

class _PatientFloatingButtonState extends State<PatientFloatingButton> {
  bool isExpanded = false;
  int get patientId => widget.patientId;
  void setIsNotExpanded() {
    setState(() {
      isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 12,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setIsNotExpanded();
                  },
                ),
              ),
              _buildActionButton(
                icon: Icons.medical_services,
                label: 'Add Medical Record',
                color: Colors.blue,
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return CreateMedicalRecordDialog(patientId: patientId);
                    },
                  );
                  setIsNotExpanded();
                },
              ),
              _buildActionButton(
                icon: Icons.description,
                label: 'Add Prescription',
                color: Colors.green,
                onPressed: () async {
                  await showDialog<bool>(
                    context: context,
                    builder: (context) =>
                        CreatePrescriptionDialog(patientId: patientId),
                  );
                },
              ),
              _buildActionButton(
                icon: Icons.close,
                label: 'Cancel',
                color: Colors.grey,
                onPressed: () {
                  setIsNotExpanded();
                },
              ),
            ],
          ),
        ),
      );
    }

    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isExpanded = true;
        });
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class PatientPage extends StatelessWidget {
  const PatientPage({super.key, required this.patient});
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          patient.fullName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 2,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
            tooltip: 'Edit Patient',
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: PatientFloatingButton(patientId: patient.id),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient Quick Info Card
            _buildPatientQuickInfoCard(),
            const SizedBox(height: 20),

            // Personal Information Section
            _buildSectionHeader('Personal Information', Icons.person),
            const SizedBox(height: 10),
            _buildInfoCard([
              _buildInfoRow('Full Name', patient.fullName),
              _buildInfoRow('Date of Birth', patient.dateOfBirth.toString()),
              _buildInfoRow('Gender', patient.gender == 1 ? 'Male' : 'Female'),
              _buildInfoRow('Blood Type', _getBloodType(patient.bloodType)),
              _buildInfoRow('Weight', '${patient.weight} kg'),
              _buildInfoRow('Height', '${patient.height} cm'),
            ]),
            const SizedBox(height: 20),

            // Emergency Contact Section
            _buildSectionHeader('Emergency Contact', Icons.emergency),
            const SizedBox(height: 10),
            _buildInfoCard([
              _buildInfoRow(
                'Contact Name',
                patient.emergencyContact.toString(),
              ),
              _buildInfoRow('Phone', patient.emergencyPhone.toString()),
            ]),
            const SizedBox(height: 20),

            // Allergies Section
            if (patient.allergies.isNotEmpty) ...[
              _buildSectionHeader(
                'Allergies',
                Icons.warning,
                color: Colors.orange,
              ),
              const SizedBox(height: 10),
              ...patient.allergies.map((allergy) => _buildAllergyCard(allergy)),
              const SizedBox(height: 20),
            ],

            // Chronic Diseases Section
            if (patient.chronicDiseases.isNotEmpty) ...[
              _buildSectionHeader(
                'Chronic Diseases',
                Icons.health_and_safety,
                color: Colors.red,
              ),
              const SizedBox(height: 10),
              ...patient.chronicDiseases.map(
                (disease) => _buildDiseaseCard(disease),
              ),
              const SizedBox(height: 20),
            ],

            // Surgeries Section
            if (patient.surgeries.isNotEmpty) ...[
              _buildSectionHeader(
                'Surgeries',
                Icons.local_hospital,
                color: Colors.purple,
              ),
              const SizedBox(height: 10),
              ...patient.surgeries.map((surgery) => _buildSurgeryCard(surgery)),
              const SizedBox(height: 20),
            ],

            // Medical Records Section
            if (patient.medicalRecords.isNotEmpty) ...[
              _buildSectionHeader(
                'Medical Records',
                Icons.folder,
                color: Colors.teal,
              ),
              const SizedBox(height: 10),
              ...patient.medicalRecords.map(
                (record) => _buildMedicalRecordCard(record),
              ),
              const SizedBox(height: 20),
            ],

            // Prescriptions Section
            if (patient.prescriptions.isNotEmpty) ...[
              _buildSectionHeader(
                'Prescriptions',
                Icons.description,
                color: Colors.green,
              ),
              const SizedBox(height: 10),
              ...patient.prescriptions.map(
                (prescription) => _buildPrescriptionCard(prescription),
              ),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPatientQuickInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade400, Colors.blue.shade700],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Text(
                  patient.fullName[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient.fullName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.cake, color: Colors.white70, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          'Age: ${patient.dateOfBirth != null ? _calculateAge(patient.dateOfBirth!) : 0} years',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    String title,
    IconData icon, {
    Color color = Colors.blue,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> rows) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: rows),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllergyCard(dynamic allergy) {
    Color severityColor = _getSeverityColor(allergy.severity);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: severityColor, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: severityColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.warning, color: severityColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allergy.allergenName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Reaction: ${allergy.reaction}',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: severityColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  allergy.severity,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseCard(dynamic disease) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.health_and_safety,
                  color: Colors.red,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  disease.diseaseName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (disease.description != null) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                disease.description,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSurgeryCard(dynamic surgery) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.local_hospital,
                  color: Colors.purple,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  surgery.surgeryName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [
                _buildDetailRow('Surgeon', surgery.surgeon),
                _buildDetailRow('Hospital', surgery.hospital),
                _buildDetailRow('Date', surgery.surgeryDate.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalRecordCard(dynamic record) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.folder, color: Colors.teal, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. ${record.doctorName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      record.recordDate.toString(),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('Diagnosis', record.diagnosis),
                if (record.symptoms != null && record.symptoms!.isNotEmpty)
                  _buildDetailRow('Symptoms', record.symptoms!),
                if (record.notes != null && record.notes!.isNotEmpty)
                  _buildDetailRow('Notes', record.notes!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrescriptionCard(dynamic prescription) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.description,
                  color: Colors.green,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. ${prescription.doctorName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      prescription.diagnosis,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (prescription.notes != null && prescription.notes!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'Notes: ${prescription.notes}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Medications:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...prescription.items.map((item) => _buildMedicationItem(item)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationItem(dynamic item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.medicationName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildMedicationChip('Dosage: ${item.dosage}', Icons.medication),
              _buildMedicationChip('Duration: ${item.duration}', Icons.timer),
              _buildMedicationChip(
                'Frequency: ${item.frequency}',
                Icons.repeat,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.blue),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              '$label:',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  String _getBloodType(int? bloodType) {
    switch (bloodType) {
      case 1:
        return 'A+';
      case 2:
        return 'A-';
      case 3:
        return 'B+';
      case 4:
        return 'B-';
      case 5:
        return 'AB+';
      case 6:
        return 'AB-';
      case 7:
        return 'O+';
      case 8:
        return 'O-';
      default:
        return 'Unknown';
    }
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'mild':
        return Colors.green;
      case 'moderate':
        return Colors.orange;
      case 'severe':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  int _calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}

class Filed1 extends StatelessWidget {
  const Filed1({super.key, required this.name, required this.value});
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
