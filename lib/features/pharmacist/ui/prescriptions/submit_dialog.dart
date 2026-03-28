import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/pharmacist/data/providers/prescriptions.dart'
    show prescriptionsProvider;
import 'package:health_app/features/pharmacist/data/requests/dispense_prescription.dart'
    as Req;
import 'package:health_app/features/pharmacist/data/responses/dispense_response.dart';
import 'package:health_app/features/pharmacist/domain/models/prescription.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog.dart';

class SubmitPrescriptionDialog extends ConsumerStatefulWidget {
  const SubmitPrescriptionDialog({super.key, required this.prescription});

  final Prescription prescription;

  @override
  ConsumerState<SubmitPrescriptionDialog> createState() =>
      _SubmitPrescriptionDialogState();
}

class _SubmitPrescriptionDialogState
    extends ConsumerState<SubmitPrescriptionDialog> {
  late Prescription prescription;

  // Controllers to track notes for each specific item
  final Map<String, TextEditingController> _itemNoteControllers = {};

  // Controller for the overall prescription notes
  final TextEditingController _generalNotesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    prescription = widget.prescription;

    for (var item in prescription.items) {
      _itemNoteControllers[item.id.toString()] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in _itemNoteControllers.values) {
      controller.dispose();
    }
    _generalNotesController.dispose();
    super.dispose();
  }

  void _toggleDispenseState(PrescriptionItem item, bool? newValue) {
    if (newValue == null) return;

    setState(() {
      prescription = prescription.copyWith(
        items: prescription.items.map((itm) {
          if (itm.id == item.id) {
            return itm.copyWith(isDispensed: newValue);
          }
          return itm;
        }).toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dispensedItems = prescription.items
        .where((itm) => itm.isDispensed)
        .toList();

    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.medication_liquid,
              // color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          const Text('Dispense', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select medications to dispense and add optional instructions.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),

              // Interactive List of Medications
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.dividerColor.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: prescription.items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final isLast = index == prescription.items.length - 1;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: item.isDispensed
                            ? theme.colorScheme.primaryContainer.withOpacity(
                                0.3,
                              )
                            : Colors.transparent,
                        border: isLast
                            ? null
                            : Border(
                                bottom: BorderSide(
                                  color: theme.dividerColor.withOpacity(0.3),
                                ),
                              ),
                      ),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            title: Text(
                              item.medicationName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: item.isDispensed
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                            value: item.isDispensed,
                            activeColor: theme.colorScheme.primary,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            onChanged: (val) => _toggleDispenseState(item, val),
                          ),

                          // Animated Size for smooth expansion of the text field
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutCubic,
                            child: item.isDispensed
                                ? Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      52,
                                      0,
                                      16,
                                      16,
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          prescription = prescription.copyWith(
                                            items: prescription.items.map((i) {
                                              if (i.id == item.id) {
                                                return i.copyWith(notes: value);
                                              }
                                              return i;
                                            }).toList(),
                                          );
                                        });
                                      },
                                      controller:
                                          _itemNoteControllers[item.id
                                              .toString()],
                                      decoration: InputDecoration(
                                        hintText:
                                            'Dosage instructions or warnings...',
                                        filled: true,
                                        fillColor: theme.colorScheme.surface,
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 12,
                                            ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.edit_note,
                                          size: 20,
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                      style: const TextStyle(fontSize: 14),
                                      minLines: 1,
                                      maxLines: 3,
                                    ),
                                  )
                                : const SizedBox.shrink(), // Takes zero space when not dispensed
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 24),

              // General Prescription Notes
              TextFormField(
                controller: _generalNotesController,
                decoration: InputDecoration(
                  labelText: 'General Dispensing Notes',
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest
                      .withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: theme.dividerColor.withOpacity(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: theme.dividerColor.withOpacity(0.5),
                    ),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(
                      bottom: 24.0,
                    ), // Align to top for multiline
                    child: Icon(Icons.comment_outlined),
                  ),
                ),
                maxLines: 3,
              ),

              const SizedBox(height: 24),

              // Summary Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ready to Dispense',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: dispensedItems.isNotEmpty
                          ? theme.colorScheme.primary
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${dispensedItems.length} / ${prescription.items.length}',
                      style: TextStyle(
                        color: dispensedItems.isNotEmpty
                            ? theme.colorScheme.onPrimary
                            : Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Visual Chips for Selected Items with AnimatedSwitcher
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: dispensedItems.isEmpty
                    ? Container(
                        key: const ValueKey('empty'),
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: const Text(
                          'No medications selected yet.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : SizedBox(
                        key: const ValueKey('chips'),
                        width: double.infinity,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: dispensedItems.map((itm) {
                            return Chip(
                              label: Text(
                                itm.medicationName,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                              avatar: const Icon(
                                Icons.check_circle,
                                size: 16,
                                color: Colors.green,
                              ),
                              backgroundColor:
                                  theme.colorScheme.primaryContainer,
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
              ),
              const SizedBox(height: 8), // Bottom padding before actions
            ],
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FilledButton.icon(
          onPressed: dispensedItems.isEmpty
              ? null
              : () async {
                  final request = Req.DispensePrescriptionRequest(
                    notes: _generalNotesController.text.trim(),
                    prescriptionId: prescription.id,
                    items: dispensedItems
                        .map(
                          (i) => Req.PrescriptionItem(
                            dispensed: true,
                            notes:
                                _itemNoteControllers[i.id.toString()]?.text
                                    .trim() ??
                                '',
                            prescriptionItemId: i.id,
                          ),
                        )
                        .toList(),
                  );
                  try {
                    AppDialog().loading();
                    final res = await appRepo.getDio().post(
                      '/Pharmacist/dispense-prescription',
                      data: request.toJson(),
                    );
                    AppDialog().dismiss();
                    final res2 = DispenseResponse.fromJson(res.data);
                    if (res2.success.isN()) {
                      ref.read(prescriptionsProvider.notifier).refresh();

                      context.mayPop(true);
                    } else {}
                  } catch (e) {}

                  // xlog(res.data);

                  // xlog(request.toJson());
                  // xlog(_itemNoteControllers);
                  // Navigator.of(context).pop(request);
                },
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const Icon(Icons.verified, size: 18),
          label: const Text(
            'Confirm',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
