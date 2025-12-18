// ignore_for_file: invalid_annotation_target

// import 'dart:ui' show Locale;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_provider.freezed.dart';
part 'local_provider.g.dart';

@freezed
abstract class LocalState with _$LocalState {
  @JsonSerializable()
  const factory LocalState({required String code, required bool isRtl}) =
      _LocalState;

  factory LocalState.fromJson(Map<String, dynamic> json) =>
      _$LocalStateFromJson(json);

  factory LocalState.ar() => LocalState(code: 'ar', isRtl: true); 
  factory LocalState.en() => LocalState(code: 'en', isRtl: false); 
}

// extension on LocalState {
//   Locale locale() {
//     return Locale(code);
//   }
// }

@riverpod
class Local extends _$Local {
  @override
  LocalState build() {
    return LocalState.ar();
  }

  void toggole() {
    if (state.isRtl) {
      state = LocalState.ar();
    }else{
      state = LocalState.en();

    }
  }
}
