// import 'package:flutter/material.dart';
// import 'package:health_app/core/constants/_all.dart';
// import 'package:health_app/shared/ex.dart';

// class AppDialog {
//   static final AppDialog _instance = AppDialog._internal();
//   factory AppDialog() => _instance;
//   AppDialog._internal();

//   final List<OverlayEntry> _overlayEntries = [];
//   OverlayState? _overlayState;

//   static Container container(Widget child, {BoxConstraints? boxConstraints,double? borderRadius}) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(borderRadius??10),
//         color: AppColors.background,
//       ),
//       constraints: boxConstraints,
//       child: child,
//     );
//   }

//   static Widget container2(Widget child) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [AppDialog.container(child)],
//     );
//   }

//   static Widget contentContainer(BuildContext c, Widget child) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: c.w(10)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColors.background),
//               child:child,
//               // boxConstraints: BoxConstraints(
        
//                 // maxWidth: c.w(80),
//                 // maxHeight: c.h(40),
//               // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Initialize with BuildContext
//   void init(BuildContext context) {
//     _overlayState = Overlay.of(context);
//   }

//   /// Show a dialog using Overlay
//   void showDialog({
//     required WidgetBuilder builder,
//     bool barrierDismissible = true,
//     Color barrierColor = const Color(0x80000000),
//     String? barrierLabel,
//     bool useSafeArea = true,
//     bool useRootNavigator = true,
//     RouteSettings? routeSettings,
//   }) {
//     if (_overlayState == null) {
//       throw Exception(
//         'OverlayDialogService not initialized. Call init() first.',
//       );
//     }

//     // Create overlay entry
//     final overlayEntry = OverlayEntry(
//       builder: (context) => _DialogOverlay(
//         builder: builder,
//         barrierDismissible: barrierDismissible,
//         barrierColor: barrierColor,
//         onDismiss: () => dismiss(),
//         useSafeArea: useSafeArea,
//       ),
//     );

//     _overlayEntries.add(overlayEntry);
//     _overlayState!.insert(overlayEntry);
//   }

//   /// Dismiss the current dialog
//   void dismiss() {
//     if (_overlayEntries.isNotEmpty) {
//       final entry = _overlayEntries.removeLast();
//       entry.remove();
//     }
//   }

//   /// Dismiss all dialogs
//   void dismissAll() {
//     for (final entry in _overlayEntries) {
//       entry.remove();
//     }
//     _overlayEntries.clear();
//   }

//   /// Check if any dialog is shown
//   bool get isDialogShown => _overlayEntries.isNotEmpty;

//   /// Get the number of shown dialogs
//   int get dialogCount => _overlayEntries.length;
// }

// /// Private widget for the dialog overlay
// class _DialogOverlay extends StatelessWidget {
//   final WidgetBuilder builder;
//   final bool barrierDismissible;
//   final Color barrierColor;
//   final VoidCallback onDismiss;
//   final bool useSafeArea;

//   const _DialogOverlay({
//     required this.builder,
//     required this.barrierDismissible,
//     required this.barrierColor,
//     required this.onDismiss,
//     required this.useSafeArea,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget content = Material(
//       color: Colors.transparent,
//       child: Stack(
//         children: [
//           // Barrier
//           Positioned.fill(
//             child: GestureDetector(
//               onTap: barrierDismissible ? onDismiss : null,
//               child: Container(color: barrierColor),
//             ),
//           ),

//           // Dialog content
//           Center(
//             child: GestureDetector(
//               onTap: () {}, // Prevent tap from going through to barrier
//               child: builder(context),
//             ),
//           ),
//         ],
//       ),
//     );

//     if (useSafeArea) {
//       content = SafeArea(child: content);
//     }

//     return content;
//   }
// }
