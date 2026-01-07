import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient.freezed.dart';
part 'patient.g.dart';
@freezed
abstract class PatientRegisterRequest with _$PatientRegisterRequest {
  // "nationalId": "string",
  // "password": "string",
  // "confirmPassword": "string",
  // "fullName": "string",
  // "dateOfBirth": "2025-12-16T19:31:36.871Z",
  // "phoneNumber": "string",
  // "email": "string"
  const factory PatientRegisterRequest({
    required String nationalId,
    required String password,
    required String confirmPassword,
    required String fullName,
    required String dateOfBirth,
    required String phoneNumber,
    required String email,
  }) = _PatientRegisterRequest;

  factory PatientRegisterRequest.fromJson(Map<String, dynamic> json) => _$PatientRegisterRequestFromJson(json);
}