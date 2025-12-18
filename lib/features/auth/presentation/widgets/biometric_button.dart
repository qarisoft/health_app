import 'package:flutter/material.dart';
import 'package:health_app/shared/ex.dart' show AppEx;
import 'package:local_auth/local_auth.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_layout.dart';

class BiometricButton {
  static Future<bool> authenticate({
    required BuildContext context,
    required String localizedReason,
  }) async {
    try {
      final LocalAuthentication auth = LocalAuthentication();
      final bool canAuthenticate = await auth.canCheckBiometrics;

      if (!canAuthenticate) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Biometric authentication not available')),
        );
        return false;
      }

      final bool didAuthenticate = await auth.authenticate(
        localizedReason: localizedReason,
        // options: const AuthenticationOptions(
        //   biometricOnly: true,
        //   stickyAuth: true,
        // ),
      );

      return didAuthenticate;
    } catch (e) {
      return false;
    }
  }
}

class BiometricButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BiometricButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // final localizations = context.tr;

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.fingerprint, size: AppLayout.iconSizeLarge),
      label: Text(context.tr.useFingerprint),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        minimumSize: const Size(double.infinity, AppLayout.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        ),
      ),
    );
  }
}