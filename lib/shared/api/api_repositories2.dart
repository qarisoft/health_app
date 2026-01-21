// import 'package:flutter/widgets.dart';
// import 'package:health_app/core/error/app_error.dart' show ErrorOr, ServerError;
// import 'package:health_app/core/services/storage.dart';
// import 'package:health_app/features/auth/data/responses/user/user_response.dart'
//     show LoginResponse, PatientProfileResponse;
// import 'package:health_app/features/auth/domain/models/account.dart'
//     show PatientAccount;
// import 'package:health_app/features/auth/domain/models/auth_state.dart'
//     show AuthRecord;
// import 'package:health_app/features/auth/data/responses/user/user_response.dart';
// import 'package:health_app/features/auth/domain/models/auth_state.dart';
// import 'package:health_app/features/auth/domain/models/patient.dart';
// import 'package:health_app/features/auth/domain/usecases/register_usecase.dart';
// import 'package:health_app/shared/api/api_service.dart';

// class AppRepositories {
//   final ApiService api;
//   final AppStorage storage;
//   AppRepositories({required this.api, required this.storage});

//   Future<ErrorOr<AuthRecord>> login({
//     required String identifier,
//     required String password,
//   }) async {
//     try {
//       final res = await api.login(identifier, password);
//       // return
//       final response = LoginResponse.fromJson(res);
//       if (response.success) {
//         await _getProfile(response.role ?? 'patient');
//         return ErrorOr.success(
//           data: AuthRecord(
//             accessToken: response.accessToken ?? '',
//             role: response.role ?? '',
//             userId: response.userId ?? 0,
//           ),
//         );
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return ErrorOr.error(error: ServerError(msg: 'Unkown Error'));
//   }

//   Future<void> _getProfile(String rol) async {
//     final role = rol.toLowerCase();
//     if (role == 'patient') {
//       await _getPatientProfile();
//     }
//   }

//   Future<void> _getPatientProfile() async {
//     try {
//       final json = await api.getPatientProfile();
//       final res = PatientProfileResponse.fromJson(json);
//       if (res.success && res.patient != null) {
//         final patient = res.patient;

//         if (patient != null) {

//           final patientAccount = PatientAccount(patient: Patient.fromJson(patient.toJson()));
//           storage.setPatientAccount(patientAccount);
//         }
//       }
//     } catch (e) {}
//   }
// }
