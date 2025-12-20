import 'package:health_app/core/user/user.dart';
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';

class LoginUsecaseImpl extends LoginUsecase {
  @override
  Future<ErrorOr<AppAuthState>> login(params) async{

    return ErrorOr.succes(data:AppAuthState.patient(auth: PatientEntity()));
    // throw UnimplementedError();
  }
  
}