import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/functions.dart' show BloodType;

// import 'package:health_app/features/patients/domain/models/medical_history.dart';

part 'home.freezed.dart';
part 'home.g.dart';

@freezed
abstract class RecentPatient with _$RecentPatient {
  factory RecentPatient({
    @Default(0) int patientId,
    @Default('full name') String fullName,
    @Default('patientCode') String patientCode,
    DateTime? lastInteractionDate,
    String? lastInteractionType,
  }) = _RecentPatient;

  factory RecentPatient.fromJson(Map<String, dynamic> json) =>
      _$RecentPatientFromJson(json);
}

extension Asss on RecentPatient {
  bool get isAvtive => patientId == 1;

  bool get isActive => patientId == 1;

  String get nationalId => patientId.toString();

  String get id => patientId.toString();

  String get gender => 'dsa';

  String get name => fullName;

  String get email => fullName;

  String get address => fullName;

  BloodType get bloodType => BloodType.aNegative;

  // String get email => fullName;
  // String get nationalId => patientId;
  String get phoneNumber => fullName;
  // _nameController.text = widget.patient!.name;
  //     _phoneController.text = widget.patient!.phoneNumber;
  //     _nationalIdController.text = widget.patient!.nationalId;
  //     _emailController.text = widget.patient!.email ?? '';
  //     _addressController.text = widget.patient!.address ?? '';
  //     _emergencyController.text = widget.patient!.emergencyContact ?? '';
  //     _notesController.text = widget.patient!.notes ?? '';
  //     _selectedGender = widget.patient!.gender;
  //     _selectedBloodType = widget.patient!.bloodType;
  //     _selectedDate = widget.patient!.dateOfBirth;
  //     _isActive = widget.patient!.isActive;
}

@freezed
abstract class HomeResponse with _$HomeResponse {
  factory HomeResponse(List<RecentPatient> data) = _HomeResponse;

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  // factory HomeResponse.fromApi(Map<String, dynamic> json) =>
  // HomeResponse(json.map());
}
