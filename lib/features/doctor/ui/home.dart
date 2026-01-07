import 'package:flutter/material.dart';
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Doctor;
import 'package:health_app/features/doctor/ui/profile.dart';
import 'package:health_app/shared/ex.dart';
import '../data/repositories/patient_repo.dart' show PatientRepository;
import '../domain/patient.dart' show Patient;
// import '../widgets/patient_form_dialog.dart';
// import '../widgets/patient_card.dart';
// import '../models/patient.dart';
// import '../repositories/patient_repository.dart';
import 'widgets/form_dialog.dart' show PatientFormDialog;
import 'widgets/patient_card.dart' show PatientCard;

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  final PatientRepository _patientRepository = PatientRepository();
  final TextEditingController _searchController = TextEditingController();
  List<Patient> _patients = [];
  List<Patient> _filteredPatients = [];
  bool _isLoading = true;
  String _searchQuery = '';

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
    final patients = await _patientRepository.getAllPatients();
    setState(() {
      _patients = patients;
      _filteredPatients = patients;
      _isLoading = false;
    });
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      if (_searchQuery.isEmpty) {
        _filteredPatients = _patients;
      } else {
        _filterPatients();
      }
    });
  }

  Future<void> _filterPatients() async {
    final filtered = await _patientRepository.searchPatients(_searchQuery);
    setState(() {
      _filteredPatients = filtered;
    });
  }

  Future<void> _addPatient() async {
    await showDialog(
      context: context,
      builder: (context) => PatientFormDialog(onSubmit: _createPatient),
    );
  }

  Future<void> _editPatient(Patient patient) async {
    await showDialog(
      context: context,
      builder: (context) => PatientFormDialog(
        patient: patient,
        isEditing: true,
        onSubmit: _updatePatient,
      ),
    );
  }

  Future<void> _createPatient(Patient patient) async {
    await _patientRepository.createPatient(patient);
    await _loadPatients();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.tr.patientAdded),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _updatePatient(Patient patient) async {
    await _patientRepository.updatePatient(patient);
    await _loadPatients();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.tr.patientUpdated),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Future<void> _deletePatient(Patient patient) async {
    final localizations = context.tr;

    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.confirmDelete),
        content: Text(localizations.deletePatientMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(localizations.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              localizations.delete,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _patientRepository.deletePatient(patient.id);
      await _loadPatients();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(localizations.patientDeleted),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _viewPatientDetails(Patient patient) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _buildPatientDetailsSheet(patient),
    );
  }

  Widget _buildPatientDetailsSheet(Patient patient) {
    final localizations = context.tr;

    return Container(
      padding: const EdgeInsets.all(24),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.heightOf(context) * 0.8,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localizations.patientDetails,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Patient Info
                  _buildDetailRow(
                    Icons.person,
                    localizations.patientName,
                    patient.name,
                  ),
                  _buildDetailRow(
                    Icons.phone,
                    localizations.phoneNumber,
                    patient.phoneNumber,
                  ),
                  _buildDetailRow(
                    Icons.badge,
                    localizations.nationalId,
                    patient.nationalId,
                  ),

                  if (patient.email != null)
                    _buildDetailRow(
                      Icons.email,
                      localizations.email,
                      patient.email!,
                    ),

                  if (patient.gender != null)
                    _buildDetailRow(
                      patient.gender == 'male' ? Icons.male : Icons.female,
                      localizations.gender,
                      patient.gender == 'male'
                          ? localizations.male
                          : patient.gender == 'female'
                          ? localizations.female
                          : localizations.other,
                    ),

                  if (patient.bloodType != null)
                    _buildDetailRow(
                      Icons.bloodtype,
                      localizations.bloodType,
                      patient.bloodType!,
                    ),

                  if (patient.dateOfBirth != null)
                    _buildDetailRow(
                      Icons.cake,
                      localizations.dateOfBirth,
                      '${patient.dateOfBirth!.day}/${patient.dateOfBirth!.month}/${patient.dateOfBirth!.year}',
                    ),

                  if (patient.address != null)
                    _buildDetailRow(
                      Icons.location_on,
                      localizations.address,
                      patient.address!,
                    ),

                  if (patient.emergencyContact != null)
                    _buildDetailRow(
                      Icons.emergency,
                      localizations.emergencyContact,
                      patient.emergencyContact!,
                    ),

                  if (patient.notes != null)
                    _buildDetailRow(
                      Icons.note,
                      localizations.notes,
                      patient.notes!,
                    ),

                  const SizedBox(height: 30),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _editPatient(patient),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(localizations.edit),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _deletePatient(patient),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(localizations.delete),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    final localizations = context.tr;
    final activeCount = _patients.where((p) => p.isActive).length;
    final inactiveCount = _patients.length - activeCount;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard(
            localizations.totalPatients,
            _patients.length.toString(),
            Icons.group,
            Colors.blue,
          ),
          _buildStatCard(
            localizations.activePatients,
            activeCount.toString(),
            Icons.check_circle,
            Colors.green,
          ),
          _buildStatCard(
            localizations.inactivePatients,
            inactiveCount.toString(),
            Icons.pause_circle,
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: SizedBox(
              width: MediaQuery.widthOf(context) / 4,
              child: Center(
                child: Text(
                  title.replaceFirst('المرضى', ''),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.tr;
    // final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.patients),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPatients,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: localizations.searchPatients,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ),

          // Statistics
          if (_patients.isNotEmpty) _buildStatistics(),

          // Patients List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredPatients.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.group_off,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          localizations.noPatientsFound,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                          ),
                        ),
                        if (_searchQuery.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: TextButton(
                              onPressed: () {
                                _searchController.clear();
                              },
                              child: Text('Clear search'),
                            ),
                          ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _loadPatients,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 80),
                      itemCount: _filteredPatients.length,
                      itemBuilder: (context, index) {
                        final patient = _filteredPatients[index];
                        return PatientCard(
                          patient: patient,
                          onView: () => _viewPatientDetails(patient),
                          onEdit: () => _editPatient(patient),
                          onDelete: () => _deletePatient(patient),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addPatient,
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          localizations.addPatient,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  _HomePageState();
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // Sample health data
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFD),
      body: PageView(
        controller: _pageController,
        children: [
          DoctorHome(),
          DoctorHome(),
          DoctorHome(),
          DoctorProfilePage(
            doctor: Doctor(
              email: 'dsadsa@dsads.sa',
              fullName: 'dsadsdas',
              id: 1,
              licenseNumber: '432432423',
              phoneNumber: '123456789',
              hospital: 'dsadasdsa',
              userId: 2,
              specialization: 'dsadsadas',
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavBar(),

      // Floating Action Button for Quick Add
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add new health data
      //     _showAddDataDialog(context);
      //   },
      // backgroundColor: Color(0xFF4A6FFF),
      // shape: CircleBorder(),
      // child: Icon(Icons.qr_code, color: Colors.white, size: 28),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // void _showAddDataDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Add Health Data'),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               _buildAddDataField('Steps', 'steps', Icons.directions_walk),
  //               _buildAddDataField('Heart Rate', 'heartRate', Icons.favorite),
  //               _buildAddDataField(
  //                 'Sleep (hours)',
  //                 'sleep',
  //                 Icons.nightlight_round,
  //               ),
  //               _buildAddDataField('Water (L)', 'water', Icons.local_drink),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('Cancel'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               // Save data logic here
  //               Navigator.pop(context);
  //             },
  //             child: Text('Save'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Widget _buildAddDataField(String label, String key, IconData icon) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: TextField(
  //       decoration: InputDecoration(
  //         labelText: label,
  //         prefixIcon: Icon(icon),
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  //       ),
  //       keyboardType: TextInputType.number,
  //       onChanged: (value) {
  //         if (value.isNotEmpty) {
  //           setState(() {
  //             healthData[key] = double.parse(value);
  //           });
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      // notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.bar_chart, 'Stats', 1),
            // SizedBox(width: 40), // Space for FAB
            _buildNavItem(Icons.fitness_center, 'Workout', 2),
            _buildNavItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        _pageController.jumpToPage(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index
                ? Color(0xFF4A6FFF)
                : Color(0xFF8A8A8A),
            size: 28,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: _selectedIndex == index
                  ? Color(0xFF4A6FFF)
                  : Color(0xFF8A8A8A),
            ),
          ),
        ],
      ),
    );
  }
}
