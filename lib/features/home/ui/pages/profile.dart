// profile_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';

import '../../../../shared/ex.dart';
import '../../../../shared/pages/profile/profile_page.dart'
    show ProfilePageBuilder, ProfileAccount;
import 'initialize_profile/page2.dart' show InitializeProfilePage2;

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(allAcountsProvider.select((s) => s.patient));
    xlog(auth);
    if (auth == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final patient = auth.patient;
    return ProfilePageBuilder(
      account: ProfileAccount(
        userId: patient.userId,
        fullName: patient.fullName,
        email: patient.email,
        address: patient.address,
      ),
      onEditProfile: () {
        context.to(
          InitializeProfilePage2(
            onBackPressed: () {
              ref.invalidateAllAuthProviders();
              // context.pop();
            },
          ),
        );
      },
    );
  }
}

// void _navigateToEditProfile() {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => InitializedProfilePage2(
//         onBackPressed: () {
//           context.pop();
//         },
//       ),
//     ),
//   );
// }
