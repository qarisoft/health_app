import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth_state.dart';
import '../../features/auth/domain/models/account.dart';
import '../ex.dart';

class AppBarReturnButton extends StatelessWidget {
  const AppBarReturnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isLoggedInAsPatient =
            ref.watch(accountProvider).whenOrNull(account: (_, a) => a) ??
            false;

        return isLoggedInAsPatient
            ? IconButton(
                onPressed: () {
                  ref.invalidateAllAuthProviders();
                },
                icon: Icon(Icons.arrow_back, color: Colors.black),
              )
            : SizedBox();
      },
    );
  }
}
