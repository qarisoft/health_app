import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
abstract class AuthRecord with _$AuthRecord {
  factory AuthRecord({
    required String accessToken,
    required String role,
    required int userId,
  }) = _AuthRecord;

  factory AuthRecord.fromJson(Map<String, dynamic> json) =>
      _$AuthRecordFromJson(json);
}



@freezed
class AuthRecordData with _$AuthRecordData {

  factory AuthRecordData.initial() = InitialAuthRecordData;
  factory AuthRecordData.auth({required AuthRecord record}) = TAuthRecordData;

}
// extension AuthMapper on 
