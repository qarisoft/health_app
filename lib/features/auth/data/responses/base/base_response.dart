// import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BaseResponse {
  final bool? success;
  final String? message;
  // final List<String>? errors;

  BaseResponse({this.success = false, this.message = ''});
}

@JsonSerializable()
class GeneralStatusResponse extends BaseResponse {
  GeneralStatusResponse({super.message, super.success});
  factory GeneralStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralStatusResponseFromJson(json);
}

abstract class Profile {
  final int id;
  final int userId;
  final String fullName;

  final String phoneNumber;
  final String email;
  final String createdAt;
  final String updatedAt;

  Profile({
    this.id = 0,
    this.userId = 0,

    this.fullName = 'null',
    this.phoneNumber = 'null',
    this.email = 'null',
    this.createdAt = 'null',
    this.updatedAt = 'null',
  });
}
