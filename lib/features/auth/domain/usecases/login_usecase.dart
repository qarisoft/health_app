import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/error/app_error.dart';
export 'package:health_app/core/error/app_error.dart';
// import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/core/user/user.dart';



class LoginParams {
  final UserType userType;
  final String phoneNumber;
  final String password;

  LoginParams({required this.userType, required this.phoneNumber, required this.password});
}
abstract class LoginUsecase {
  Future<ErrorOr<AppAuthState>> login(LoginParams params);
}