import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/shared/ex.dart' show AppEx;
import 'package:health_app/shared/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/responses/patient_medical_records.dart';

// part 'medical_records_page.freezed.dart';

part 'medical_records_page.g.dart';

@riverpod
Future<ErrorOr<List<PatientMedicalRecord>>> patientMedicalRecords(
  Ref ref,
) async {
  final res = await appRepo.getPatientMedicalRecords();
  return res;
}

class PatientMedicalRecordsPage extends ConsumerWidget {
  const PatientMedicalRecordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(patientMedicalRecordsProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          context.tr.medicalRecords,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: res.when(
        data: (data) {
          return data.when(
            success: (records) => MedicalRecordsListView(records: records),
            error: (er) => _buildErrorState(
              context,
              ref,
              '${context.tr.failedToLoadRecords}: $er',
            ),
          );
        },
        error: (er, s) =>
            _buildErrorState(context, ref, context.tr.unexpectedError),
        loading: () => const Center(
          child: CircularProgressIndicator(color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => ref.invalidate(patientMedicalRecordsProvider),
              icon: const Icon(Icons.refresh),
              label: Text(context.tr.retry),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicalRecordsListView extends ConsumerWidget {
  final List<PatientMedicalRecord> records;

  const MedicalRecordsListView({super.key, required this.records});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (records.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_open_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              context.tr.noMedicalRecordsFound,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.tr.recordsWillAppearHere,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(patientMedicalRecordsProvider);
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return _buildRecordCard(context, record);
        },
      ),
    );
  }

  Widget _buildRecordCard(BuildContext context, PatientMedicalRecord record) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ExpansionTile(
          shape: const Border(),
          collapsedShape: const Border(),
          iconColor: Colors.blueAccent,
          textColor: Colors.blueAccent,
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.medical_information, color: Colors.blue.shade600),
          ),
          title: Text(
            record.diagnosis.isNotEmpty
                ? record.diagnosis
                : context.tr.generalConsultation,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 4),
                Flexible(
                  flex: 1,
                  child: Text(
                    record.recordDate,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
                Icon(Icons.person, size: 14, color: Colors.grey.shade500),
                const SizedBox(width: 4),
                Expanded(
                  flex: 1,
                  child: Text(
                    '${context.tr.dr} ${record.doctorName}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50.withOpacity(0.3),
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(
                    context,
                    context.tr.patient,
                    record.patientName,
                    Icons.sick_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    context,
                    context.tr.symptoms,
                    record.symptoms,
                    Icons.warning_amber_rounded,
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    context,
                    context.tr.treatment,
                    record.treatment,
                    Icons.healing_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    context,
                    context.tr.doctorNotes,
                    record.notes,
                    Icons.notes,
                  ),
                  const Divider(height: 32),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      Text(
                        '${context.tr.recordId}: #${record.id}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        '${context.tr.created}: ${formatDate2(record.createdAt)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.blueGrey.shade400),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey.shade700,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value.isNotEmpty ? value : context.tr.notSpecified,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MedicalRecordsPage extends StatelessWidget {
  final List<PatientMedicalRecord> records;

  const MedicalRecordsPage({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.medicalRecords),
        centerTitle: true,
        elevation: 0,
      ),
      body: records.isEmpty
          ? Center(
              child: Text(
                context.tr.noMedicalRecordsFound,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return _buildRecordCard(context, record);
              },
            ),
    );
  }

  Widget _buildRecordCard(BuildContext context, PatientMedicalRecord record) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        title: Text(
          record.diagnosis.isNotEmpty
              ? record.diagnosis
              : context.tr.noDiagnosisListed,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    record.recordDate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.person, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    '${context.tr.dr} ${record.doctorName}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow(
                  context,
                  context.tr.patient,
                  record.patientName,
                ),
                const Divider(),
                _buildDetailRow(context, context.tr.symptoms, record.symptoms),
                const Divider(),
                _buildDetailRow(
                  context,
                  context.tr.treatment,
                  record.treatment,
                ),
                const Divider(),
                _buildDetailRow(context, context.tr.doctorNotes, record.notes),
                const Divider(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${context.tr.recordId}: ${record.id} • ${context.tr.created}: ${record.createdAt}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value.isNotEmpty ? value : context.tr.na,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
