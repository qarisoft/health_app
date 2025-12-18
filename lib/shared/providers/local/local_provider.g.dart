// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalState _$LocalStateFromJson(Map<String, dynamic> json) =>
    _LocalState(code: json['code'] as String, isRtl: json['isRtl'] as bool);

Map<String, dynamic> _$LocalStateToJson(_LocalState instance) =>
    <String, dynamic>{'code': instance.code, 'isRtl': instance.isRtl};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Local)
const localProvider = LocalProvider._();

final class LocalProvider extends $NotifierProvider<Local, LocalState> {
  const LocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localHash();

  @$internal
  @override
  Local create() => Local();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalState>(value),
    );
  }
}

String _$localHash() => r'569d5e0fdd279852bf696f2feab315d10eb4f581';

abstract class _$Local extends $Notifier<LocalState> {
  LocalState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LocalState, LocalState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LocalState, LocalState>,
              LocalState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
