import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';

import '../../data/providers/search_dugs.dart' show searchDrugsProvider;

// import 'package:health_app/features/doctor/data/providers/search_patient.dart';
// import 'package:health_app/features/doctor/data/providers/search_drugs.dart';

class SearchDrugsDialog extends ConsumerWidget {
  const SearchDrugsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the Freezed state from our Notifier
    final searchState = ref.watch(searchDrugsProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 8,
      child: ConstrainedBox(
        // Keeps the dialog from taking up the entire screen height
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          minHeight: 300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // context.tr.searchDrugs ??
                    'Search ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context), // Returns null
                    splashRadius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // --- Search Input ---
              CustomTextField(
                labelText: context.tr.search ?? 'Search...',
                hintText: 'e.g., Paracetamol, Aspirin',
                prefixIcon: Icons.search_rounded,
                isCompact: true,
                onChanged: (value) {
                  // Trigger the search directly on the notifier
                  ref.read(searchDrugsProvider.notifier).search(value);
                },
              ),
              const SizedBox(height: 16),

              // --- Loading Indicator ---
              // Shows a thin loading bar right under the search box without hiding results
              if (searchState.isLoading)
                LinearProgressIndicator(
                  backgroundColor: Theme.of(
                    context,
                  ).primaryColor.withOpacity(0.1),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(4),
                )
              else
                const SizedBox(height: 4),

              // Placeholder to prevent layout jump
              const SizedBox(height: 8),

              // --- Error Message ---
              if (searchState.error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    searchState.error!,
                    style: TextStyle(color: Colors.red.shade600, fontSize: 13),
                  ),
                ),

              // --- Results List ---
              Expanded(
                child: searchState.drugs.isEmpty && !searchState.isLoading
                    ? Center(
                        child: Text(
                          // context.tr.noResultsFound ??
                          'No medications found.',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      )
                    : ListView.separated(
                        itemCount: searchState.drugs.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final drug = searchState.drugs[index];

                          // Display logic ensuring the Brand Name is prioritized first
                          final String primaryName =
                              drug.brandName ??
                              drug.scientificName ??
                              'Unknown Medication';
                          final String secondaryName =
                              drug.brandName != null &&
                                  drug.scientificName != null
                              ? drug.scientificName!
                              : (drug.chemicalName ?? '');

                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(
                                context,
                              ).primaryColor.withOpacity(0.1),
                              child: Icon(
                                Icons.medication_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            title: Text(
                              primaryName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: secondaryName.isNotEmpty
                                ? Text(
                                    secondaryName,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  )
                                : null,
                            onTap: () {
                              // Pop the dialog and return the selected drug object!
                              Navigator.pop(context, drug);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
