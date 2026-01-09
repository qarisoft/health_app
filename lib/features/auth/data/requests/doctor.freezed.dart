// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorRegisterRequest {

 String get nationalId; String get password; String get confirmPassword; String get fullName; DateTime get dateOfBirth; String get phoneNumber; String get email; String get licenseNumber; String get specialization; String get hospital; String get licenseDocumentUrl;
/// Create a copy of DoctorRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorRegisterRequestCopyWith<DoctorRegisterRequest> get copyWith => _$DoctorRegisterRequestCopyWithImpl<DoctorRegisterRequest>(this as DoctorRegisterRequest, _$identity);

  /// Serializes this DoctorRegisterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorRegisterRequest&&(identical(other.nationalId, nationalId) || other.nationalId == nationalId)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.hospital, hospital) || other.hospital == hospital)&&(identical(other.licenseDocumentUrl, licenseDocumentUrl) || other.licenseDocumentUrl == licenseDocumentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nationalId,password,confirmPassword,fullName,dateOfBirth,phoneNumber,email,licenseNumber,specialization,hospital,licenseDocumentUrl);

@override
String toString() {
  return 'DoctorRegisterRequest(nationalId: $nationalId, password: $password, confirmPassword: $confirmPassword, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, email: $email, licenseNumber: $licenseNumber, specialization: $specialization, hospital: $hospital, licenseDocumentUrl: $licenseDocumentUrl)';
}


}

/// @nodoc
abstract mixin class $DoctorRegisterRequestCopyWith<$Res>  {
  factory $DoctorRegisterRequestCopyWith(DoctorRegisterRequest value, $Res Function(DoctorRegisterRequest) _then) = _$DoctorRegisterRequestCopyWithImpl;
@useResult
$Res call({
 String nationalId, String password, String confirmPassword, String fullName, DateTime dateOfBirth, String phoneNumber, String email, String licenseNumber, String specialization, String hospital, String licenseDocumentUrl
});




}
/// @nodoc
class _$DoctorRegisterRequestCopyWithImpl<$Res>
    implements $DoctorRegisterRequestCopyWith<$Res> {
  _$DoctorRegisterRequestCopyWithImpl(this._self, this._then);

  final DoctorRegisterRequest _self;
  final $Res Function(DoctorRegisterRequest) _then;

/// Create a copy of DoctorRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nationalId = null,Object? password = null,Object? confirmPassword = null,Object? fullName = null,Object? dateOfBirth = null,Object? phoneNumber = null,Object? email = null,Object? licenseNumber = null,Object? specialization = null,Object? hospital = null,Object? licenseDocumentUrl = null,}) {
  return _then(_self.copyWith(
nationalId: null == nationalId ? _self.nationalId : nationalId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,hospital: null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as String,licenseDocumentUrl: null == licenseDocumentUrl ? _self.licenseDocumentUrl : licenseDocumentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorRegisterRequest].
extension DoctorRegisterRequestPatterns on DoctorRegisterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorRegisterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorRegisterRequest value)  $default,){
final _that = this;
switch (_that) {
case _DoctorRegisterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorRegisterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nationalId,  String password,  String confirmPassword,  String fullName,  DateTime dateOfBirth,  String phoneNumber,  String email,  String licenseNumber,  String specialization,  String hospital,  String licenseDocumentUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorRegisterRequest() when $default != null:
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email,_that.licenseNumber,_that.specialization,_that.hospital,_that.licenseDocumentUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nationalId,  String password,  String confirmPassword,  String fullName,  DateTime dateOfBirth,  String phoneNumber,  String email,  String licenseNumber,  String specialization,  String hospital,  String licenseDocumentUrl)  $default,) {final _that = this;
switch (_that) {
case _DoctorRegisterRequest():
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email,_that.licenseNumber,_that.specialization,_that.hospital,_that.licenseDocumentUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nationalId,  String password,  String confirmPassword,  String fullName,  DateTime dateOfBirth,  String phoneNumber,  String email,  String licenseNumber,  String specialization,  String hospital,  String licenseDocumentUrl)?  $default,) {final _that = this;
switch (_that) {
case _DoctorRegisterRequest() when $default != null:
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email,_that.licenseNumber,_that.specialization,_that.hospital,_that.licenseDocumentUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorRegisterRequest implements DoctorRegisterRequest {
  const _DoctorRegisterRequest({required this.nationalId, required this.password, required this.confirmPassword, required this.fullName, required this.dateOfBirth, required this.phoneNumber, required this.email, required this.licenseNumber, required this.specialization, required this.hospital, required this.licenseDocumentUrl});
  factory _DoctorRegisterRequest.fromJson(Map<String, dynamic> json) => _$DoctorRegisterRequestFromJson(json);

@override final  String nationalId;
@override final  String password;
@override final  String confirmPassword;
@override final  String fullName;
@override final  DateTime dateOfBirth;
@override final  String phoneNumber;
@override final  String email;
@override final  String licenseNumber;
@override final  String specialization;
@override final  String hospital;
@override final  String licenseDocumentUrl;

/// Create a copy of DoctorRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorRegisterRequestCopyWith<_DoctorRegisterRequest> get copyWith => __$DoctorRegisterRequestCopyWithImpl<_DoctorRegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorRegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorRegisterRequest&&(identical(other.nationalId, nationalId) || other.nationalId == nationalId)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.hospital, hospital) || other.hospital == hospital)&&(identical(other.licenseDocumentUrl, licenseDocumentUrl) || other.licenseDocumentUrl == licenseDocumentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nationalId,password,confirmPassword,fullName,dateOfBirth,phoneNumber,email,licenseNumber,specialization,hospital,licenseDocumentUrl);

@override
String toString() {
  return 'DoctorRegisterRequest(nationalId: $nationalId, password: $password, confirmPassword: $confirmPassword, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, email: $email, licenseNumber: $licenseNumber, specialization: $specialization, hospital: $hospital, licenseDocumentUrl: $licenseDocumentUrl)';
}


}

/// @nodoc
abstract mixin class _$DoctorRegisterRequestCopyWith<$Res> implements $DoctorRegisterRequestCopyWith<$Res> {
  factory _$DoctorRegisterRequestCopyWith(_DoctorRegisterRequest value, $Res Function(_DoctorRegisterRequest) _then) = __$DoctorRegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String nationalId, String password, String confirmPassword, String fullName, DateTime dateOfBirth, String phoneNumber, String email, String licenseNumber, String specialization, String hospital, String licenseDocumentUrl
});




}
/// @nodoc
class __$DoctorRegisterRequestCopyWithImpl<$Res>
    implements _$DoctorRegisterRequestCopyWith<$Res> {
  __$DoctorRegisterRequestCopyWithImpl(this._self, this._then);

  final _DoctorRegisterRequest _self;
  final $Res Function(_DoctorRegisterRequest) _then;

/// Create a copy of DoctorRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nationalId = null,Object? password = null,Object? confirmPassword = null,Object? fullName = null,Object? dateOfBirth = null,Object? phoneNumber = null,Object? email = null,Object? licenseNumber = null,Object? specialization = null,Object? hospital = null,Object? licenseDocumentUrl = null,}) {
  return _then(_DoctorRegisterRequest(
nationalId: null == nationalId ? _self.nationalId : nationalId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,hospital: null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as String,licenseDocumentUrl: null == licenseDocumentUrl ? _self.licenseDocumentUrl : licenseDocumentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
