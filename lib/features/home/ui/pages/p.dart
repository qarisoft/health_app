import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/home/ui/pages/initialize_profile/p.dart';
import 'package:health_app/features/home/ui/pages/initialize_profile/page.dart';
import 'package:health_app/features/home/ui/pages/initialize_profile/page2.dart';
import 'package:health_app/features/home/ui/pages/prescriptions_page.dart';
import 'package:health_app/features/home/ui/pages/qr.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import './profile.dart';

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
                              // xlog('error');
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


  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, context.tr.home, 0),
            _buildNavItem(Icons.bar_chart, context.tr.emergencyInfo, 1),
            SizedBox(width: 40), // Space for FAB
            _buildNavItem(Icons.fitness_center, context.tr.prescriptions, 2),
            _buildNavItem(Icons.person, context.tr.profilePage, 3),
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
