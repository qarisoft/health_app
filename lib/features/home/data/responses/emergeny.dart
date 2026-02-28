// "emergencyInfo":{"fullName":"fdfdfdf fd df f d","bloodType":1,"allergies":["gfdsgfdg"],"chronicDiseases":["gfdgfdg"],"currentMedications":["dsfsdfdsf"],"emergencyContact":"fdsfsdf","emergencyPhone":"432423432",

// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/features/auth/data/responses/base/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'emergeny.g.dart';

@JsonSerializable(explicitToJson: true)
class EmergencyResponse extends BaseResponse {
  // final List<MedicalRecord>? medicalRecords;
  // final List<Prescription>? prescriptions;
  final String fullName;
  final String emergencyPhone;
  final String emergencyContact;
  final int bloodType;
  final List<String> allergies;
  final List<String> chronicDiseases;
  final List<String> currentMedications;

  EmergencyResponse({
    this.allergies = const [],
    required this.fullName,
    required this.emergencyPhone,
    required this.emergencyContact,
    required this.bloodType,
    this.chronicDiseases = const [],
    this.currentMedications = const [],
  });
  factory EmergencyResponse.fromJson(Map<String, dynamic> json) =>
      _$EmergencyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EmergencyResponseToJson(this);
}
