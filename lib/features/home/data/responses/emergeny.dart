// "emergencyInfo":{"fullName":"fdfdfdf fd df f d","bloodType":1,"allergies":["gfdsgfdg"],"chronicDiseases":["gfdgfdg"],"currentMedications":["dsfsdfdsf"],"emergencyContact":"fdsfsdf","emergencyPhone":"432423432",

// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/features/auth/data/responses/base/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'emergeny.g.dart';

@JsonSerializable(explicitToJson: true)
class EmergencyResponse {
  // final List<MedicalRecord>? medicalRecords;
  // final List<Prescription>? prescriptions;
  final String? fullName;
  final String? emergencyPhone;
  final String? emergencyContact;
  final String? qrCodeUrl;
  final int? bloodType;
  final List<String>? allergies;
  final List<String>? chronicDiseases;
  final List<String>? currentMedications;

  EmergencyResponse({
    this.allergies = const [],
    this.fullName,
    this.emergencyPhone,
    this.emergencyContact,
    this.bloodType,
    this.chronicDiseases = const [],
    this.currentMedications = const [], this.qrCodeUrl,

  });
  factory EmergencyResponse.fromJson(Map<String, dynamic> json) =>
      _$EmergencyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EmergencyResponseToJson(this);
}

extension Em on EmergencyResponse{
  String bloodTypeString(){
    final List<String> bloodTypes = [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-',
    ];
    final int b = bloodType??0;
    // if(bloodType==)
    return bloodTypes[b];
  }
}

@JsonSerializable(explicitToJson: true)
class EmergencyPageResponse extends BaseResponse {
  final EmergencyResponse emergencyInfo;

  EmergencyPageResponse({
    super.success,
    super.message,
    required this.emergencyInfo,
  });

  factory EmergencyPageResponse.fromJson(Map<String, dynamic> json) =>
      _$EmergencyPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyPageResponseToJson(this);
}
