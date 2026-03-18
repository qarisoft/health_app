import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
abstract class ProfileAccount with _$ProfileAccount {
  const factory ProfileAccount({
    required int userId,
    required String fullName,
    required String email,
    required String address,
  }) = _ProfileAccount;

  factory ProfileAccount.fromJson(Map<String, dynamic> json) =>
      _$ProfileAccountFromJson(json);
}
