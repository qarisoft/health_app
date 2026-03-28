import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/doctor/data/providers/home_provider.dart'
    show recentPatientsProvider, doctorInsightsProvider;
import 'package:health_app/features/doctor/data/requests/home.dart';
import 'package:health_app/features/doctor/data/responses/patient_response.dart';
import 'package:health_app/features/doctor/ui/profile.dart';
import 'package:health_app/features/doctor/ui/widgets/patient_card.dart';
import 'package:health_app/features/doctor/ui/widgets/patient_page.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';

import '../../../core/error/app_error.dart';
import '../../../shared/widgets/dialog/single_input_dialog.dart'
    show SingleInputDialog;

class DoctorHome extends ConsumerStatefulWidget {
  const DoctorHome({super.key});

  @override
  ConsumerState<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends ConsumerState<DoctorHome> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    // Watch Riverpod State
    final patientsAsync = ref.watch(recentPatientsProvider);
    final insightsAsync = ref.watch(
      doctorInsightsProvider,
    ); // Available if you want to use it in statistics

    // Extract the list safely, defaulting to empty if loading/error
    final patients = patientsAsync.value ?? [];

    // Filter patients locally based on UI search query
    final filteredPatients = patients.where((p) {
      if (_searchQuery.isEmpty) return true;
      return p.name.toLowerCase().contains(_searchQuery) ||
          p.patientCode.toLowerCase().contains(_searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.patients),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                ref.read(recentPatientsProvider.notifier).refresh(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(tr),

          if (patientsAsync.hasValue) _buildStatistics(tr, patients.length),

          Expanded(
            child: patientsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => NoAuthScreen(),
              data: (_) => _buildPatientList(tr, filteredPatients),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleSearchPress,
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(tr.addPatient, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSearchBar(var tr) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: tr.searchPatients,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  Widget _buildStatistics(var tr, int totalPatients) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            tr.totalPatients,
            totalPatients.toString(),
            Icons.group,
            Colors.blue,
          ),
          _buildStatItem(
            tr.activePatients,
            totalPatients.toString(), // Replace with active logic if needed
            Icons.check_circle,
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget _buildPatientList(var tr, List<RecentPatient> filteredList) {
    if (filteredList.isEmpty) {
      return Center(child: Text(tr.noPatientsFound));
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(recentPatientsProvider.notifier).refresh(),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final patient = filteredList[index];
          return PatientCard(
            patient: patient,
            onView: () {}, // Implementation for viewing
            onEdit: () {}, // Implementation for editing
            onDelete: () => _deletePatient(patient.id),
          );
        },
      ),
    );
  }

  Future<void> _deletePatient(dynamic id) async {
    final tr = context.tr;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr.confirmDelete),
        content: Text(tr.deletePatientMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(tr.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(tr.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      // Call the generated provider notifier to delete and update state
      await ref.read(recentPatientsProvider.notifier).deletePatient(id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(tr.patientDeleted),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _handleSearchPress() async {
    final identifier = await showDialog<String>(
      context: context,
      builder: (context) => const SingleInputDialog(title: '', label: ''),
    );

    if (identifier != null && identifier.isNotEmpty) {
      AppDialog().loading();
      final res = await appRepo.searchPatient(identifier);
      AppDialog().dismiss();

      res.when(
        success: (json) {
          final response = PatientResponse.fromJson(json);
          if (response.patient != null && mounted) {
            context.to(PatientPage(patient: response.patient!));
          }
        },
        error: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${context.tr.noPatientsFound}: ${error.msg}'),
            ),
          );
        },
      );
    }
  }
}
