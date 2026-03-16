import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/shared/ex.dart' show AppEx;

class ReturnButton extends ConsumerWidget {
  const ReturnButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.invalidate(accountProvider);
        context.mayPop();
      },
      icon: Icon(Icons.arrow_back),
    );
  }
}
