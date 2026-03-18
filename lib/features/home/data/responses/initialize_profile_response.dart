import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/features/auth/data/responses/base/base_response.dart';

part 'initialize_profile_response.g.dart';

@JsonSerializable()
class InitializeProfileResponse extends BaseResponse {
  final int? patientId;

  InitializeProfileResponse({super.success, super.message, this.patientId});

  factory InitializeProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$InitializeProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InitializeProfileResponseToJson(this);
}
