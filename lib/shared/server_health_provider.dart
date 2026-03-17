import 'package:health_app/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api/dio_factory.dart'; // Ensure this points to where your 'di' is located

part 'server_health_provider.g.dart';

@Riverpod(
  keepAlive: true,
) // keepAlive: true ensures this state lives as long as the app runs
class ServerHealth extends _$ServerHealth {
  @override
  FutureOr<bool> build() async {
    // Perform an initial check when the app starts
    return await _pingServer();
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
