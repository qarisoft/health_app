import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/home/ui/pages/update_profile_page.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/functions.dart';
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
            message: error.msg ?? context.tr.unexpectedError,
            onRetry: () => ref.invalidate(patientFullProfileProvider),
          );
        },
      ),
      error: (error, stackTrace) {
        return _ErrorPage(
          message: context.tr.failedToLoadFromServer,
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
    final patient = profile.patient;

    return Scaffold(
      appBar: AppBar(title: Text(context.tr.medicalProfile), elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ProfileHeader(patient: patient),
          const SizedBox(height: 24),

          SectionTitle(title: context.tr.vitalsAndPhysical),
          VitalsGrid(patient: patient),
          const SizedBox(height: 24),

          SectionTitle(title: context.tr.emergencyContact),
          EmergencyContactCard(patient: patient),
          const SizedBox(height: 24),

          SectionTitle(title: context.tr.allergies),
          AllergiesList(allergies: profile.allergies),
          const SizedBox(height: 24),

          SectionTitle(title: context.tr.chronicDiseases),
          ChronicDiseasesList(diseases: profile.chronicDiseases),
          const SizedBox(height: 24),

          SectionTitle(title: context.tr.surgeries),
          SurgeriesList(surgeries: profile.surgeries),
          const SizedBox(height: 24),

          SectionTitle(title: context.tr.currentMedications),
          MedicationsList(medications: profile.currentMedications),
          const SizedBox(height: 32),

          const Divider(),
          const SizedBox(height: 16),
          ProfileMetaData(patient: patient),
          const SizedBox(height: 40),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.to(UpdateProfilePage(initialData: profile));
        },
        child: Text('edit'),
      ),
    );
  }
}

// --- Extracted Widgets ---

class ProfileHeader extends StatelessWidget {
  final PatientProfile patient;

  const ProfileHeader({super.key, required this.patient});

  String _getGender(BuildContext context, int gender) {
    switch (gender) {
      case 1:
        return context.tr.genderMale;
      case 2:
        return context.tr.genderFemale;
      default:
        return context.tr.genderOther;
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
          context.tr.dob(
            patient.dateOfBirth,
            _getGender(context, patient.gender),
          ),
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
                _buildContactRow(context, Icons.email, patient.email),
                const SizedBox(height: 12),
                _buildContactRow(context, Icons.phone, patient.phoneNumber),
                const SizedBox(height: 12),
                _buildContactRow(context, Icons.location_on, patient.address),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blueGrey),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text.isNotEmpty ? text : context.tr.notProvided,
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
          context.tr.patientId2(patient.id, patient.userId),
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          context.tr.profileCreated(patient.createdAt),
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        if (patient.updatedAt.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            context.tr.lastUpdated2(patient.updatedAt),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ],
      ],
    );
  }
}

class VitalsGrid extends StatelessWidget {
  final PatientProfile patient;

  const VitalsGrid({super.key, required this.patient});

  String _getBloodType(BuildContext context, int type) {
    return BloodType.fromValue(type).symbol;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: VitalCard(
            title: context.tr.blood,
            value: _getBloodType(context, patient.bloodType),
            icon: Icons.bloodtype,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: VitalCard(
            title: context.tr.weight,
            value: context.tr.weightValue(patient.weight),
            icon: Icons.monitor_weight,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: VitalCard(
            title: context.tr.height,
            value: context.tr.heightValue(patient.height),
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
          mainAxisSize: MainAxisSize.min,
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
              : context.tr.notProvided,
        ),
        subtitle: Text(
          patient.emergencyPhone.isNotEmpty
              ? patient.emergencyPhone
              : context.tr.notApplicable,
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
      return EmptyState(message: context.tr.noAllergiesRecorded);
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
                subtitle: Text(context.tr.reaction(allergy.reaction)),
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
      return EmptyState(message: context.tr.noChronicDiseasesRecorded);
    }

    return Column(
      children: diseases
          .map(
            (disease) => Card(
              child: ExpansionTile(
                leading: const Icon(Icons.coronavirus, color: Colors.purple),
                title: Text(disease.diseaseName),
                subtitle: Text(context.tr.diagnosed(disease.diagnosisDate)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      // Note: You might want to adjust alignment based on RTL/LTR
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
      return EmptyState(message: context.tr.noSurgeriesRecorded);
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
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Note: Adjust alignment based on RTL/LTR
                      children: [
                        Text(
                          context.tr.hospital(surgery.hospital),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(context.tr.surgeon(surgery.surgeon)),
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
      return EmptyState(message: context.tr.noCurrentMedications);
    }

    return Column(
      children: medications
          .map(
            (meds) => Card(
              child: ListTile(
                leading: const Icon(Icons.medication, color: Colors.green),
                title: Text(meds.medicationName),
                subtitle: Text(
                  context.tr.medicationDosage(meds.dosage, meds.frequency),
                ),
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
      appBar: AppBar(title: Text(context.tr.medicalProfile), elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              context.tr.loadingProfileData,
              style: const TextStyle(color: Colors.grey),
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
      appBar: AppBar(title: Text(context.tr.medicalProfile), elevation: 0),
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
                context.tr.oopsSomethingWentWrong,
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
                label: Text(context.tr.retry),
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
