import 'package:freezed_annotation/freezed_annotation.dart';
part 'pharmacist.freezed.dart';
part 'pharmacist.g.dart';

@freezed
abstract class PharmacistRegisterRequest with _$PharmacistRegisterRequest {
  const factory PharmacistRegisterRequest({
    required String nationalId,
    required String password,
    required String confirmPassword,
    required String fullName,
    required DateTime dateOfBirth,
    required String phoneNumber,
    required String email,
    required String licenseNumber,
    required String pharmacyName,
    required String licenseDocumentUrl,
  }) = _PharmacistRegisterRequest;

  factory PharmacistRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$PharmacistRegisterRequestFromJson(json);
}
