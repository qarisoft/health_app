// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_health_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServerHealth)
const serverHealthProvider = ServerHealthProvider._();

final class ServerHealthProvider
    extends $AsyncNotifierProvider<ServerHealth, bool> {
  const ServerHealthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverHealthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverHealthHash();

  @$internal
  @override
  ServerHealth create() => ServerHealth();
}

String _$serverHealthHash() => r'e41e06ddedc58d35f0606ad643c6511ecae134e9';

abstract class _$ServerHealth extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
