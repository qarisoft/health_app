import 'package:flutter/material.dart';
import 'package:health_app/features/patients/domain/models/medical_history.dart' show MedicalHistory, Gender;
// import 'package:health_app/features/patients/domain/models/medical_history.dart' hide Gender;
import 'package:health_app/l10n/app_localizations.dart';
import 'package:health_app/shared/ex.dart';
// import '../models/medical_history.dart';

class MedicalHistoryDetails extends StatelessWidget {
  final MedicalHistory history;

  const MedicalHistoryDetails({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;
    
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(localizations.medicalHistory),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.edit),
      //       onPressed: () {
      //         // Navigate to edit page
      //       },
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Information Card
            _buildInfoCard(
              title: localizations.personalInformation,
              children: [
                _buildInfoRow(localizations.patientName, history.patientName),
                _buildInfoRow(localizations.dateOfBirth, _formatDate(history.dateOfBirth)),
                _buildInfoRow(localizations.gender, _getGenderDisplayName(history.gender, localizations)),
                _buildInfoRow(localizations.age, _calculateAge(history.dateOfBirth).toString()),
              ],
            ),

            // Contact Information Card
            _buildInfoCard(
              title: localizations.contactInformation,
              children: [
                _buildInfoRow(localizations.phoneNumber, history.phoneNumber),
                if (history.email != null) _buildInfoRow(localizations.email, history.email!),
                _buildInfoRow(localizations.address, history.address),
              ],
            ),

            // Emergency Contact Card
            _buildInfoCard(
              title: localizations.emergencyContact,
              children: [
                _buildInfoRow(localizations.emergencyContactName, history.emergencyContactName),
                _buildInfoRow(localizations.emergencyContactPhone, history.emergencyContactPhone),
                if (history.emergencyContactRelationship != null)
                  _buildInfoRow(localizations.emergencyContactRelationship, history.emergencyContactRelationship!),
              ],
            ),

            // Vital Statistics Card
            _buildInfoCard(
              title: localizations.vitalStatistics,
              children: [
                _buildInfoRow('${localizations.height} (${localizations.heightUnit})', '${history.height}'),
                _buildInfoRow('${localizations.weight} (${localizations.weightUnit})', '${history.weight}'),
                _buildInfoRow(localizations.bloodType, history.bloodType.arabicSymbol),
                _buildInfoRow(localizations.bmi, _calculateBMI(history.height, history.weight).toStringAsFixed(1)),
              ],
            ),

            // Medical Conditions Card
            if (history.chronicConditions?.isNotEmpty ?? false)
              _buildInfoCard(
                title: localizations.chronicConditions,
                children: history.chronicConditions!.map((condition) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('• $condition'),
                  )
                ).toList(),
              ),

            // Allergies Card
            if (history.allergies?.isNotEmpty ?? false)
              _buildInfoCard(
                title: localizations.allergies,
                children: history.allergies!.map((allergy) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('• $allergy', style: const TextStyle(color: Colors.red)),
                  )
                ).toList(),
              ),

            // Current Medications Card
            if (history.currentMedications?.isNotEmpty ?? false)
              _buildInfoCard(
                title: localizations.currentMedications,
                children: history.currentMedications!.map((medication) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('• $medication'),
                  )
                ).toList(),
              ),

            // Lifestyle Card
            _buildInfoCard(
              title: localizations.lifestyle,
              children: [
                _buildInfoRow(localizations.isSmoker, history.isSmoker ? localizations.yes : localizations.no),
                if (history.isSmoker)
                  _buildInfoRow(localizations.cigarettesPerDay, history.cigarettesPerDay.toString()),
                _buildInfoRow(localizations.isAlcoholConsumer, history.isAlcoholConsumer ? localizations.yes : localizations.no),
                if (history.isAlcoholConsumer)
                  _buildInfoRow(localizations.alcoholFrequency, history.alcoholFrequency),
                _buildInfoRow(localizations.exerciseFrequency, history.exerciseFrequency),
                _buildInfoRow(localizations.dietaryPreferences, history.dietaryPreferences),
              ],
            ),

            // Family History Card
            if (history.familyMedicalHistory?.isNotEmpty ?? false)
              _buildInfoCard(
                title: localizations.familyMedicalHistory,
                children: history.familyMedicalHistory!.entries.map((entry) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('${entry.key}: ${entry.value}'),
                  )
                ).toList(),
              ),

            // Surgical History Card
            if (history.surgeries?.isNotEmpty ?? false)
              _buildInfoCard(
                title: localizations.surgicalHistory,
                children: history.surgeries!.map((surgery) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ${surgery.procedureName}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('${localizations.surgeryDate}: ${_formatDate(surgery.date)}'),
                        if (surgery.hospitalName != null) Text('${localizations.hospitalName}: ${surgery.hospitalName}'),
                        if (surgery.surgeonName != null) Text('${localizations.surgeonName}: ${surgery.surgeonName}'),
                        if (surgery.complications != null) Text('${localizations.complications}: ${surgery.complications}'),
                      ],
                    ),
                  )
                ).toList(),
              ),

            // Vaccination History Card
            if (history.vaccinations?.isNotEmpty ?? false)
              _buildInfoCard(
                title: localizations.vaccinationHistory,
                children: history.vaccinations!.map((vaccination) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ${vaccination.vaccineName}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('${localizations.dateAdministered}: ${_formatDate(vaccination.dateAdministered)}'),
                        if (vaccination.expirationDate != null) 
                          Text('${localizations.expirationDate}: ${_formatDate(vaccination.expirationDate!)}'),
                      ],
                    ),
                  )
                ).toList(),
              ),

            // Additional Notes Card
            if (history.additionalNotes != null && history.additionalNotes!.isNotEmpty)
              _buildInfoCard(
                title: localizations.additionalNotes,
                children: [
                  Text(history.additionalNotes!),
                ],
              ),

            // Meta Information
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                '${localizations.lastUpdated}: ${_formatDateTime(history.lastUpdated)}',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required List<Widget> children}) {
    return Card(
      
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatDateTime(DateTime dateTime) {
    return '${_formatDate(dateTime)} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  double _calculateBMI(double heightCm, double weightKg) {
    if (heightCm <= 0) return 0;
    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
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
}