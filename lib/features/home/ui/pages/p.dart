import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/home/data/providers/emergency.dart';
import 'package:health_app/features/home/ui/pages/initialize_profile/p.dart';
import 'package:health_app/features/home/ui/pages/initialize_profile/page.dart';
import 'package:health_app/features/home/ui/pages/initialize_profile/page2.dart';
import 'package:health_app/features/home/ui/pages/prescriptions_page.dart';
import 'package:health_app/features/home/ui/pages/qr.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import './profile.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'home_page.dart';
import 'patient_emergency_screen.dart' show EmergenciesScreen;

// medicalrec
// emergency
// prescriptions

class MainPatientPage extends ConsumerWidget {
  const MainPatientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitialized = ref.watch(isInitializedProvider);
    if (isInitialized) {
      return HomePage();
    }
    return InitializeProfilePage();
  }
}

class InitializedProfilePage2 extends ConsumerWidget {
  const InitializedProfilePage2({super.key, this.onBackPressed});

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ac = ref.watch(accountProvider);
    final patient = ac.whenOrNull(
      acount: (account) => account.whenOrNull(patient: (p) => p),
    );
    // xlog(patient);

    return InitializeProfilePage2(onBackPressed: onBackPressed);
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
  Map<String, dynamic> healthData = {
    'steps': 8423,
    'calories': 420,
    'heartRate': 72,
    'sleep': 7.2,
    'water': 1.8,
    'weight': 68.5,
  };

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
          MyHomePage(),
          EmergenciesScreen(),

          PatientPrescriptionsScreen(),
          ProfilePage(),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavBar(),

      // Floating Action Button for Quick Add
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AppDialog().loading();
          xlog('start qr ');
          final dio = appRepo.getDio();
          final res0 = await dio.get('/Patient/emergency-screen');
          xlog(res0);

          final res = await appRepo.generateQr();
          AppDialog().dismiss();

          showDialog(
            context: context,
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.6,
                    child: AlertDialog(
                      content: Column(
                        children: [
                          // Text('data'),
                          res.when(
                            success: (s) {
                              final str = s['qrCodeUrl'];
                              xlog(s);
                              return ImageFromDataUrl(dataUrl: str);
                            },
                            error: (e) {
                              xlog('error');
                              return Text(e.msg);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
          // xlog(res);
          // res.when(
          //   success: (s) {
          //     final str = s['qrCodeUrl'];
          //     xlog(s);
          //   },
          //   error: (e) {
          //     xlog('error');
          //   },
          // );

          // Add new health data
          // _showAddDataDialog(context);
        },
        backgroundColor: Color(0xFF4A6FFF),
        shape: CircleBorder(),
        child: Icon(Icons.qr_code, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showAddDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Health Data'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAddDataField('Steps', 'steps', Icons.directions_walk),
                _buildAddDataField('Heart Rate', 'heartRate', Icons.favorite),
                _buildAddDataField(
                  'Sleep (hours)',
                  'sleep',
                  Icons.nightlight_round,
                ),
                _buildAddDataField('Water (L)', 'water', Icons.local_drink),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save data logic here
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAddDataField(String label, String key, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              healthData[key] = double.parse(value);
            });
          }
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.bar_chart, 'Stats', 1),
            SizedBox(width: 40), // Space for FAB
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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
