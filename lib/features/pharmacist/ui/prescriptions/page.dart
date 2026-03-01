import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/core/constants/app_strings.dart';
// import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/pharmacist/data/providers/prescriptions.dart';
import 'package:health_app/features/pharmacist/data/responses/drugs_interaction.dart';
import 'package:health_app/shared/api/api_repositories.dart';
// import 'package:health_app/shared/ex.dart' hide xlog;
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:health_app/shared/widgets/dialog/single_input_dialog.dart';

import '../../data/responses/prescription.dart' show PrescriptionsResponse;
import '../../domain/models/prescription.dart'
    show
        Prescription,
        PrescriptionItem,
        PrescriptionStatus,
        PrescriptionStatusEnum;
import 'submit_dialog.dart';

class PrescriptionsPage extends ConsumerStatefulWidget {
  const PrescriptionsPage({super.key});

  @override
  ConsumerState<PrescriptionsPage> createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends ConsumerState<PrescriptionsPage> {
  void _handleSearchPress(WidgetRef ref) async {
    final id = await showDialog(
      context: context,
      builder: (context) => const SingleInputDialog(
        label: 'Prescription ID',
        title: 'Search Prescription',
        initialValue: 'pm-ea3e5492',
      ),
    );

    if (id != null) {
      AppDialog().loading(message: AppStrings.loadingMsg);
      final res = await di<AppRepositories>().searchPrescription(id);
      AppDialog().dismiss();

      res.when(
        success: (data) {
          ref
              .read(prescriptionsProvider.notifier)
              .setPrescriptions(data.prescriptions, code: id);
        },
        error: (e) {
          AppDialog().show(
            type: DialogType.error,
            message: e.msg,
            title: 'Not Found',
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final prescriptionList = ref.watch(prescriptionsProvider);
    final prescriptions = prescriptionList.prescriptions;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Prescriptions"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => ref.read(prescriptionsProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: prescriptions.isEmpty
          ? _buildEmptyState()
          : RefreshIndicator(
              onRefresh: () async {
                ref.read(prescriptionsProvider.notifier).refresh();
                xlog('sssssssssssssssssssssss');
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: prescriptions.length,
                itemBuilder: (context, index) =>
                    PrescriptionCard(prescription: prescriptions[index]),
              ),
            ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          return FloatingActionButton.extended(
            onPressed: () => _handleSearchPress(ref),
            label: const Text('Search ID'),
            icon: const Icon(Icons.search),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.medication_liquid_sharp,
              size: 80,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "No Prescriptions Found",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Search for a prescription ID to begin",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PrescriptionCard extends StatelessWidget {
  final Prescription prescription;

  const PrescriptionCard({super.key, required this.prescription});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: theme.dividerColor.withOpacity(0.1)),
      ),
      child: ExpansionTile(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        leading: CircleAvatar(
          backgroundColor:
              prescription.getStatus() == PrescriptionStatusEnum.dispensed
              ? Colors.blue
              : Colors.grey,
          child: Icon(
            Icons.person,
            // color: prescription.getStatus() == PrescriptionStatusEnum.dispensed
            //     ? Colors.blue
            //     : Colors.grey,
          ),
        ),
        title: Text(
          prescription.doctorName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Diagnosis: ${prescription.diagnosis}"),
        trailing: _buildPopupMenu(context, prescription),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: 8),
                if (prescription.notes.isNotEmpty)
                  _buildInfoRow(
                    Icons.note_alt_outlined,
                    "Notes",
                    prescription.notes,
                  ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Medication Plan",
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...prescription.items.map(
                  (item) => _buildMedicationItem(context, item),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$label: $value",
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationItem(BuildContext context, PrescriptionItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.medication, color: Colors.blue, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.medicationName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${item.dosage} • ${item.frequency}",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopupMenu(BuildContext context, Prescription prescription) {
    return Consumer(
      builder: (context, ref, _) {
        return PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onSelected: (val) {
            if (val == 'check') _handleInteractionCheck(context);
            if (val == 'change-status') _handleChangestatus(context, ref);
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'check',
              enabled: prescription.status != 2,
              child: ListTile(
                leading: Icon(Icons.security, color: Colors.green),
                title: Text("Drug Interactions"),
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ),
            const PopupMenuItem(
              value: 'change-status',
              child: ListTile(
                leading: Icon(Icons.security, color: Colors.green),
                title: Text("Change Status"),
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: Icon(Icons.delete_outline, color: Colors.red),
                title: Text("Remove", style: TextStyle(color: Colors.red)),
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleChangestatus(BuildContext context, WidgetRef ref) async {
    // 1. Show the extracted dialog and await the result
    final int? selectedStatusId = await showDialog<int>(
      context: context,
      builder: (context) =>
          ChangeStatusDialog(currentStatus: prescription.status),
    );

    // 2. Process the result if the user didn't cancel
    if (selectedStatusId != null) {
      // Ignore if the status wasn't actually changed
      if (selectedStatusId == prescription.status) return;

      AppDialog().loading();

      try {
        // Send the PUT request with the selected integer status ID
        final res = await di<AppRepositories>().getDio().put(
          '/Pharmacist/prescription-status',
          data: {"prescriptionId": prescription.id, "status": selectedStatusId},
        );
        xlog(res.data);
        final a = PrescriptionsResponse.fromJson(res.data);

        if (a.success ?? false) {
          ref.read(prescriptionsProvider.notifier).refresh();
        }

        AppDialog().dismiss();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Status updated successfully'),
              backgroundColor: Colors.green,
            ),
          );

          // Optional: If you are using Riverpod, refresh the list here to reflect the changes immediately
          // ref.refresh(prescriptionsProvider);
        }
      } catch (e) {
        AppDialog().dismiss();
        AppDialog().show(
          type: DialogType.error,
          message: "Failed to update status",
          title: 'Error',
        );
      }
    }
  }

  void _handleInteractionCheck(BuildContext context) async {
    AppDialog().loading();
    final res = await di<AppRepositories>().checkDrugInteractions(
      prescription.id,
    );
    AppDialog().dismiss();
    showMessage() {
      AppDialog().show(
        title: 'Good',
        message: "تم الحفض بنجاح!!",
        type: DialogType.success,
      );
    }

    void callOnSubmit() async {
      final a = await showDialog(
        context: context,
        builder: (context) {
          return SubmitPrescriptionDialog(prescription: prescription);
        },
      );
      if (a != null && a == true) {
        showMessage();
      }
    }

    onSubmitFunction() {
      context.pop();

      callOnSubmit();
    }

    res.when(
      success: (s) {
        showDialog(
          context: context,
          builder: (context) =>
              InteractionResultDialog(result: s, onSubmit: onSubmitFunction),
        );
      },
      error: (e) => xlog(e),
    );

    // res.when(
    //   success: (s) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => InteractionResultDialog(result: s),
    //     );
    //   },
    //   error: (e) => xlog(e),
    // );
  }
}

class ChangeStatusDialog extends StatefulWidget {
  final int currentStatus;

  const ChangeStatusDialog({super.key, required this.currentStatus});

  @override
  State<ChangeStatusDialog> createState() => _ChangeStatusDialogState();
}

class _ChangeStatusDialogState extends State<ChangeStatusDialog> {
  late int _selectedStatus;

  @override
  void initState() {
    super.initState();
    // Initialize the selection with the current prescription status
    _selectedStatus = widget.currentStatus;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.update, color: Colors.blue),
          SizedBox(width: 8),
          Text("Update Status"),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRadioOption(1, 'Pending'),
              _buildRadioOption(2, 'Dispensed'),
              _buildRadioOption(3, 'Partial Dispensed'),
              _buildRadioOption(4, 'Canceled'),
              _buildRadioOption(5, 'In Review'),
              _buildRadioOption(6, 'Need Consultation'),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(null), // Cancel returns null
          child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
        ),
        FilledButton(
          onPressed: () => Navigator.of(
            context,
          ).pop(_selectedStatus), // Update returns the selected ID
          child: const Text("Update"),
        ),
      ],
    );
  }

  Widget _buildRadioOption(int value, String title) {
    return RadioListTile<int>(
      title: Text(title),
      value: value,
      groupValue: _selectedStatus,
      contentPadding: EdgeInsets.zero,
      dense: true,
      activeColor: Theme.of(context).colorScheme.primary,
      onChanged: (int? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedStatus = newValue;
          });
        }
      },
    );
  }
}

class InteractionResultDialog extends StatelessWidget {
  final DrugsInteractionsResponse
  result; // Replace with your Interaction Model type
  final Function() onSubmit;

  const InteractionResultDialog({
    super.key,
    required this.result,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final hasInteractions = result.hasInteractions;

    return AlertDialog(
      title: const Text("Safety Analysis"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStatusHeader(hasInteractions),
              const SizedBox(height: 16),
              if (hasInteractions)
                ...result.warnings.map((w) => _buildWarningCard(w))
              else
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "All medications in this prescription are safe to take together.",
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [TextButton(onPressed: onSubmit, child: const Text("Submit"))],
    );
  }

  Widget _buildStatusHeader(bool hasInteractions) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: hasInteractions
            ? Colors.red.withOpacity(0.1)
            : Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            hasInteractions
                ? Icons.warning_amber_rounded
                : Icons.check_circle_outline,
            color: hasInteractions ? Colors.red : Colors.green,
          ),
          const SizedBox(width: 12),
          Text(
            hasInteractions ? "Conflicts Found" : "Safe Prescription",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: hasInteractions ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningCard(dynamic w) {
    return Card(
      elevation: 0,
      color: Colors.orange.shade50,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${w.medication1} ↔ ${w.medication2}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              w.description ?? 'No description',
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 8),
            if (w.recommendation != null)
              Text(
                "Advice: ${w.recommendation}",
                style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
