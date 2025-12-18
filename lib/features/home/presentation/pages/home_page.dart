// import 'package:flutter/material.dart';
// import 'package:health_app/shared/ex.dart';
// import '../../../../core/constants/app_layout.dart';
// import '../widgets/medical_history_card.dart';
// import '../widgets/medicine_schedule_card.dart';

// class HomePage extends StatefulWidget {
//   final String userName;

//   const HomePage({super.key, required this.userName});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final localizations = context.tr;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(localizations.appTitle),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               // Navigate to settings
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/login');
//             },
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           // Refresh data
//           setState(() {});
//         },
//         child: SingleChildScrollView(
//           padding: AppLayout.paddingAllMedium,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Welcome Section
//               // Padding(
//               //   padding: AppLayout.paddingHorizontalMedium,
//               //   child: Text(
//               //     localizations.welcome(widget.userName),
//               //     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//               //       fontWeight: FontWeight.bold,
//               //       color: AppColors.textPrimary,
//               //     ),
//               //   ),
//               // ),
//               // const SizedBox(height: AppLayout.spacingLarge),
//               // Medical History Section
//               // Padding(
//               //   padding: AppLayout.paddingHorizontalMedium,
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       Text(
//               //         localizations.medicalHistory,
//               //         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//               //           fontWeight: FontWeight.bold,
//               //         ),
//               //       ),
//               //       TextButton(
//               //         onPressed: () {
//               //           // View all medical history
//               //         },
//               //         child: Text(localizations.viewAll),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               const MedicalHistoryCard(),
//               const SizedBox(height: AppLayout.spacingLarge),
//               // Today's Medicine Section
//               // Padding(
//               //   padding: AppLayout.paddingHorizontalMedium,
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       Text(
//               //         localizations.todaysMedicine,
//               //         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//               //           fontWeight: FontWeight.bold,
//               //         ),
//               //       ),
//               //       TextButton(
//               //         onPressed: () {
//               //           // View all medicine
//               //         },
//               //         child: Text(localizations.viewAll),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               const MedicineScheduleCard(),
//               const SizedBox(height: AppLayout.spacingLarge),
//               // Upcoming Doctor Visits
//               // Padding(
//               //   padding: AppLayout.paddingHorizontalMedium,
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       Text(
//               //         localizations.upcomingVisits,
//               //         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//               //           fontWeight: FontWeight.bold,
//               //         ),
//               //       ),
//               //       TextButton(
//               //         onPressed: () {
//               //           // View all visits
//               //         },
//               //         child: Text(localizations.viewAll),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // const DoctorVisitsCard(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }