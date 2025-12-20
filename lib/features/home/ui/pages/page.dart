// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:health_app/core/constants/text_variant.dart' show TextVariant;
// import 'package:intl/intl.dart';
// import 'package:health_app/l10n/app_localizations.dart';
// import 'package:health_app/shared/ex.dart';
// import 'package:health_app/shared/widgets/app_text.dart';
// import 'package:health_app/core/constants/app_colors.dart';
// import 'package:health_app/core/constants/app_layout.dart';
// // import 'package:health_app/core/enums/text_variant.dart';
// // import 'package:health_app/features/home/presentation/widgets/home_greeting.dart';
// // import 'package:health_app/features/home/presentation/widgets/health_stats_card.dart';
// import 'package:health_app/features/home/presentation/widgets/medicine_schedule_card.dart';
// import 'package:health_app/features/home/presentation/widgets/doctor_visits_card.dart';
// import 'package:health_app/features/home/presentation/widgets/medical_history_card.dart';
// // import 'package:health_app/features/home/presentation/widgets/quick_actions.dart';
// // import 'package:health_app/features/home/presentation/providers/home_provider.dart';

// class HomePage extends ConsumerStatefulWidget {
//   final String userName;

//   const HomePage({super.key, required this.userName});

//   @override
//   ConsumerState<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends ConsumerState<HomePage> {
//   late ScrollController _scrollController;
//   double _scrollOffset = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController()
//       ..addListener(() {
//         setState(() {
//           _scrollOffset = _scrollController.offset;
//         });
//       });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Future<void> _refreshData() async {
//     await Future.delayed(const Duration(seconds: 1));
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final localizations = context.tr;
//     final homeData = ref.watch(homeProvider);
//     final todayMedications = homeData.getTodayMedications();
//     final appointments = homeData.getWeeklyAppointments();
//     final medicalHistory = homeData.getMedicalHistory();

