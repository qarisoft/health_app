import 'package:freezed_annotation/freezed_annotation.dart';
part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
abstract class DoctorRegisterRequest with _$DoctorRegisterRequest {
  //   "nationalId": "string",
  // "password": "string",
  // "confirmPassword": "string",
  // "fullName": "string",
  // "email": "string",
  // "phoneNumber": "string",
  // "licenseNumber": "string",
  // "specialization": "string",
  // "hospital": "string"
  // "licenseDocumentUrl": "string",
  const factory DoctorRegisterRequest({
    required String nationalId,
    required String password,
    required String confirmPassword,
    required String fullName,
    required String dateOfBirth,
    required String phoneNumber,
    required String email,
    required String licenseNumber,
    required String specialization,
    required String hospital,
    required String licenseDocumentUrl,
  }) = _DoctorRegisterRequest;

  factory DoctorRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$DoctorRegisterRequestFromJson(json);
}
