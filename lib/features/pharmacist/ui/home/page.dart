import 'package:flutter/material.dart';
import 'package:health_app/features/auth/domain/models/patient.dart'
    show Doctor, Pharmacist;
import 'package:health_app/features/doctor/ui/medical_record.dart';
import '../prescriptions/page.dart';
import 'package:health_app/features/doctor/ui/profile.dart';
import 'package:health_app/features/pharmacist/ui/profile/page.dart';
import './home_page.dart';
// import '../data/repositories/patient_repo.dart' show PatientRepository;
// import '../domain/patient.dart' show Patient;
// import '../widgets/patient_form_dialog.dart';
// import '../widgets/patient_card.dart';
// import '../models/patient.dart';
// import '../repositories/patient_repository.dart';

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
          PharmacistHomePage(),
          PrescriptionsPage(),
          PrescriptionsPage(),
          PharmacistProfilePage(
            pharmacist: Pharmacist(
              email: 'dsadsa@dsads.sa',
              fullName: 'Pharmacist name',
              id: 1,
              licenseNumber: '432432423',
              phoneNumber: '123456789',
              userId: 2,
              pharmacyName: "Pharmacy",
              // hospital: 'dsadasdsa',
              // specialization: 'dsadsadas',
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      // notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'الرئيسية', 0),
            _buildNavItem(Icons.bar_chart, 'الوصفات', 1),
            // SizedBox(width: 40), // Space for FAB
            _buildNavItem(Icons.fitness_center, 'prescriptions', 2),
            _buildNavItem(Icons.person, 'البروفايل', 3),
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
