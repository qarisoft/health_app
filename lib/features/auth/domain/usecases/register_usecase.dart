import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/error/app_error.dart';
export 'package:health_app/core/error/app_error.dart';
// import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/core/user/user.dart';

class RegisterParams {
  final UserType userType;
  final String? phoneNumber;
  final String? email;
  final String password;
  final String passwordConfirmation;
  final String name;
  final String idCardNumber;

  RegisterParams({
    required this.userType,
    this.phoneNumber,
    required this.password,
    this.email,
    required this.passwordConfirmation,
    required this.name,
    required this.idCardNumber,
  });
}

abstract class RegisterUsecase {
  Future<ErrorOr<AppAuthState>> register(RegisterParams params);
}
