import 'package:health_app/features/auth/data/responses/base/base_response.dart';
import 'package:health_app/features/pharmacist/domain/models/prescription.dart';
import 'package:json_annotation/json_annotation.dart';
part 'prescription.g.dart';

@JsonSerializable()
class PrescriptionsResponse extends BaseResponse {
  final List<Prescription> prescriptions;

  PrescriptionsResponse({
    required super.success,
    super.message,
    this.prescriptions = const [],
  });

  factory PrescriptionsResponse.fromJson(Map<String, dynamic> json) {
    return _$PrescriptionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson()=>_$PrescriptionsResponseToJson(this);
}
