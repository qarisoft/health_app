import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/home/ui/pages/initialize_profile/p.dart';
import 'package:health_app/features/home/ui/pages/initialize_profile/page.dart';
import 'package:health_app/features/home/ui/pages/prescriptions_page.dart';
import 'package:health_app/features/home/ui/pages/qr.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import './profile.dart';
import 'home_page.dart';
import 'patient_emergency_screen.dart' show EmergenciesScreen;

part 'p.g.dart';

// medicalrec
// emergency
// prescriptions

class MainPatientPage extends ConsumerWidget {
  const MainPatientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // xlog('sssssssssssssss');
    final isInitialized = ref.watch(isInitializedProvider);

    if (isInitialized) {
      return HomePage();
    }
    return InitializeProfilePage();
  }
}

// class InitializedProfilePage2 extends ConsumerWidget {
//   const InitializedProfilePage2({super.key, this.onBackPressed});
//
//   final VoidCallback? onBackPressed;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ac = ref.watch(accountProvider);
//     final patient = ac.whenOrNull(
//       acount: (account) => account.whenOrNull(patient: (p) => p),
//     );
//     // xlog(patient);
//
//     return InitializeProfilePage2(onBackPressed: onBackPressed);
//   }
// }
// @riverpod
// int patientSelectedPageIndex (Ref ref) {
//   return 0;
// }

@riverpod
class PatientSelectedPageIndex extends _$PatientSelectedPageIndex {
  @override
  int build() {
    return 0;
  }

  setPageIndex(int a) {
    state = a;
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  //  _HomePageState();
  // int _selectedIndex = 0;
  // final PageController _pageController = PageController();
  Map<String, dynamic> healthData = {
    'steps': 8423,
    'calories': 420,
    'heartRate': 72,
    'sleep': 7.2,
    'water': 1.8,
    'weight': 68.5,
  };

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(patientSelectedPageIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,

      // backgroundColor: Color(0xFFF8FAFD),
      body: [
        MyHomePage(),
        EmergenciesScreen(),

        PatientPrescriptionsScreen(),
        ProfilePage(),
      ][selectedIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavBar(selectedIndex),

      // Floating Action Button for Quick Add
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AppDialog().loading(message: context.tr.loading);
          // final dio = appRepo.getDio();
          // final res0 = await dio.get('/Patient/emergency-screen');
          // xlog(res0);

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
        },
        backgroundColor: Color(0xFF4A6FFF),
        shape: CircleBorder(),
        child: Icon(Icons.qr_code, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomNavBar(int selectedIndex) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, context.tr.home, 0, selectedIndex),
            _buildNavItem(
              Icons.bar_chart,
              context.tr.emergencyPage,
              1,
              selectedIndex,
            ),
            SizedBox(width: 40), // Space for FAB
            _buildNavItem(
              Icons.fitness_center,
              context.tr.prescriptions,
              2,
              selectedIndex,
            ),
            _buildNavItem(
              Icons.person,
              context.tr.profilePage,
              3,
              selectedIndex,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    int selectedIndex,
  ) {
    return GestureDetector(
      onTap: () {
        ref.read(patientSelectedPageIndexProvider.notifier).setPageIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedIndex == index
                ? Color(0xFF4A6FFF)
                : Color(0xFF8A8A8A),
            size: 28,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selectedIndex == index
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
