// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'p.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PatientProfileState {

 PatientProfile get profile; int get currentStep; bool get isLoading; String? get error; bool get isSubmitted;
/// Create a copy of PatientProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientProfileStateCopyWith<PatientProfileState> get copyWith => _$PatientProfileStateCopyWithImpl<PatientProfileState>(this as PatientProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted));
}


@override
int get hashCode => Object.hash(runtimeType,profile,currentStep,isLoading,error,isSubmitted);

@override
String toString() {
  return 'PatientProfileState(profile: $profile, currentStep: $currentStep, isLoading: $isLoading, error: $error, isSubmitted: $isSubmitted)';
}


}

/// @nodoc
abstract mixin class $PatientProfileStateCopyWith<$Res>  {
  factory $PatientProfileStateCopyWith(PatientProfileState value, $Res Function(PatientProfileState) _then) = _$PatientProfileStateCopyWithImpl;
@useResult
$Res call({
 PatientProfile profile, int currentStep, bool isLoading, String? error, bool isSubmitted
});


$PatientProfileCopyWith<$Res> get profile;

}
/// @nodoc
class _$PatientProfileStateCopyWithImpl<$Res>
    implements $PatientProfileStateCopyWith<$Res> {
  _$PatientProfileStateCopyWithImpl(this._self, this._then);

  final PatientProfileState _self;
  final $Res Function(PatientProfileState) _then;

/// Create a copy of PatientProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? currentStep = null,Object? isLoading = null,Object? error = freezed,Object? isSubmitted = null,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PatientProfile,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSubmitted: null == isSubmitted ? _self.isSubmitted : isSubmitted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PatientProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientProfileCopyWith<$Res> get profile {
  
  return $PatientProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [PatientProfileState].
extension PatientProfileStatePatterns on PatientProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientProfileState value)  $default,){
final _that = this;
switch (_that) {
case _PatientProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _PatientProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PatientProfile profile,  int currentStep,  bool isLoading,  String? error,  bool isSubmitted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientProfileState() when $default != null:
return $default(_that.profile,_that.currentStep,_that.isLoading,_that.error,_that.isSubmitted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PatientProfile profile,  int currentStep,  bool isLoading,  String? error,  bool isSubmitted)  $default,) {final _that = this;
switch (_that) {
case _PatientProfileState():
return $default(_that.profile,_that.currentStep,_that.isLoading,_that.error,_that.isSubmitted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PatientProfile profile,  int currentStep,  bool isLoading,  String? error,  bool isSubmitted)?  $default,) {final _that = this;
switch (_that) {
case _PatientProfileState() when $default != null:
return $default(_that.profile,_that.currentStep,_that.isLoading,_that.error,_that.isSubmitted);case _:
  return null;

}
}

}

/// @nodoc


class _PatientProfileState implements PatientProfileState {
  const _PatientProfileState({this.profile = const PatientProfile(), this.currentStep = 0, this.isLoading = false, this.error, this.isSubmitted = false});
  

@override@JsonKey() final  PatientProfile profile;
@override@JsonKey() final  int currentStep;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool isSubmitted;

/// Create a copy of PatientProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientProfileStateCopyWith<_PatientProfileState> get copyWith => __$PatientProfileStateCopyWithImpl<_PatientProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted));
}


@override
int get hashCode => Object.hash(runtimeType,profile,currentStep,isLoading,error,isSubmitted);

@override
String toString() {
  return 'PatientProfileState(profile: $profile, currentStep: $currentStep, isLoading: $isLoading, error: $error, isSubmitted: $isSubmitted)';
}


}

/// @nodoc
abstract mixin class _$PatientProfileStateCopyWith<$Res> implements $PatientProfileStateCopyWith<$Res> {
  factory _$PatientProfileStateCopyWith(_PatientProfileState value, $Res Function(_PatientProfileState) _then) = __$PatientProfileStateCopyWithImpl;
@override @useResult
$Res call({
 PatientProfile profile, int currentStep, bool isLoading, String? error, bool isSubmitted
});


@override $PatientProfileCopyWith<$Res> get profile;

}
/// @nodoc
class __$PatientProfileStateCopyWithImpl<$Res>
    implements _$PatientProfileStateCopyWith<$Res> {
  __$PatientProfileStateCopyWithImpl(this._self, this._then);

  final _PatientProfileState _self;
  final $Res Function(_PatientProfileState) _then;

/// Create a copy of PatientProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? currentStep = null,Object? isLoading = null,Object? error = freezed,Object? isSubmitted = null,}) {
  return _then(_PatientProfileState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PatientProfile,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSubmitted: null == isSubmitted ? _self.isSubmitted : isSubmitted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PatientProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientProfileCopyWith<$Res> get profile {
  
  return $PatientProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
