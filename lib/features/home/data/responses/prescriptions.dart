import 'package:json_annotation/json_annotation.dart';

import '../../../auth/data/responses/base/base_response.dart';
import '../../../pharmacist/domain/models/prescription.dart';

part 'prescriptions.g.dart';

@JsonSerializable()
class PrescriptionsResponse extends BaseResponse {
  final List<Prescription> prescriptions;

  PrescriptionsResponse(
    this.prescriptions, {
    super.success = false,
    super.message,
    // this.prescriptions = const [],
  });

  factory PrescriptionsResponse.fromJson(Map<String, dynamic> json) {
    return _$PrescriptionsResponseFromJson({'prescriptions': json});
  }
  factory PrescriptionsResponse.fromApi(List< dynamic> json) {
    return _$PrescriptionsResponseFromJson({'prescriptions': json});
  }

  Map<String, dynamic> toJson() => _$PrescriptionsResponseToJson(this);
}
