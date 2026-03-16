import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/features/pharmacist/data/providers/prescription_queu.dart';
import 'package:health_app/features/pharmacist/domain/models/prescription.dart';

import 'create_dialog.dart';

class PharmacistHomePage extends StatelessWidget {
  const PharmacistHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // 1. Modern Header with Stats
          Consumer(
            builder: (context, ref, _) {
              final ac = ref.watch(
                allAcountsProvider.select((s) => s.pharmacist),
              );
              final pharmacist = ac?.pharmacist;
              return SliverAppBar(
                expandedHeight: 220.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00796B), Color(0xFF4DB6AC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Consumer(
                      builder: (context, ref, _) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${pharmacist?.fullName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _StatWidget(
                                  label: 'pharmacyName ',
                                  value: pharmacist?.pharmacyName ?? '',
                                ),
                                _StatWidget(
                                  label: 'licenseNumber',
                                  value: pharmacist?.licenseNumber ?? '',
                                ),
                                // _StatWidget(label: "Inventory", value: "Low"),
                              ],
                            ),
                            SizedBox(height: 30),
                          ],
                        );
                      },
                    ),
                  ),
                  title: const Text("Home"),
                  // title: Text("${pharmacist?.fullName}"),
                  centerTitle: true,
                ),
              );
            },
          ),

          // 2. Quick Actions Grid
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Quick Actions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.5,
                    children: [
                      _QuickActionCard(
                        icon: Icons.qr_code_scanner,
                        label: "Scan Rx",
                        color: Colors.blue,
                        onTap: () {},
                      ),
                      _QuickActionCard(
                        icon: Icons.add_circle_outline,
                        label: "Manual Entry",
                        color: Colors.orange,
                        onTap: () {},
                      ),
                      _QuickActionCard(
                        icon: Icons.inventory_2_outlined,
                        label: "Stock Check",
                        color: Colors.purple,
                        onTap: () {},
                      ),
                      _QuickActionCard(
                        icon: Icons.people_outline,
                        label: "Patients",
                        color: Colors.green,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 3. Recent Prescriptions List (Preview)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's Queue",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See All")),
                ],
              ),
            ),
          ),

          // Extra padding at bottom
          SliverToBoxAdapter(
            child: Consumer(
              builder: (context, ref, child) {
                final data = ref.watch(prescriptionQueueProvider);
                return data.when(
                  data: (d) {
                    // xlog(d.toString());
                    return Column(
                      children: List.generate(d.length, (index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            d[index].patientName ?? 'no Patient name',
                          ),
                          subtitle: Text("item count ${d[index].itemCount}"),
                          trailing: Text(
                            getPrescriptionStatusString(d[index].status ?? 1),
                          ),
                          onTap: () {},
                        );
                      }),
                    );
                  },
                  error: (e, s) => Center(child: Text('error ${e.toString()}')),
                  loading: () => Center(child: CircularProgressIndicator()),
                );
                //
                // return
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),

          // SliverToBoxAdapter(child: Text('data')),
        ],
      ),

      // Floating Action Button for major task
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // final a = await di<AppRepositories>().getDio().get(
          //   '/PharmacistDashboard/queue',
          // );
          // xlog(a.data);

          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return CreatePrescriptionDialog();
          //   },
          // );
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CreatePrescriptionPage(patientId: 1, doctorId: 1),
            ),
          );
        },
        backgroundColor: const Color(0xFF00796B),
        icon: const Icon(Icons.add),
        label: const Text("New Prescription"),
      ),
    );
  }
}

class _StatWidget extends StatelessWidget {
  final String label, value;
  const _StatWidget({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 10),
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
