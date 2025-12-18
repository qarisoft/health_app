// import 'package:flutter/material.dart';
// import 'package:health_app/core/constants/text_variant.dart' show TextVariant;
// import 'package:intl/intl.dart';
// import 'package:health_app/shared/widgets/app_text.dart';
// import 'package:health_app/core/constants/app_colors.dart';
// import 'package:health_app/core/constants/app_layout.dart';
// // import 'package:health_app/core/enums/text_variant.dart';
// // import 'package:health_app/features/home/domain/models/doctor_appointment.dart';

// class DoctorVisitsCard extends StatelessWidget {
//   final List<DoctorAppointment> appointments;

//   const DoctorVisitsCard({super.key, required this.appointments});

//   @override
//   Widget build(BuildContext context) {
//     if (appointments.isEmpty) {
//       return _buildEmptyState();
//     }

//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(AppLayout.borderRadiusLarge),
//         border: Border.all(color: AppColors.disabled.withOpacity(0.2)),
//       ),
//       child: Column(
//         children: [
//           ...appointments.map((appointment) => _AppointmentTile(appointment: appointment)),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Container(
//       padding: const EdgeInsets.all(AppLayout.paddingLarge),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(AppLayout.borderRadiusLarge),
//         border: Border.all(color: AppColors.disabled.withOpacity(0.2)),
//       ),
//       child: Column(
//         children: [
//           Icon(
//             Icons.calendar_today,
//             size: 48,
//             color: AppColors.disabled.withOpacity(0.5),
//           ),
//           const SizedBox(height: AppLayout.spacingMedium),
//           AppText(
//             text: 'No appointments scheduled',
//             variant: TextVariant.bodyMedium,
//             color: AppColors.textSecondary,
//           ),
//           const SizedBox(height: AppLayout.spacingSmall),
//           TextButton(
//             onPressed: () {
//               // Schedule appointment
//             },
//             child: AppText(
//               text: 'Schedule Now',
//               variant: TextVariant.buttonSmall,
//               color: AppColors.primary,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _AppointmentTile extends StatelessWidget {
//   final DoctorAppointment appointment;

//   const _AppointmentTile({required this.appointment});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(AppLayout.paddingMedium),
//       child: Row(
//         children: [
//           Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               color: AppColors.primary.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(AppLayout.borderRadiusMd),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AppText(
//                   text: DateFormat('dd').format(appointment.dateTime),
//                   variant: TextVariant.titleMedium,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primary,
//                 ),
//                 AppText(
//                   text: DateFormat('MMM').format(appointment.dateTime),
//                   variant: TextVariant.caption,
//                   color: AppColors.primary,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: AppLayout.spacingMedium),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppText(
//                   text: appointment.doctorName,
//                   variant: TextVariant.bodyLarge,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 const SizedBox(height: 2),
//                 AppText(
//                   text: appointment.specialization,
//                   variant: TextVariant.caption,
//                   color: AppColors.textSecondary,
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.access_time,
//                       size: 14,
//                       color: AppColors.textSecondary,
//                     ),
//                     const SizedBox(width: 4),
//                     AppText(
//                       text: DateFormat('h:mm a').format(appointment.dateTime),
//                       variant: TextVariant.caption,
//                       color: AppColors.textSecondary,
//                     ),
//                     const SizedBox(width: 12),
//                     Icon(
//                       Icons.location_on,
//                       size: 14,
//                       color: AppColors.textSecondary,
//                     ),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: AppText(
//                         text: appointment.location,
//                         variant: TextVariant.caption,
//                         color: AppColors.textSecondary,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               // View details or edit
//             },
//             icon: const Icon(Icons.chevron_right),
//             color: AppColors.textSecondary,
//           ),
//         ],
//       ),
//     );
//   }
// }