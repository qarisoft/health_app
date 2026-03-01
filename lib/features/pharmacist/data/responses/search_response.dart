import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/features/auth/data/responses/base/base_response.dart';
import 'package:health_app/features/pharmacist/data/providers/create_rescription.dart';
part 'search_response.g.dart';

@JsonSerializable()
class PatientSearchResponse extends BaseResponse {
  final List<IdName> patients;

  PatientSearchResponse({
    super.success,
    super.message,
    this.patients = const [],
  });
  factory PatientSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientSearchResponseFromJson(json);
}

@JsonSerializable()
class DoctorSearchResponse extends BaseResponse {
  final List<IdName> doctors;

  DoctorSearchResponse({super.success, super.message, this.doctors = const []});
  factory DoctorSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorSearchResponseFromJson(json);
}
