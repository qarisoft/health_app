import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/shared/ex.dart';

import '../../data/providers/emergency.dart' show patientEmergencyProvider;
import 'qr.dart';

// Converted to ConsumerWidget for cleaner code, as no local state is needed.
class EmergenciesScreen extends ConsumerWidget {
  const EmergenciesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(patientEmergencyProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.emergencyInfo),
        // A distinct color helps indicate the critical nature of this screen
        backgroundColor: Colors.red.shade600,
        foregroundColor: Colors.white,
      ),
      body: res.when(
        data: (data) {
          // Unpacking based on your models. Adjust if the provider returns the wrapper EmergencyPageResponse instead.
          final info = data;

          return RefreshIndicator(
            onRefresh: () async {
              // Properly triggers a refresh of the provider
              ref.invalidate(patientEmergencyProvider);
            },
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [

                // --- Personal & Contact Info ---
                _buildSectionHeader(context, context.tr.personalInformation, Icons.person),
                _buildInfoTile(context.tr.name, info.fullName ?? 'Not provided'),
                _buildInfoTile(context.tr.bloodType, _getBloodType(info.bloodType)),

                const SizedBox(height: 16),

                _buildSectionHeader(context, context.tr.emergencyContact, Icons.contact_phone),
                _buildInfoTile(context.tr.name, info.emergencyContact ?? 'Not provided'),
                _buildInfoTile(context.tr.phoneNumber, info.emergencyPhone ?? 'Not provided', isPhone: true),

                const SizedBox(height: 16),

                // --- Medical Info ---
                _buildSectionHeader(context, context.tr.medicalInformation, Icons.medical_services),
                _buildListSection(context, context.tr.allergies, info.allergies),
                _buildListSection(context, context.tr.chronicConditions, info.chronicDiseases),
                _buildListSection(context, context.tr.currentMedications, info.currentMedications),


                if (info.qrCodeUrl != null) ...[
                  Center(
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              context.tr.scanForMedicalProfile,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            ImageFromDataUrl(dataUrl: info.qrCodeUrl!),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],              ],
            ),
          );
        },
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(context.tr.failedToLoadEmergencyData),
              TextButton(
                onPressed: () => ref.invalidate(patientEmergencyProvider),
                child: Text(context.tr.retry),
              )
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  // --- UI Helper Methods ---

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.red.shade600, size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value, {bool isPhone = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 28.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: isPhone ? Colors.blue : null,
                decoration: isPhone ? TextDecoration.underline : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListSection(BuildContext context, String label, List<String>? items) {
    if (items == null || items.isEmpty) {
      return _buildInfoTile(label, 'None reported');
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: items.map((item) => Chip(
              label: Text(item, style: const TextStyle(fontSize: 12)),
              backgroundColor: Colors.red.shade50,
              side: BorderSide(color: Colors.red.shade200),
            )).toList(),
          ),
        ],
      ),
    );
  }

  // Helper to map your integer blood type to a readable string.
  // Note: Adjust the switch cases to match your backend's specific integer mapping!
  String _getBloodType(int? typeCode) {
    switch (typeCode) {
      case 1: return 'A+';
      case 2: return 'A-';
      case 3: return 'B+';
      case 4: return 'B-';
      case 5: return 'AB+';
      case 6: return 'AB-';
      case 7: return 'O+';
      case 8: return 'O-';
      default: return 'Unknown';
    }
  }
}