//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: RefreshIndicator(
//         onRefresh: _refreshData,
//         color: AppColors.primary,
//         backgroundColor: AppColors.surface,
//         child: CustomScrollView(
//           controller: _scrollController,
//           slivers: [
//             // App Bar with collapse effect
//             SliverAppBar(
//               pinned: true,
//               floating: true,
//               expandedHeight: 200.0,
//               collapsedHeight: 70.0,
//               backgroundColor: AppColors.primary,
//               foregroundColor: Colors.white,
//               elevation: _scrollOffset > 50 ? 4 : 0,
//               shadowColor: Colors.black.withOpacity(0.1),
//               flexibleSpace: FlexibleSpaceBar(
//                 collapseMode: CollapseMode.pin,
//                 background: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         AppColors.primary,
//                         AppColors.primary.withOpacity(0.9),
//                         AppColors.secondary.withOpacity(0.8),
//                       ],
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: AppLayout.paddingLarge,
//                       right: AppLayout.paddingLarge,
//                       bottom: AppLayout.paddingLarge,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 AppText(
//                                   text: DateFormat('EEEE, MMMM d').format(DateTime.now()),
//                                   variant: TextVariant.bodySmall,
//                                   color: Colors.white.withOpacity(0.9),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 AppText(
//                                   text: 'Good ${_getTimeOfDayGreeting()},',
//                                   variant: TextVariant.titleLarge,
//                                   color: Colors.white,
//                                 ),
//                                 AppText(
//                                   text: widget.userName,
//                                   variant: TextVariant.headlineSmall,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               width: 48,
//                               height: 48,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: Colors.white,
//                                   width: 2,
//                                 ),
//                                 image: const DecorationImage(
//                                   image: NetworkImage(
//                                     'https://api.dicebear.com/7.x/avataaars/svg?seed=${widget.userName}',
//                                   ),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: AppLayout.spacingMedium),
//                         // Health summary
//                         Row(
//                           children: [
//                             _HealthStatItem(
//                               icon: Icons.medical_services,
//                               label: 'Medications',
//                               value: '${todayMedications.where((m) => !m.isTaken).length} Left',
//                             ),
//                             const SizedBox(width: AppLayout.spacingLarge),
//                             _HealthStatItem(
//                               icon: Icons.calendar_today,
//                               label: 'Appointments',
//                               value: '${appointments.length} This Week',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.notifications_none),
//                   onPressed: () {
//                     // Navigate to notifications
//                   },
//                   tooltip: 'Notifications',
//                 ),
//                 PopupMenuButton(
//                   icon: const Icon(Icons.more_vert),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(AppLayout.borderRadiusMd),
//                   ),
//                   itemBuilder: (context) => [
//                     PopupMenuItem(
//                       child: Row(
//                         children: [
//                           const Icon(Icons.person, size: 20),
//                           const SizedBox(width: 8),
//                           Text('Profile'),
//                         ],
//                       ),
//                       onTap: () {
//                         // Navigate to profile
//                       },
//                     ),
//                     PopupMenuItem(
//                       child: Row(
//                         children: [
//                           const Icon(Icons.settings, size: 20),
//                           const SizedBox(width: 8),
//                           Text('Settings'),
//                         ],
//                       ),
//                       onTap: () {
//                         // Navigate to settings
//                       },
//                     ),
//                     const PopupMenuDivider(),
//                     PopupMenuItem(
//                       child: Row(
//                         children: [
//                           const Icon(Icons.logout, size: 20),
//                           const SizedBox(width: 8),
//                           Text('Logout'),
//                         ],
//                       ),
//                       onTap: () {
//                         // Handle logout
//                         Navigator.pushReplacementNamed(context, '/login');
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             // Main content
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Padding(
//                   padding: const EdgeInsets.all(AppLayout.paddingLarge),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Quick Actions
//                       const SizedBox(height: AppLayout.spacingMedium),
//                       QuickActions(onActionSelected: (action) {
//                         _handleQuickAction(action);
//                       }),
//                       const SizedBox(height: AppLayout.spacingLarge),
//                       // Today's Medicine
//                       _SectionHeader(
//                         title: localizations.todaysMedicine,
//                         onViewAll: () {
//                           // View all medicine
//                         },
//                         count: todayMedications.length,
//                       ),
//                       const SizedBox(height: AppLayout.spacingMedium),
//                       MedicineScheduleCard(
//                         medications: todayMedications,
//                         onTakeMedication: (id) {
//                           setState(() {
//                             // Mark medication as taken
//                           });
//                         },
//                       ),
//                       const SizedBox(height: AppLayout.spacingLarge),
//                       // Upcoming Doctor Visits
//                       _SectionHeader(
//                         title: localizations.upcomingVisits,
//                         onViewAll: () {
//                           // View all appointments
//                         },
//                         count: appointments.length,
//                       ),
//                       const SizedBox(height: AppLayout.spacingMedium),
//                       DoctorVisitsCard(appointments: appointments),
//                       const SizedBox(height: AppLayout.spacingLarge),
//                       // Medical History
//                       _SectionHeader(
//                         title: localizations.medicalHistory,
//                         onViewAll: () {
//                           // View all medical history
//                         },
//                         count: medicalHistory.length,
//                       ),
//                       const SizedBox(height: AppLayout.spacingMedium),
//                       MedicalHistoryCard(records: medicalHistory),
//                       const SizedBox(height: AppLayout.spacingLarge),
//                       // Health Stats
//                       AppText(
//                         text: 'Health Summary',
//                         variant: TextVariant.titleLarge,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       const SizedBox(height: AppLayout.spacingMedium),
//                       HealthStatsCard(),
//                       const SizedBox(height: AppLayout.spacingXXL),
//                     ],
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add new health record
//           _showAddRecordModal();
//         },
//         backgroundColor: AppColors.primary,
//         foregroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppLayout.borderRadiusLg),
//         ),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   String _getTimeOfDayGreeting() {
//     final hour = DateTime.now().hour;
//     if (hour < 12) return 'Morning';
//     if (hour < 17) return 'Afternoon';
//     return 'Evening';
//   }

//   void _handleQuickAction(QuickAction action) {
//     switch (action) {
//       case QuickAction.medication:
//         // Navigate to medication management
//         break;
//       case QuickAction.appointment:
//         // Navigate to appointments
//         break;
//       case QuickAction.emergency:
//         // Show emergency contacts
//         break;
//       case QuickAction.report:
//         // Generate health report
//         break;
//     }
//   }

//   void _showAddRecordModal() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return Container(
//           margin: const EdgeInsets.only(top: 50),
//           decoration: BoxDecoration(
//             color: AppColors.surface,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(AppLayout.borderRadiusLg),
//               topRight: Radius.circular(AppLayout.borderRadiusLg),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(AppLayout.paddingLarge),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 40,
//                     height: 4,
//                     decoration: BoxDecoration(
//                       color: AppColors.disabled.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: AppLayout.spacingLarge),
//                 AppText(
//                   text: 'Add Health Record',
//                   variant: TextVariant.titleLarge,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 const SizedBox(height: AppLayout.spacingMedium),
//                 _buildAddRecordOption(
//                   icon: Icons.medication,
//                   title: 'Add Medication',
//                   subtitle: 'Track new medication',
//                   onTap: () {
//                     Navigator.pop(context);
//                     // Navigate to add medication
//                   },
//                 ),
//                 _buildAddRecordOption(
//                   icon: Icons.calendar_today,
//                   title: 'Schedule Appointment',
//                   subtitle: 'Book doctor visit',
//                   onTap: () {
//                     Navigator.pop(context);
//                     // Navigate to schedule appointment
//                   },
//                 ),
//                 _buildAddRecordOption(
//                   icon: Icons.note_add,
//                   title: 'Add Medical Note',
//                   subtitle: 'Record symptoms or notes',
//                   onTap: () {
//                     Navigator.pop(context);
//                     // Navigate to add note
//                   },
//                 ),
//                 _buildAddRecordOption(
//                   icon: Icons.monitor_heart,
//                   title: 'Add Vital Signs',
//                   subtitle: 'Record BP, heart rate, etc.',
//                   onTap: () {
//                     Navigator.pop(context);
//                     // Navigate to add vitals
//                   },
//                 ),
//                 const SizedBox(height: AppLayout.spacingLarge),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildAddRecordOption({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       onTap: onTap,
//       leading: Container(
//         width: 48,
//         height: 48,
//         decoration: BoxDecoration(
//           color: AppColors.primary.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(AppLayout.borderRadiusMd),
//         ),
//         child: Icon(icon, color: AppColors.primary),
//       ),
//       title: AppText(
//         text: title,
//         variant: TextVariant.bodyLarge,
//         fontWeight: FontWeight.w500,
//       ),
//       subtitle: AppText(
//         text: subtitle,
//         variant: TextVariant.bodySmall,
//         color: AppColors.textSecondary,
//       ),
//       trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
//     );
//   }
// }

// class _HealthStatItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;

//   const _HealthStatItem({
//     required this.icon,
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(icon, size: 16, color: Colors.white.withOpacity(0.9)),
//             const SizedBox(width: 4),
//             AppText(
//               text: label,
//               variant: TextVariant.caption,
//               color: Colors.white.withOpacity(0.9),
//             ),
//           ],
//         ),
//         const SizedBox(height: 2),
//         AppText(
//           text: value,
//           variant: TextVariant.bodyMedium,
//           color: Colors.white,
//           fontWeight: FontWeight.w600,
//         ),
//       ],
//     );
//   }
// }

// class _SectionHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback? onViewAll;
//   final int count;

//   const _SectionHeader({
//     required this.title,
//     this.onViewAll,
//     this.count = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             AppText(
//               text: title,
//               variant: TextVariant.titleLarge,
//               fontWeight: FontWeight.bold,
//             ),
//             if (count > 0) ...[
//               const SizedBox(width: 8),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 8,
//                   vertical: 2,
//                 ),
//                 decoration: BoxDecoration(
//                   color: AppColors.primary.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: AppText(
//                   text: count.toString(),
//                   variant: TextVariant.caption,
//                   color: AppColors.primary,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ],
//         ),
//         if (onViewAll != null)
//           TextButton(
//             onPressed: onViewAll,
//             style: TextButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               minimumSize: const Size(0, 36),
//             ),
//             child: Row(
//               children: [
//                 AppText(
//                   text: 'View All',
//                   variant: TextVariant.buttonSmall,
//                   color: AppColors.primary,
//                 ),
//                 const SizedBox(width: 4),
//                 const Icon(Icons.chevron_right, size: 16, color: AppColors.primary),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }