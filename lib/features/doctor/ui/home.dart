import 'package:flutter/material.dart';
import 'package:health_app/features/doctor/ui/medical_record.dart';
import 'package:health_app/features/doctor/ui/prescreptions.dart';
import 'package:health_app/features/doctor/ui/profile.dart';
import 'package:health_app/shared/ex.dart';

import 'doctor_home_page.dart';

// --- HomePage Wrapper ---

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const DoctorHome(),
          const DoctorMedicalRecord(),
          const PrescreptionsPage(),
          DoctorProfilePage(), // Use a proper constructor
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF4A6FFF),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: tr.home),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bar_chart),
            label: tr.medicalRecord,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.medical_services),
            label: tr.prescriptions,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: tr.profilePage,
          ),
        ],
      ),
    );
  }
}
