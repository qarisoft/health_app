// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_health_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerHealthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerHealthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerHealthState()';
}


}

/// @nodoc
class $ServerHealthStateCopyWith<$Res>  {
$ServerHealthStateCopyWith(ServerHealthState _, $Res Function(ServerHealthState) __);
}


/// Adds pattern-matching-related methods to [ServerHealthState].
extension ServerHealthStatePatterns on ServerHealthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingServerState value)?  loading,TResult Function( LiveServerState value)?  alive,TResult Function( NoApiServerState value)?  noApiUrl,TResult Function( ErrorServerState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingServerState() when loading != null:
return loading(_that);case LiveServerState() when alive != null:
return alive(_that);case NoApiServerState() when noApiUrl != null:
return noApiUrl(_that);case ErrorServerState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingServerState value)  loading,required TResult Function( LiveServerState value)  alive,required TResult Function( NoApiServerState value)  noApiUrl,required TResult Function( ErrorServerState value)  error,}){
final _that = this;
switch (_that) {
case LoadingServerState():
return loading(_that);case LiveServerState():
return alive(_that);case NoApiServerState():
return noApiUrl(_that);case ErrorServerState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingServerState value)?  loading,TResult? Function( LiveServerState value)?  alive,TResult? Function( NoApiServerState value)?  noApiUrl,TResult? Function( ErrorServerState value)?  error,}){
final _that = this;
switch (_that) {
case LoadingServerState() when loading != null:
return loading(_that);case LiveServerState() when alive != null:
return alive(_that);case NoApiServerState() when noApiUrl != null:
return noApiUrl(_that);case ErrorServerState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  alive,TResult Function()?  noApiUrl,TResult Function( String msg)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingServerState() when loading != null:
return loading();case LiveServerState() when alive != null:
return alive();case NoApiServerState() when noApiUrl != null:
return noApiUrl();case ErrorServerState() when error != null:
return error(_that.msg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  alive,required TResult Function()  noApiUrl,required TResult Function( String msg)  error,}) {final _that = this;
switch (_that) {
case LoadingServerState():
return loading();case LiveServerState():
return alive();case NoApiServerState():
return noApiUrl();case ErrorServerState():
return error(_that.msg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  alive,TResult? Function()?  noApiUrl,TResult? Function( String msg)?  error,}) {final _that = this;
switch (_that) {
case LoadingServerState() when loading != null:
return loading();case LiveServerState() when alive != null:
return alive();case NoApiServerState() when noApiUrl != null:
return noApiUrl();case ErrorServerState() when error != null:
return error(_that.msg);case _:
  return null;

}
}

}

/// @nodoc


class LoadingServerState implements ServerHealthState {
  const LoadingServerState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingServerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerHealthState.loading()';
}


}




/// @nodoc


class LiveServerState implements ServerHealthState {
  const LiveServerState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveServerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerHealthState.alive()';
}


}




/// @nodoc


class NoApiServerState implements ServerHealthState {
  const NoApiServerState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoApiServerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerHealthState.noApiUrl()';
}


}




/// @nodoc


class ErrorServerState implements ServerHealthState {
  const ErrorServerState({required this.msg});
  

 final  String msg;

/// Create a copy of ServerHealthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorServerStateCopyWith<ErrorServerState> get copyWith => _$ErrorServerStateCopyWithImpl<ErrorServerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorServerState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'ServerHealthState.error(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $ErrorServerStateCopyWith<$Res> implements $ServerHealthStateCopyWith<$Res> {
  factory $ErrorServerStateCopyWith(ErrorServerState value, $Res Function(ErrorServerState) _then) = _$ErrorServerStateCopyWithImpl;
@useResult
$Res call({
 String msg
});




}
/// @nodoc
class _$ErrorServerStateCopyWithImpl<$Res>
    implements $ErrorServerStateCopyWith<$Res> {
  _$ErrorServerStateCopyWithImpl(this._self, this._then);

  final ErrorServerState _self;
  final $Res Function(ErrorServerState) _then;

/// Create a copy of ServerHealthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = null,}) {
  return _then(ErrorServerState(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
