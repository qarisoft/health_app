// import 'package:health_app/di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../di.dart' show di, appStorage;
import 'api/dio_factory.dart'; // Ensure this points to where your 'di' is located

part 'server_health_provider.freezed.dart';
part 'server_health_provider.g.dart';

// @riverpod
// Future<bool> serverHealth(Ref ref) async {
//   final dioFactory = di<DioFactory>();
//   return await dioFactory.isServerAlive();
//   // return ;
// }

@freezed
abstract class ServerHealthState with _$ServerHealthState {
  const factory ServerHealthState.loading() = LoadingServerState;

  const factory ServerHealthState.alive() = LiveServerState;

  const factory ServerHealthState.noApiUrl() = NoApiServerState;

  const factory ServerHealthState.error({required String msg}) =
      ErrorServerState;
}

@riverpod
class ServerHealth extends _$ServerHealth {
  @override
  ServerHealthState build() {
    // Perform an initial check when the app starts
    // ref.cacheTheState(forever: true);
    // final a =
    final a = appStorage.getString(apiUrlKey);
    // xlog('url is $a');
    if (a == null || a.isEmpty) {
      return ServerHealthState.noApiUrl();
    }
    _pingServer();
    // return a;
    return ServerHealthState.loading();
  }

  Future<void> _pingServer() async {
    final a = appStorage.getString(apiUrlKey);
    // xlog('url is $a');
    if (a == null || a.isEmpty) {
      state = ServerHealthState.noApiUrl();
      return;
    }
    // Access your DioFactory via your dependency injection setup
    final dioFactory = di<DioFactory>();
    try {
      final res = await dioFactory.isServerAlive();
      if (res) {
        state = ServerHealthState.alive();
      } else {
        state = ServerHealthState.error(msg: 'Server is down');
      }
    } catch (e) {
      state = ServerHealthState.error(msg: e.toString());
    }
  }

  /// Call this method to manually trigger a re-check (e.g., on a pull-to-refresh)
  void checkHealth() {
    // Optional: Only set to loading if you want the UI to show a spinner during manual checks
    state = ServerHealthState.loading();

    // final isAlive =
    _pingServer();
    // state = AsyncData(isAlive);
  }
}
