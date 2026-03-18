import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/functions.dart';
import 'package:health_app/shared/widgets/custom_text_field.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _key = GlobalKey<FormState>();

  String? _passwordValidator(String? s) {
    if (s == null || s.isEmpty) return context.tr.enterPassword;
    if (s != _newPassword.text || s != _confirmPassword.text) {
      return context.tr.passwordsDoNotMatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          title: Text('change Password '),

          content: Form(
            key: _key,
            child: Column(
              spacing: 10,
              children: [
                CustomTextField(
                  controller: _currentPassword,
                  labelText: context.tr.oldPassword,
                  validator: notEmptyValidator,
                  obscureText: true,
                  showPasswordToggle: true,
                ),

                CustomTextField(
                  controller: _newPassword,
                  labelText: context.tr.newPassword,
                  validator: _passwordValidator,
                  obscureText: true,
                  showPasswordToggle: true,
                ),
                CustomTextField(
                  controller: _confirmPassword,
                  labelText: context.tr.passwordConfirmation,
                  validator: _passwordValidator,
                  obscureText: true,
                  showPasswordToggle: true,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(onPressed: _submit, child: Text(context.tr.confirm)),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: context.mayPop,
                child: Text(context.tr.cancel),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<bool> _goBack() => context.mayPop();

  Future<void> _submit() async {
    if (_key.currentState!.validate()) {
      AppDialog().loading();
      final res = await getDio.post(
        '/auth/change-password',
        data: {
          'currentPassword': _currentPassword.text,
          'newPassword': _newPassword.text,
          'confirmNewPassword': _confirmPassword.text,
        },
      );
      AppDialog().dismiss();
      final response = GeneralResponse.fromJson(res.data);
      if (response.wasSuccesfull) {
        AppDialog()
            .show(
              type: DialogType.success,
              title: 'Success',
              message: response.message,
            )
            .whenComplete(() {
              _confirmPassword.clear();
              _currentPassword.clear();
              _newPassword.clear();
              _goBack();
            });
      } else {
        AppDialog().show(
          type: DialogType.error,
          title: 'Error',
          message: response.message,
        );
      }

      xlog(res);
    }
  }
}
