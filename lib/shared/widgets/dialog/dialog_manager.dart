// import 'package:flutter/material.dart';
// import 'package:health_app/shared/widgets/dialog/app_dialog.dart' show AppDialog;

// class DialogManager extends StatefulWidget {
//   final Widget child;
//   final GlobalKey<NavigatorState>? navigatorKey;

//   const DialogManager({
//     super.key,
//     required this.child,
//     this.navigatorKey,
//   });

//   @override
//   State<DialogManager> createState() => _DialogManagerState();

//   static void show({
//     required BuildContext context,
//     required WidgetBuilder builder,
//     bool barrierDismissible = true,
//     Color barrierColor = const Color(0x80000000),
//   }) {
//     AppDialog().init(context);
//     AppDialog().showDialog(
//       builder: builder,
//       barrierDismissible: barrierDismissible,
//       barrierColor: barrierColor,
//     );
//   }

//   static void dismiss() {
//     AppDialog().dismiss();
//   }
// }

// class _DialogManagerState extends State<DialogManager> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       AppDialog().init(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }