import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/shared/ex.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/app_error.dart'
    show ErrorOr, ErrorOrPatterns, AppError;
import '../../data/responses/patient_full_profile.dart';
import '../../models/models.dart' hide PatientProfile;

part 'edit_profile.g.dart';

@riverpod
Future<ErrorOr<PatientFullProfile>> patientFullProfile(Ref ref) async {
  final res = await appRepo.getPatientFullProfile();
  return res;
}

class PatientFullProfilePage extends ConsumerWidget {
  const PatientFullProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(patientFullProfileProvider);

    return res.when(
      data: (domainResult) => domainResult.when(
        success: (PatientFullProfile data) {
          xlog(data.toJson());
          return MedicalProfilePage(profile: data);
        },
        error: (AppError error) {
          return _ErrorPage(
            message: error.msg ?? 'An unexpected error occurred.',
            onRetry: () => ref.invalidate(patientFullProfileProvider),
          );
        },
      ),
      error: (error, stackTrace) {
        return _ErrorPage(
          message: 'Failed to connect to the server.',
          onRetry: () => ref.invalidate(patientFullProfileProvider),
        );
      },
      loading: () => const _LoadingPage(),
    );
  }
}

// --- Main Profile Page ---

class MedicalProfilePage extends StatelessWidget {
  final PatientFullProfile profile;

  const MedicalProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    // We extract the nested patient profile for easier access
    final patient = profile.patient;

    return Scaffold(
      appBar: AppBar(title: const Text('Medical Profile'), elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ProfileHeader(patient: patient),
          const SizedBox(height: 24),

          const SectionTitle(title: 'Vitals & Physical'),
          VitalsGrid(patient: patient),
          const SizedBox(height: 24),

          const SectionTitle(title: 'Emergency Contact'),
          EmergencyContactCard(patient: patient),
          const SizedBox(height: 24),

          const SectionTitle(title: 'Allergies'),
          AllergiesList(allergies: profile.allergies),
          const SizedBox(height: 24),

          const SectionTitle(title: 'Chronic Diseases'),
          ChronicDiseasesList(diseases: profile.chronicDiseases),
          const SizedBox(height: 24),

          const SectionTitle(title: 'Surgeries'),
          SurgeriesList(surgeries: profile.surgeries),
          const SizedBox(height: 24),

          const SectionTitle(title: 'Current Medications'),
          MedicationsList(medications: profile.currentMedications),
          const SizedBox(height: 32),

          const Divider(),
          const SizedBox(height: 16),
          ProfileMetaData(patient: patient),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// --- Extracted Widgets ---

class ProfileHeader extends StatelessWidget {
  final PatientProfile patient;

  const ProfileHeader({super.key, required this.patient});

  String _getGender(int gender) {
    switch (gender) {
      case 1:
        return 'Male';
      case 2:
        return 'Female';
      default:
        return 'Other';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
        const SizedBox(height: 16),
        Text(
          patient.fullName,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'DOB: ${patient.dateOfBirth} (${_getGender(patient.gender)})',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: Colors.blueGrey.withOpacity(0.05),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildContactRow(Icons.email, patient.email),
                const SizedBox(height: 12),
                _buildContactRow(Icons.phone, patient.phoneNumber),
                const SizedBox(height: 12),
                _buildContactRow(Icons.location_on, patient.address),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blueGrey),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text.isNotEmpty ? text : 'Not provided',
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class ProfileMetaData extends StatelessWidget {
  final PatientProfile patient;

  const ProfileMetaData({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Patient ID: ${patient.id} • User ID: ${patient.userId}',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          'Profile created: ${patient.createdAt}',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        if (patient.updatedAt.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            'Last updated: ${patient.updatedAt}',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ],
      ],
    );
  }
}

// REFACTORED: Using Row + Expanded to fix the RenderFlex overflow!
class VitalsGrid extends StatelessWidget {
  final PatientProfile patient;

  const VitalsGrid({super.key, required this.patient});

  String _getBloodType(int type) {
    const bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
    if (type >= 0 && type < bloodTypes.length) return bloodTypes[type];
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: VitalCard(
            title: 'Blood',
            value: _getBloodType(patient.bloodType),
            icon: Icons.bloodtype,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: VitalCard(
            title: 'Weight',
            value: '${patient.weight} kg',
            icon: Icons.monitor_weight,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: VitalCard(
            title: 'Height',
            value: '${patient.height} cm',
            icon: Icons.height,
          ),
        ),
      ],
    );
  }
}

class VitalCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const VitalCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevents overflow
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blueAccent, size: 24),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyContactCard extends StatelessWidget {
  final PatientProfile patient;

  const EmergencyContactCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.emergency, color: Colors.white),
        ),
        title: Text(
          patient.emergencyContact.isNotEmpty
              ? patient.emergencyContact
              : 'Not Provided',
        ),
        subtitle: Text(
          patient.emergencyPhone.isNotEmpty ? patient.emergencyPhone : 'N/A',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {
            // TODO: Implement phone call logic
          },
        ),
      ),
    );
  }
}

