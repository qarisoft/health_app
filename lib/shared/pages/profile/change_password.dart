import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog.dart';

import 'data/change_password_provider.dart';

class ChangePasswordDialog extends ConsumerStatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  ConsumerState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends ConsumerState<ChangePasswordDialog> {
  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) return;

    // Using the Riverpod generator provider from the previous step
    final success = await ref
        .read(changePasswordProvider.notifier)
        .submit(
          currentPassword: currentPasswordController.text,
          newPassword: newPasswordController.text,
          confirmPassword: confirmPasswordController.text,
        );

    if (!mounted) return;

    if (success) {
      AppDialog()
          .show(
            type: DialogType.success,
            title: context.tr.success,
            message: context.tr.passwordChangedSuccessfully,
          )
          .then((_) => context.mayPop());
    } else {
      final error = ref.read(changePasswordProvider).error;
      AppDialog().show(
        type: DialogType.error,
        title: context.tr.error,
        message: error?.toString() ?? context.tr.somethingWentWrong,
      );
    }
  }

  String? passwordValidator(String? v) {
    if (v == null || v.length < 8) {
      return context.tr.passwordTooShort;
    }

    return null;
  }

  String? passwordConfirmValidator(String? v) {
    if (v != newPasswordController.text ||
        v != confirmPasswordController.text) {
      return context.tr.passwordsDoNotMatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _DialogContent(
      formKey: formKey,
      currentPasswordController: currentPasswordController,
      newPasswordController: newPasswordController,
      confirmPasswordController: confirmPasswordController,
      onSubmit: onSubmit,
      passwordValidator: passwordValidator,
      passwordConfirmValidator: passwordConfirmValidator,
    );
  }
}

class _DialogContent extends ConsumerWidget {
  const _DialogContent({
    super.key,
    required this.formKey,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.onSubmit,
    required this.passwordValidator,
    required this.passwordConfirmValidator,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  final Function() onSubmit;
  final String? Function(String?) passwordValidator;
  final String? Function(String?) passwordConfirmValidator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(changePasswordProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min, // Keeps dialog compact
                children: [
                  // --- Header Icon & Title ---
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_reset_rounded,
                      size: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.tr.changePassword,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.tr.changePasswordInstruction,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // --- Form Fields ---
                  Column(
                    spacing: 16, // Requires Flutter 3.24+
                    children: [
                      CustomTextField(
                        isCompact: true,
                        controller: currentPasswordController,
                        labelText: context.tr.oldPassword,
                        obscureText: true,
                        showPasswordToggle: true,
                        validator: (v) =>
                            v!.isEmpty ? context.tr.fieldRequired : null,
                      ),
                      CustomTextField(
                        isCompact: true,
                        controller: newPasswordController,
                        labelText: context.tr.newPassword,
                        obscureText: true,
                        showPasswordToggle: true,
                        validator: passwordValidator,
                      ),
                      CustomTextField(
                        isCompact: true,
                        controller: confirmPasswordController,
                        labelText: context.tr.confirmPassword,
                        obscureText: true,
                        showPasswordToggle: true,
                        validator: passwordConfirmValidator,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // --- Action Buttons ---
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: authState.isLoading ? null : onSubmit,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: authState.isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : Text(
                              context.tr.updatePassword,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: authState.isLoading
                          ? null
                          : () => context.mayPop(),
                      child: Text(
                        context.tr.cancel,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
