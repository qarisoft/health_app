// // import 'package:health_app/core/user/user.dart';
// // import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
// import 'package:dio/dio.dart';
// import 'package:health_app/core/constants/k.dart';
// import 'package:health_app/core/services/storage.dart';
// import 'package:health_app/core/user/user.dart';
// import 'package:health_app/features/auth/data/responses/user/user_response.dart';
// import 'package:health_app/features/auth/domain/usecases/register_usecase.dart';
// import 'package:health_app/shared/ex.dart';

// class RegisterUsecaseImpl extends RegisterUsecase {
//   // RegisterParams
//   final Dio dio;
//   final AppStorage storage;

//   RegisterUsecaseImpl({required this.dio, required this.storage});

//   @override
//   Future<ErrorOr<AppAuthState>> register(params) async {
//     // await Future.delayed(Duration(seconds: 2));
//     try {
//       final res = await dio.post(
//         K.registerUrl,
//         data: {
//           'id_card_number': params.idCardNumber,
//           'password': params.password,
//           'password_confirmation': params.passwordConfirmation,
//           'name': params.name,
//           'user_type': params.userType.valueForApi(),
//         },
//       );
//       final response = LoginResponse.fromJson(res.data);
//       if (response.success != null && response.success == 1) {
//         final auth = AppAuthState.patient(
//           auth: PatientEntity(
//             name: params.name,
//             idCardNumber: response.user?.idCardNumber ?? '',
//             phoneNumber: response.user?.phoneNumber ?? '',
//             isActive: true,
//           ),
//         );
//         // 
//         storage.setAppAuthState(auth);

//         return ErrorOr.succes(
//           data: switch (params.userType) {
//             UserType.initial => throw UnimplementedError(),
//             UserType.patient => AppAuthState.patient(
//               auth: PatientEntity(
//                 name: params.name,
//                 phoneNumber: response.user?.idCardNumber ?? '',
//               ),
//             ),
//             UserType.doctor => throw UnimplementedError(),
//             UserType.pharmacist => throw UnimplementedError(),
//             UserType.admin => throw UnimplementedError(),
//           },
//         );
//       }
//     } on DioException catch (e) {
//       return ErrorOr.error(
//         error: ServerError(msg: e.message ?? 'unkown error'),
//       );
//     } catch (e) {
//       // return ErrorOr.succes(data:AppAuthState.patient(auth: PatientEntity()));
//     }
//     return ErrorOr.error(error: ServerError(msg: 'unkown error'));
//     // throw UnimplementedError();
//   }
// }
