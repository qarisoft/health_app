// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalState implements DiagnosticableTreeMixin {

 String get code; bool get isRtl;
/// Create a copy of LocalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalStateCopyWith<LocalState> get copyWith => _$LocalStateCopyWithImpl<LocalState>(this as LocalState, _$identity);

  /// Serializes this LocalState to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LocalState'))
    ..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('isRtl', isRtl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalState&&(identical(other.code, code) || other.code == code)&&(identical(other.isRtl, isRtl) || other.isRtl == isRtl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,isRtl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LocalState(code: $code, isRtl: $isRtl)';
}


}

/// @nodoc
abstract mixin class $LocalStateCopyWith<$Res>  {
  factory $LocalStateCopyWith(LocalState value, $Res Function(LocalState) _then) = _$LocalStateCopyWithImpl;
@useResult
$Res call({
 String code, bool isRtl
});




}
/// @nodoc
class _$LocalStateCopyWithImpl<$Res>
    implements $LocalStateCopyWith<$Res> {
  _$LocalStateCopyWithImpl(this._self, this._then);

  final LocalState _self;
  final $Res Function(LocalState) _then;

/// Create a copy of LocalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? isRtl = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,isRtl: null == isRtl ? _self.isRtl : isRtl // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalState].
extension LocalStatePatterns on LocalState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalState value)  $default,){
final _that = this;
switch (_that) {
case _LocalState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalState value)?  $default,){
final _that = this;
switch (_that) {
case _LocalState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  bool isRtl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalState() when $default != null:
return $default(_that.code,_that.isRtl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  bool isRtl)  $default,) {final _that = this;
switch (_that) {
case _LocalState():
return $default(_that.code,_that.isRtl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  bool isRtl)?  $default,) {final _that = this;
switch (_that) {
case _LocalState() when $default != null:
return $default(_that.code,_that.isRtl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _LocalState with DiagnosticableTreeMixin implements LocalState {
  const _LocalState({required this.code, required this.isRtl});
  factory _LocalState.fromJson(Map<String, dynamic> json) => _$LocalStateFromJson(json);

@override final  String code;
@override final  bool isRtl;

/// Create a copy of LocalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalStateCopyWith<_LocalState> get copyWith => __$LocalStateCopyWithImpl<_LocalState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalStateToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LocalState'))
    ..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('isRtl', isRtl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalState&&(identical(other.code, code) || other.code == code)&&(identical(other.isRtl, isRtl) || other.isRtl == isRtl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,isRtl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LocalState(code: $code, isRtl: $isRtl)';
}


}

/// @nodoc
abstract mixin class _$LocalStateCopyWith<$Res> implements $LocalStateCopyWith<$Res> {
  factory _$LocalStateCopyWith(_LocalState value, $Res Function(_LocalState) _then) = __$LocalStateCopyWithImpl;
@override @useResult
$Res call({
 String code, bool isRtl
});




}
/// @nodoc
class __$LocalStateCopyWithImpl<$Res>
    implements _$LocalStateCopyWith<$Res> {
  __$LocalStateCopyWithImpl(this._self, this._then);

  final _LocalState _self;
  final $Res Function(_LocalState) _then;

/// Create a copy of LocalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? isRtl = null,}) {
  return _then(_LocalState(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,isRtl: null == isRtl ? _self.isRtl : isRtl // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
