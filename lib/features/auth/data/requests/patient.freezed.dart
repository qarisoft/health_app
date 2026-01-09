// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatientRegisterRequest {

 String get nationalId; String get password; String get confirmPassword; String get fullName; DateTime get dateOfBirth; String get phoneNumber; String get email;
/// Create a copy of PatientRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientRegisterRequestCopyWith<PatientRegisterRequest> get copyWith => _$PatientRegisterRequestCopyWithImpl<PatientRegisterRequest>(this as PatientRegisterRequest, _$identity);

  /// Serializes this PatientRegisterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientRegisterRequest&&(identical(other.nationalId, nationalId) || other.nationalId == nationalId)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nationalId,password,confirmPassword,fullName,dateOfBirth,phoneNumber,email);

@override
String toString() {
  return 'PatientRegisterRequest(nationalId: $nationalId, password: $password, confirmPassword: $confirmPassword, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, email: $email)';
}


}

/// @nodoc
abstract mixin class $PatientRegisterRequestCopyWith<$Res>  {
  factory $PatientRegisterRequestCopyWith(PatientRegisterRequest value, $Res Function(PatientRegisterRequest) _then) = _$PatientRegisterRequestCopyWithImpl;
@useResult
$Res call({
 String nationalId, String password, String confirmPassword, String fullName, DateTime dateOfBirth, String phoneNumber, String email
});




}
/// @nodoc
class _$PatientRegisterRequestCopyWithImpl<$Res>
    implements $PatientRegisterRequestCopyWith<$Res> {
  _$PatientRegisterRequestCopyWithImpl(this._self, this._then);

  final PatientRegisterRequest _self;
  final $Res Function(PatientRegisterRequest) _then;

/// Create a copy of PatientRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nationalId = null,Object? password = null,Object? confirmPassword = null,Object? fullName = null,Object? dateOfBirth = null,Object? phoneNumber = null,Object? email = null,}) {
  return _then(_self.copyWith(
nationalId: null == nationalId ? _self.nationalId : nationalId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientRegisterRequest].
extension PatientRegisterRequestPatterns on PatientRegisterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientRegisterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientRegisterRequest value)  $default,){
final _that = this;
switch (_that) {
case _PatientRegisterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientRegisterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PatientRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nationalId,  String password,  String confirmPassword,  String fullName,  DateTime dateOfBirth,  String phoneNumber,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientRegisterRequest() when $default != null:
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nationalId,  String password,  String confirmPassword,  String fullName,  DateTime dateOfBirth,  String phoneNumber,  String email)  $default,) {final _that = this;
switch (_that) {
case _PatientRegisterRequest():
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nationalId,  String password,  String confirmPassword,  String fullName,  DateTime dateOfBirth,  String phoneNumber,  String email)?  $default,) {final _that = this;
switch (_that) {
case _PatientRegisterRequest() when $default != null:
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientRegisterRequest implements PatientRegisterRequest {
  const _PatientRegisterRequest({required this.nationalId, required this.password, required this.confirmPassword, required this.fullName, required this.dateOfBirth, required this.phoneNumber, required this.email});
  factory _PatientRegisterRequest.fromJson(Map<String, dynamic> json) => _$PatientRegisterRequestFromJson(json);

@override final  String nationalId;
@override final  String password;
@override final  String confirmPassword;
@override final  String fullName;
@override final  DateTime dateOfBirth;
@override final  String phoneNumber;
@override final  String email;

/// Create a copy of PatientRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientRegisterRequestCopyWith<_PatientRegisterRequest> get copyWith => __$PatientRegisterRequestCopyWithImpl<_PatientRegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientRegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientRegisterRequest&&(identical(other.nationalId, nationalId) || other.nationalId == nationalId)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nationalId,password,confirmPassword,fullName,dateOfBirth,phoneNumber,email);

@override
String toString() {
  return 'PatientRegisterRequest(nationalId: $nationalId, password: $password, confirmPassword: $confirmPassword, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, email: $email)';
}


}

/// @nodoc
abstract mixin class _$PatientRegisterRequestCopyWith<$Res> implements $PatientRegisterRequestCopyWith<$Res> {
  factory _$PatientRegisterRequestCopyWith(_PatientRegisterRequest value, $Res Function(_PatientRegisterRequest) _then) = __$PatientRegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String nationalId, String password, String confirmPassword, String fullName, DateTime dateOfBirth, String phoneNumber, String email
});




}
/// @nodoc
class __$PatientRegisterRequestCopyWithImpl<$Res>
    implements _$PatientRegisterRequestCopyWith<$Res> {
  __$PatientRegisterRequestCopyWithImpl(this._self, this._then);

  final _PatientRegisterRequest _self;
  final $Res Function(_PatientRegisterRequest) _then;

/// Create a copy of PatientRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nationalId = null,Object? password = null,Object? confirmPassword = null,Object? fullName = null,Object? dateOfBirth = null,Object? phoneNumber = null,Object? email = null,}) {
  return _then(_PatientRegisterRequest(
nationalId: null == nationalId ? _self.nationalId : nationalId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
