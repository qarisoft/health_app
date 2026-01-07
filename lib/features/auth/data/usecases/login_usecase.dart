import 'package:dio/dio.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/user/user.dart';
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';

class LoginUsecaseImpl extends LoginUsecase {
  final Dio dio;

  LoginUsecaseImpl(this.dio);
  @override
  Future<ErrorOr<AppAuthState>> login(params) async {
    await Future.delayed(Duration(seconds: 2));

    final res = await dio.post(
      K.loginUrl,
      data: {
        'identifier': params.idCardNumber,
        'password': params.password,
        
      },
    );

    final data = res.data as Map<String, dynamic>;

    final response = LoginResponse.fromJson(data);

    if (response.success ) {
      return ErrorOr.success(
        data: switch (params.userType) {
          UserType.initial => throw UnimplementedError(),
          UserType.patient => AppAuthState.patient(
            auth: PatientEntity(name: data['name']),
          ),
          // TODO: Handle this case.
          UserType.doctor => throw UnimplementedError(),
          // TODO: Handle this case.
          UserType.pharmacist => throw UnimplementedError(),
          // TODO: Handle this case.
          UserType.admin => throw UnimplementedError(),
        },
      );
    }

    return ErrorOr.error(error: ServerError(msg: response.message ?? 'errrrr'));
    // throw UnimplementedError();
  }
}
