import 'dart:convert';

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
import 'home_page.dart' show MyHomePage;
import 'patient_emergency_screen.dart' show EmergenciesScreen;

part 'p.g.dart';

const _healthDataKey = 'HealthDataKey';

@riverpod
class HealthData extends _$HealthData {
  @override
  Map<String, double> build() {
    final s = appStorage.getString(_healthDataKey);
    try {
      if (s != null) {
        final json = jsonDecode(s) as Map<String, dynamic>;
        return {
          'steps': double.parse(json['steps'].toString()) ?? 8423,
          'calories': double.parse(json['calories'].toString()) ?? 420,
          'heartRate': double.parse(json['heartRate'].toString()) ?? 72,
          'sleep': double.parse(json['sleep'].toString()) ?? 7.2,
          'water': double.parse(json['water'].toString()) ?? 1.8,
          'weight': double.parse(json['weight'].toString()) ?? 68.5,
        };
      }
    } catch (e) {
      xlog('errrrrrrrrrrrrrrrrrrr$e');
    }
    return {
      'steps': 8423,
      'calories': 420,
      'heartRate': 72,
      'sleep': 7.2,
      'water': 1.8,
      'weight': 68.5,
    };
  }

  Future<void> updateData(Map<String, double> newEdits) async {
    // 1. Get current data (or an empty map if it's somehow missing)
    final currentData = state;

    // 2. Merge the old data with the new edits
    final updatedData = {...currentData, ...newEdits};

    // 3. Save to SharedPreferences
    // final prefs = await SharedPreferences.getInstance();
    await appStorage.setString(_healthDataKey, json.encode(updatedData));

    // 4. Update the Riverpod state so the UI rebuilds
    state = updatedData;
  }
}

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

@riverpod
class PatientSelectedPageIndex extends _$PatientSelectedPageIndex {
  @override
  int build() {
    return 0;
  }

  void setPageIndex(int a) {
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
  // Map<String, dynamic> healthData = {
  //   'steps': 8423,
  //   'calories': 420,
  //   'heartRate': 72,
  //   'sleep': 7.2,
  //   'water': 1.8,
  //   'weight': 68.5,
  // };

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(patientSelectedPageIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,

      // backgroundColor: Color(0xFFF8FAFD),
      body: [
        MyHomePage(),
        // a.MyHomePage(),
        EmergenciesScreen(),

        PatientPrescriptionsScreen(),
        ProfilePage(),
      ][selectedIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavBar(selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndex == 0) {
            _showAddDataDialog();
          } else {
            _showQr();
          }
        },
        backgroundColor: Color(0xFF4A6FFF),
        shape: CircleBorder(),
        child: Icon(Icons.qr_code, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Floating Action Button for Quick Add
    );
  }

  _showQr() async {
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
  }

  void _showAddDataDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Health Data'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAddDataField(
                  '${context.tr.steps} 10000',
                  context.tr.steps,
                  Icons.directions_walk,
                ),
                _buildAddDataField(
                  'Heart Rate 80',
                  'heartRate',
                  Icons.favorite,
                ),
                _buildAddDataField(
                  '${context.tr.sleep} (hours) 8',
                  context.tr.sleep,
                  Icons.nightlight_round,
                ),
                _buildAddDataField(
                  '${context.tr.water} (L) 2.5',
                  context.tr.water,
                  Icons.local_drink,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.tr.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                // Save data logic here
                Navigator.pop(context);
              },
              child: Text(context.tr.save),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAddDataField(
    String label,
    String key,
    IconData icon, [
    num max = 1,
  ]) {
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
            // setState(() {
            //   healthData[key] = double.parse(value);
            // });
            ref.read(healthDataProvider.notifier).updateData({
              key: double.parse(value),
            });
          }
        },
      ),
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