class AllergiesList extends StatelessWidget {
  final List<Allergy> allergies;

  const AllergiesList({super.key, required this.allergies});

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'high':
      case 'severe':
        return Colors.red;
      case 'medium':
      case 'moderate':
        return Colors.orange;
      case 'low':
      case 'mild':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (allergies.isEmpty) {
      return const EmptyState(message: 'No allergies recorded');
    }

    return Column(
      children: allergies
          .map(
            (allergy) => Card(
              child: ListTile(
                leading: const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange,
                ),
                title: Text(allergy.allergenName),
                subtitle: Text('Reaction: ${allergy.reaction}'),
                trailing: Chip(
                  label: Text(
                    allergy.severity,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: _getSeverityColor(
                    allergy.severity,
                  ).withOpacity(0.2),
                  side: BorderSide.none,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class ChronicDiseasesList extends StatelessWidget {
  final List<ChronicDisease> diseases;

  const ChronicDiseasesList({super.key, required this.diseases});

  @override
  Widget build(BuildContext context) {
    if (diseases.isEmpty) {
      return const EmptyState(message: 'No chronic diseases recorded');
    }

    return Column(
      children: diseases
          .map(
            (disease) => Card(
              child: ExpansionTile(
                leading: const Icon(Icons.coronavirus, color: Colors.purple),
                title: Text(disease.diseaseName),
                subtitle: Text('Diagnosed: ${disease.diagnosisDate}'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(disease.description),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class SurgeriesList extends StatelessWidget {
  final List<Surgery> surgeries;

  const SurgeriesList({super.key, required this.surgeries});

  @override
  Widget build(BuildContext context) {
    if (surgeries.isEmpty) {
      return const EmptyState(message: 'No surgeries recorded');
    }

    return Column(
      children: surgeries
          .map(
            (surgery) => Card(
              child: ExpansionTile(
                leading: const Icon(Icons.healing, color: Colors.teal),
                title: Text(surgery.surgeryName),
                subtitle: Text(surgery.surgeryDate),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hospital: ${surgery.hospital}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text('Surgeon: ${surgery.surgeon}'),
                        const SizedBox(height: 8),
                        Text(surgery.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class MedicationsList extends StatelessWidget {
  final List<CurrentMedication> medications;

  const MedicationsList({super.key, required this.medications});

  @override
  Widget build(BuildContext context) {
    if (medications.isEmpty) {
      return const EmptyState(message: 'No current medications');
    }

    return Column(
      children: medications
          .map(
            (meds) => Card(
              child: ListTile(
                leading: const Icon(Icons.medication, color: Colors.green),
                title: Text(meds.medicationName),
                subtitle: Text('${meds.dosage} - ${meds.frequency}'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    // TODO: Show instructions in a dialog or snackbar
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  final String message;

  const EmptyState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        message,
        style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
      ),
    );
  }
}

// --- Status Pages ---

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical Profile'), elevation: 0),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Loading profile data...',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorPage extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorPage({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical Profile'), elevation: 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                color: Colors.redAccent,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                'Oops! Something went wrong.',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
