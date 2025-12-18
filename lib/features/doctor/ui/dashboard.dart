// import 'package:flutter/material.dart';
// import 'package:health_app/shared/ex.dart';
// import './home_page.dart';
// import './medical_history_page.dart';

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     const HomePage(),
//     const MedicalHistoryPage(),
//     Container(color: Colors.orange, child: const Center(child: Text('Appointments'))),
//     Container(color: Colors.purple, child: const Center(child: Text('Medications'))),
//     Container(color: Colors.brown, child: const Center(child: Text('Profile'))),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final localizations = context.tr;
//     final isArabic = Localizations.localeOf(context).languageCode == 'ar';

//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         items: [
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.home),
//             label: localizations.home,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.medical_services),
//             label: localizations.medicalHistory,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.calendar_today),
//             label: localizations.appointments,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.medication),
//             label: localizations.medications,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.person),
//             label: localizations.profile,
//           ),
//         ],
//       ),
//     );
//   }
// }