import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/shared/ex.dart';

import '../../data/providers/emergency.dart' show patientEmergencyProvider;
import 'qr.dart';

class EmergenciesScreen extends ConsumerStatefulWidget {
  const EmergenciesScreen({super.key});

  @override
  ConsumerState<EmergenciesScreen> createState() => _EmergenciesScreenState();
}

class _EmergenciesScreenState extends ConsumerState<EmergenciesScreen> {
  // 1. Create a GlobalKey to uniquely identify the RepaintBoundary
  final GlobalKey _globalKey = GlobalKey();
  bool _isCapturing = false;

  Future<void> _captureAndSaveImage() async {
    setState(() => _isCapturing = true);

    try {
      // Small delay to ensure any UI updates (like showing the loader) are rendered
      // await Future.delayed(const Duration(milliseconds: 100));

      // Find the boundary and convert it to an image
      RenderRepaintBoundary boundary =
          _globalKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Open the OS native "Save As" dialog so the user can choose the location
      String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Emergency Profile',
        fileName: 'emergency_profile.png',
        type: FileType.image,
      );

      // If the user picked a location and didn't cancel the dialog
      if (outputFile != null) {
        final saveFile = File(outputFile);
        await saveFile.writeAsBytes(pngBytes);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image saved successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isCapturing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(patientEmergencyProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.emergencyInfo),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          // 3. Add the Save Button to the AppBar
          if (res.hasValue && !res.isLoading && !_isCapturing)
            IconButton(
              icon: const Icon(Icons.download),
              tooltip: 'Save as Image',
              onPressed: _captureAndSaveImage,
            ),
          if (_isCapturing)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            ),
        ],
      ),
      body: res.when(
        data: (data) {
          final info = data;

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(patientEmergencyProvider);
            },
            child: SingleChildScrollView(
              // REMOVED PADDING FROM HERE
              physics: const AlwaysScrollableScrollPhysics(),
              child: RepaintBoundary(
                key: _globalKey,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  // ADDED PADDING HERE: This ensures the captured image has nice borders
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Personal & Contact Info ---
                      _buildSectionHeader(
                        context,
                        context.tr.personalInformation,
                        Icons.person,
                      ),
                      _buildInfoTile(
                        context.tr.name,
                        info.fullName ?? 'Not provided',
                      ),
                      _buildInfoTile(
                        context.tr.bloodType,
                        _getBloodType(info.bloodType),
                      ),

                      const SizedBox(height: 16),

                      _buildSectionHeader(
                        context,
                        context.tr.emergencyContact,
                        Icons.contact_phone,
                      ),
                      _buildInfoTile(
                        context.tr.name,
                        info.emergencyContact ?? 'Not provided',
                      ),
                      _buildInfoTile(
                        context.tr.phoneNumber,
                        info.emergencyPhone ?? 'Not provided',
                        isPhone: true,
                      ),

                      const SizedBox(height: 16),

                      // --- Medical Info ---
                      _buildSectionHeader(
                        context,
                        context.tr.medicalInformation,
                        Icons.medical_services,
                      ),
                      _buildListSection(
                        context,
                        context.tr.allergies,
                        info.allergies,
                      ),
                      _buildListSection(
                        context,
                        context.tr.chronicConditions,
                        info.chronicDiseases,
                      ),
                      _buildListSection(
                        context,
                        context.tr.currentMedications,
                        info.currentMedications,
                      ),

                      if (info.qrCodeUrl != null) ...[
                        const SizedBox(height: 16),
                        Center(
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    context.tr.scanForMedicalProfile,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  ImageFromDataUrl(dataUrl: info.qrCodeUrl!),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.blue, size: 48),
              const SizedBox(height: 16),
              Text(context.tr.failedToLoadEmergencyData),
              TextButton(
                onPressed: () => ref.invalidate(patientEmergencyProvider),
                child: Text(context.tr.retry),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  // --- UI Helper Methods ---

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade600, size: 20),
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

  Widget _buildListSection(
    BuildContext context,
    String label,
    List<String>? items,
  ) {
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
            children: items
                .map(
                  (item) => Chip(
                    label: Text(item, style: const TextStyle(fontSize: 12)),
                    backgroundColor: Colors.blue.shade50,
                    side: BorderSide(color: Colors.blue.shade200),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  String _getBloodType(int? typeCode) {
    switch (typeCode) {
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
}
