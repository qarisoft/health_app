import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class IsDarkTheme extends _$IsDarkTheme {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
