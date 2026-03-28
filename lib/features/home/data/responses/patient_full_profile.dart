import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/features/auth/data/responses/base/base_response.dart';

import '../../models/models.dart';

// part 'patient_full_profile.freezed.dart';

part 'patient_full_profile.g.dart';

@JsonSerializable()
class PatientProfile {
  final int id;
  final int userId;
  final String fullName;
  final String dateOfBirth;
  final int gender;
  final String phoneNumber;
  final String email;
  final String address;
  final int bloodType;
  final int weight;
  final int height;
  final String emergencyContact;
  final String emergencyPhone;
  final String createdAt;
  final String updatedAt;

  PatientProfile({
    this.id = 0,
    this.userId = 0,
    this.fullName = '',
    this.dateOfBirth = '',
    this.gender = 0,
    this.phoneNumber = '',
    this.email = '',
    this.address = '',
    this.bloodType = 0,
    this.weight = 0,
    this.height = 0,
    this.emergencyContact = '',
    this.emergencyPhone = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory PatientProfile.fromJson(Map<String, dynamic> json) =>
      _$PatientProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PatientProfileToJson(this);
}

@JsonSerializable()
class PatientFullProfile extends BaseResponse {
  final PatientProfile patient;

  PatientFullProfile({
    super.success,
    super.message,
    required this.patient,

    this.allergies = const [],
    this.surgeries = const [],
    this.chronicDiseases = const [],
    this.currentMedications = const [],
  });

  final List<Allergy> allergies;
  final List<Surgery> surgeries;
  final List<ChronicDisease> chronicDiseases;
  final List<CurrentMedication> currentMedications;

  factory PatientFullProfile.fromJson(Map<String, dynamic> json) =>
      _$PatientFullProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PatientFullProfileToJson(this);
}
