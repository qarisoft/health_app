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
    extends $NotifierProvider<ServerHealth, ServerHealthState> {
  const ServerHealthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverHealthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverHealthHash();

  @$internal
  @override
  ServerHealth create() => ServerHealth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerHealthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerHealthState>(value),
    );
  }
}

String _$serverHealthHash() => r'ba8c4a5bc9aedadd076d3b564e478cd3d620035a';

abstract class _$ServerHealth extends $Notifier<ServerHealthState> {
  ServerHealthState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ServerHealthState, ServerHealthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ServerHealthState, ServerHealthState>,
              ServerHealthState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
