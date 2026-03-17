import 'package:flutter/material.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:health_app/features/doctor/data/requests/home.dart';
import 'package:health_app/features/doctor/data/responses/insights.dart'
    show DoctorDashboardInsight;
import 'package:health_app/features/doctor/data/responses/patient_response.dart';
import 'package:health_app/features/doctor/ui/medical_record.dart';
import 'package:health_app/features/doctor/ui/widgets/patient_card.dart';
import 'package:health_app/features/doctor/ui/widgets/patient_page.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';

import '../data/repositories/patient_repo.dart' show PatientRepository;
import 'widgets/patient_card.dart' show PatientCard;

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  final PatientRepository _patientRepository = PatientRepository();
  final TextEditingController _searchController = TextEditingController();

  List<RecentPatient> _patients = [];
  List<RecentPatient> _filteredPatients = [];
  DoctorDashboardInsight _insights = DoctorDashboardInsight();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _initializeData() async {
    await _patientRepository.initializeWithSampleData();
    await _loadPatients();
  }

  Future<void> _loadPatients() async {
    setState(() => _isLoading = true);
    try {
      final patients = await _patientRepository.getAllPatients();
      final insightsRes = await appRepo.doctorDashboardInsights();

      setState(() {
        _patients = patients;
        _filteredPatients = patients;
        _insights = insightsRes.whenOrNull(success: (s) => s) ?? _insights;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPatients = _patients.where((p) {
        return p.name.toLowerCase().contains(query) ||
            p.patientCode.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> _deletePatient(RecentPatient patient) async {
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
      await _patientRepository.deletePatient(patient.id);
      await _loadPatients();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(tr.patientDeleted), backgroundColor: Colors.red),
      );
    }
  }

  void _handleSearchPress() async {
    final identifier = await showDialog<String>(
      context: context,
      builder: (context) => const SingleInputDialog(),
    );

    if (identifier != null && identifier.isNotEmpty) {
      AppDialog().loading();
      final res = await appRepo.searchPatient(identifier);
      AppDialog().dismiss();

      res.when(
        success: (json) {
          final response = PatientResponse.fromJson(json);
          if (response.patient != null) {
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

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.patients),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadPatients),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(tr),
          _buildStatistics(tr),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildPatientList(tr),
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
          suffixIcon: _searchController.text.isNotEmpty
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

  Widget _buildStatistics(var tr) {
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
            _patients.length.toString(),
            Icons.group,
            Colors.blue,
          ),
          _buildStatItem(
            tr.activePatients,
            _patients.length.toString(),
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

  Widget _buildPatientList(var tr) {
    if (_filteredPatients.isEmpty) {
      return Center(child: Text(tr.noPatientsFound));
    }
    return RefreshIndicator(
      onRefresh: _loadPatients,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: _filteredPatients.length,
        itemBuilder: (context, index) => PatientCard(
          patient: _filteredPatients[index],
          onView: () {}, // Implementation for viewing
          onEdit: () {}, // Implementation for editing
          onDelete: () => _deletePatient(_filteredPatients[index]),
        ),
      ),
    );
  }
}
