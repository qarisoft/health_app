import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class PharmacistProfileRequestData with _$PharmacistProfileRequestData {
  factory PharmacistProfileRequestData({
    required String fullName,
    required String phoneNumber,
    required String email,
    required String pharmacyName,
    required String licenseNumber,
  }) = _PharmacistProfileRequestData;

  factory PharmacistProfileRequestData.fromJson(Map<String, dynamic> json) =>
      _$PharmacistProfileRequestDataFromJson(json);
}


