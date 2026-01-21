import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/app_strings.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/features/pharmacist/data/providers/prescriptions.dart';
import 'package:health_app/features/pharmacist/ui/prescriptions/edit.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:health_app/shared/widgets/dialog/single_input_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

import '../../domain/models/prescription.dart'
    show Prescription, PrescriptionItem;

// class  extends ConsumerStatefulWidget {
//   const ({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _State();
// }

// // class _State extends ConsumerState<> {

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
class PrescriptionPage extends ConsumerStatefulWidget {
  const PrescriptionPage({super.key});

  @override
  ConsumerState<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends ConsumerState<PrescriptionPage> {
  // final List<Prescription> _prescriptions = [];
  // final ScrollController _scrollController = ScrollController();
  // bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);
  }

  // void _onScroll() {
  //   if (_scrollController.position.pixels >=
  //       _scrollController.position.maxScrollExtent - 200) {
  //     if (!_isLoading && _prescriptions.isNotEmpty) _fetchPrescriptions();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final _prescriptions = ref.watch(prescriptionsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("My Prescriptions")),
      body: _prescriptions.isEmpty
          ? _buildEmptyState()
          : RefreshIndicator(
              onRefresh: () async {
                // setState(() => _prescriptions.clear());
                // await _fetchPrescriptions();
              },
              child: ListView.builder(
                // controller: _scrollController,
                padding: const EdgeInsets.all(12),
                itemCount: _prescriptions.length,
                itemBuilder: (context, index) {
                  if (index < _prescriptions.length) {
                    return PrescriptionCard(
                      prescription: _prescriptions[index],
                      // onEdit: () => _editPrescription(_prescriptions[index]),
                      // onDelete: () =>
                      // setState(() => _prescriptions.removeAt(index)),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.medication_liquid,
            size: 100,
            color: Colors.blueGrey,
          ),
          const SizedBox(height: 20),
          const Text(
            "No prescriptions found",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: _fetchPrescriptions,
          //   child: const Text("Add Prescription"),
          // ),
        ],
      ),
    );
  }

  // void _editPrescription(Prescription p) {
  //   // Logic to open an edit form
  //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Editing ${p.id}")));
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return EditPrescriptionDialog(prescription: p);
  //     },
  //   );
  // }
}

class PrescriptionCard extends StatelessWidget {
  final Prescription prescription;
  // final VoidCallback onEdit;
  // final VoidCallback onDelete;

  const PrescriptionCard({
    super.key,
    required this.prescription,
    // required this.onEdit,
    // required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Doctor & Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prescription.doctorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      prescription.diagnosis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                // PopupMenuButton(
                //   itemBuilder: (context) => [
                //     const PopupMenuItem(value: 'edit', child: Text("Edit")),
                //     const PopupMenuItem(
                //       value: 'delete',
                //       child: Text(
                //         "Delete",
                //         style: TextStyle(color: Colors.red),
                //       ),
                //     ),
                //   ],
                //   onSelected: (val) => val == 'edit' ? onEdit() : onDelete(),
                // ),
              ],
            ),
            const Divider(),
            // Nested Items List
            ...prescription.items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 8, color: Colors.blue),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "${item.medicationName} (${item.dosage}) - ${item.frequency}",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EndlessListPage extends StatefulWidget {
  const EndlessListPage({super.key});

  @override
  State<EndlessListPage> createState() => _EndlessListPageState();
}

class _EndlessListPageState extends State<EndlessListPage> {
  final List<String> _items = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Listen to scroll position for pagination
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (!_isLoading && _items.isNotEmpty) {
          _loadMoreData();
        }
      }
    });
  }

  // Simulate fetching data
  Future<void> _loadMoreData() async {
    setState(() => _isLoading = true);

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    final newItems = List.generate(
      15,
      (index) => "Item ${_items.length + index + 1}",
    );

    setState(() {
      _items.addAll(newItems);
      _isLoading = false;
    });
  }

  // Handle Refresh Indicator
  Future<void> _handleRefresh() async {
    setState(() => _items.clear());
    await _loadMoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Endless Scroll")),
      // 1. Check if the list is empty
      body: _items.isEmpty
          ? _buildEmptyState()
          : RefreshIndicator(
              onRefresh: _handleRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _items.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < _items.length) {
                    return ListTile(
                      title: Text(_items[index]),
                      leading: const Icon(Icons.label),
                    );
                  } else {
                    // Bottom Loader
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
            ),
    );
  }

  // 2. Empty State Widget
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.cloud_off, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text("No data found", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _loadMoreData,
            icon: const Icon(Icons.add),
            label: const Text("Add First Items"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class PrescriptionsPage extends ConsumerStatefulWidget {
  const PrescriptionsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PrescriptionsPageState();
}

class _PrescriptionsPageState extends ConsumerState<PrescriptionsPage> {
  void _handleSearchPress() async {
    final id = await showDialog(
      context: context,
      builder: (context) {
        return SingleInputDialog(label: 'المعرف', title: 'البحث عن وصفه');
      },
    );

    if (id != null) {
      AppDialog().loading(message: AppStrings.loadingMsg);

      final res = await di<AppRepositories>().searchPrescription(id);

      AppDialog().dismiss();

      res.when(
        success: (data) {
          ref
              .read(prescriptionsProvider.notifier)
              .setPrescriptions(data.prescriptions);
        },
        error: (e) {
          AppDialog().show(
            type: DialogType.error,
            message: e.msg,
            title: 'Error',
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = [];
    return Scaffold(
      // appBar: AppBar(),
      body: data.isEmpty ? PrescriptionPage() : SingleChildScrollView(),
      // body: data.isEmpty ? _buildEmptyState() : SingleChildScrollView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleSearchPress,
        label: const Text('بحث'),
        icon: const Icon(Icons.search),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.cloud_off, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text("No data found", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 24),
          // ElevatedButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.add),
          //   label: const Text("Add First Items"),
          // ),
        ],
      ),
    );
  }
}
