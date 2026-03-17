import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/constants/app_strings.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/di.dart';
// import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/pharmacist/data/providers/prescriptions.dart';
import 'package:health_app/features/pharmacist/data/responses/drugs_interaction.dart';
import 'package:health_app/shared/ex.dart' show AppEx, xlog;
// import 'package:health_app/shared/ex.dart' hide xlog;
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:health_app/shared/widgets/dialog/single_input_dialog.dart';
import 'package:lottie/lottie.dart';

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
      builder: (context) => SingleInputDialog(
        label: context.tr.patientId,
        title: context.tr.search,
        initialValue: 'pm-ea3e5492',
      ),
    );

    if (id != null) {
      AppDialog().loading(message: AppStrings.loadingMsg);
      final res = await appRepo.searchPrescription(id);
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
            title: context.tr.noMedicalHistoryFound,
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
        title: Text(context.tr.prescriptions),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => ref.read(prescriptionsProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: prescriptions.isEmpty
          ? PrescriptionsEmptyScreen(onCreate: () => _handleSearchPress(ref))
          : Scaffold(
              floatingActionButton: Consumer(
                builder: (context, ref, _) {
                  return FloatingActionButton.extended(
                    onPressed: () => _handleSearchPress(ref),
                    label: Text(context.tr.clearSearch),
                    icon: const Icon(Icons.search),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  );
                },
              ),
              body: RefreshIndicator(
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
          Text(
            context.tr.noMedicalHistoryFound,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            context.tr.searchPatients,
            style: const TextStyle(color: Colors.grey),
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
          child: const Icon(
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
        subtitle: Text(
          "${context.tr.diagnosisLabel} ${prescription.diagnosis}",
        ),
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
                    context.tr.notes,
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
                      context.tr.medicationPlan,
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
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withOpacity(0.3),
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
                leading: const Icon(Icons.security, color: Colors.green),
                title: Text(context.tr.privacyAndSecurity),
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ),
            PopupMenuItem(
              value: 'change-status',
              child: ListTile(
                leading: const Icon(Icons.security, color: Colors.green),
                title: Text(context.tr.status),
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: Text(
                  context.tr.delete,
                  style: const TextStyle(color: Colors.red),
                ),
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
        final res = await appRepo.getDio().put(
          '/Pharmacist/prescription-status',
          data: {"prescriptionId": prescription.id, "status": selectedStatusId},
        );
        // xlog(res.data);
        final a = PrescriptionsResponse.fromJson(res.data);

        if (a.success ?? false) {
          ref.read(prescriptionsProvider.notifier).refresh();
        }

        AppDialog().dismiss();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr.changesSavedSuccessfully),
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
          title: context.tr.noMedicalHistoryFound,
        );
      }
    }
  }

  void _handleInteractionCheck(BuildContext context) async {
    AppDialog().loading();
    final res = await appRepo.checkDrugInteractions(prescription.id);
    AppDialog().dismiss();
    showMessage() {
      AppDialog().show(
        title: context.tr.confirm,
        message: context.tr.changesSavedSuccessfully,
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
      title: Row(
        children: [
          const Icon(Icons.update, color: Colors.blue),
          const SizedBox(width: 8),
          Text(context.tr.status),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRadioOption(1, context.tr.pending),
              _buildRadioOption(2, context.tr.completed),
              _buildRadioOption(3, context.tr.pending),
              _buildRadioOption(4, context.tr.cancelled),
              _buildRadioOption(5, context.tr.pending),
              _buildRadioOption(6, context.tr.pending),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(null), // Cancel returns null
          child: Text(
            context.tr.cancel,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        FilledButton(
          onPressed: () => Navigator.of(
            context,
          ).pop(_selectedStatus), // Update returns the selected ID
          child: Text(context.tr.update),
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
      title: Text(context.tr.privacyAndSecurity),
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
      actions: [TextButton(onPressed: onSubmit, child: Text(context.tr.done))],
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

class PrescriptionsEmptyScreen extends StatelessWidget {
  const PrescriptionsEmptyScreen({super.key, required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.prescriptionsEmpty,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          Text(
            context.tr.noPrescriptions,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            context.tr.noPrescriptionsDescription,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: onCreate,
            icon: const Icon(Icons.add),
            label: Text(context.tr.createNewPrescription),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
