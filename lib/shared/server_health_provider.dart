// import 'package:health_app/di.dart';
import 'package:health_app/shared/ex.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../di.dart' show di;
import 'api/dio_factory.dart'; // Ensure this points to where your 'di' is located

part 'server_health_provider.g.dart';

// @riverpod
// Future<bool> serverHealth(Ref ref) async {
//   final dioFactory = di<DioFactory>();
//   return await dioFactory.isServerAlive();
//   // return ;
// }

@riverpod
class ServerHealth extends _$ServerHealth {
  @override
  FutureOr<bool> build() async {
    // Perform an initial check when the app starts
    ref.cacheTheState(forever: true);
    final a = await _pingServer();
    return a;
  }

  Future<bool> _pingServer() async {
    // Access your DioFactory via your dependency injection setup
    final dioFactory = di<DioFactory>();
    return await dioFactory.isServerAlive();
  }

  /// Call this method to manually trigger a re-check (e.g., on a pull-to-refresh)
  Future<void> checkHealth() async {
    // Optional: Only set to loading if you want the UI to show a spinner during manual checks
    state = const AsyncLoading();

    final isAlive = await _pingServer();
    state = AsyncData(isAlive);
  }
}
