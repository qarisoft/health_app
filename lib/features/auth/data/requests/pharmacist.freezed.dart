// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pharmacist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PharmacistRegisterRequest {

 String get nationalId; String get password; String get confirmPassword; String get fullName; String get dateOfBirth; String get phoneNumber; String get email; String get licenseNumber; String get pharmacyName; String get licenseDocumentUrl;
/// Create a copy of PharmacistRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistRegisterRequestCopyWith<PharmacistRegisterRequest> get copyWith => _$PharmacistRegisterRequestCopyWithImpl<PharmacistRegisterRequest>(this as PharmacistRegisterRequest, _$identity);

  /// Serializes this PharmacistRegisterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacistRegisterRequest&&(identical(other.nationalId, nationalId) || other.nationalId == nationalId)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.pharmacyName, pharmacyName) || other.pharmacyName == pharmacyName)&&(identical(other.licenseDocumentUrl, licenseDocumentUrl) || other.licenseDocumentUrl == licenseDocumentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nationalId,password,confirmPassword,fullName,dateOfBirth,phoneNumber,email,licenseNumber,pharmacyName,licenseDocumentUrl);

@override
String toString() {
  return 'PharmacistRegisterRequest(nationalId: $nationalId, password: $password, confirmPassword: $confirmPassword, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, email: $email, licenseNumber: $licenseNumber, pharmacyName: $pharmacyName, licenseDocumentUrl: $licenseDocumentUrl)';
}


}

/// @nodoc
abstract mixin class $PharmacistRegisterRequestCopyWith<$Res>  {
  factory $PharmacistRegisterRequestCopyWith(PharmacistRegisterRequest value, $Res Function(PharmacistRegisterRequest) _then) = _$PharmacistRegisterRequestCopyWithImpl;
@useResult
$Res call({
 String nationalId, String password, String confirmPassword, String fullName, String dateOfBirth, String phoneNumber, String email, String licenseNumber, String pharmacyName, String licenseDocumentUrl
});




}
/// @nodoc
class _$PharmacistRegisterRequestCopyWithImpl<$Res>
    implements $PharmacistRegisterRequestCopyWith<$Res> {
  _$PharmacistRegisterRequestCopyWithImpl(this._self, this._then);

  final PharmacistRegisterRequest _self;
  final $Res Function(PharmacistRegisterRequest) _then;

/// Create a copy of PharmacistRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nationalId = null,Object? password = null,Object? confirmPassword = null,Object? fullName = null,Object? dateOfBirth = null,Object? phoneNumber = null,Object? email = null,Object? licenseNumber = null,Object? pharmacyName = null,Object? licenseDocumentUrl = null,}) {
  return _then(_self.copyWith(
nationalId: null == nationalId ? _self.nationalId : nationalId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,pharmacyName: null == pharmacyName ? _self.pharmacyName : pharmacyName // ignore: cast_nullable_to_non_nullable
as String,licenseDocumentUrl: null == licenseDocumentUrl ? _self.licenseDocumentUrl : licenseDocumentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PharmacistRegisterRequest].
extension PharmacistRegisterRequestPatterns on PharmacistRegisterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacistRegisterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacistRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacistRegisterRequest value)  $default,){
final _that = this;
switch (_that) {
case _PharmacistRegisterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacistRegisterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacistRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nationalId,  String password,  String confirmPassword,  String fullName,  String dateOfBirth,  String phoneNumber,  String email,  String licenseNumber,  String pharmacyName,  String licenseDocumentUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacistRegisterRequest() when $default != null:
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email,_that.licenseNumber,_that.pharmacyName,_that.licenseDocumentUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nationalId,  String password,  String confirmPassword,  String fullName,  String dateOfBirth,  String phoneNumber,  String email,  String licenseNumber,  String pharmacyName,  String licenseDocumentUrl)  $default,) {final _that = this;
switch (_that) {
case _PharmacistRegisterRequest():
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email,_that.licenseNumber,_that.pharmacyName,_that.licenseDocumentUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nationalId,  String password,  String confirmPassword,  String fullName,  String dateOfBirth,  String phoneNumber,  String email,  String licenseNumber,  String pharmacyName,  String licenseDocumentUrl)?  $default,) {final _that = this;
switch (_that) {
case _PharmacistRegisterRequest() when $default != null:
return $default(_that.nationalId,_that.password,_that.confirmPassword,_that.fullName,_that.dateOfBirth,_that.phoneNumber,_that.email,_that.licenseNumber,_that.pharmacyName,_that.licenseDocumentUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PharmacistRegisterRequest implements PharmacistRegisterRequest {
  const _PharmacistRegisterRequest({required this.nationalId, required this.password, required this.confirmPassword, required this.fullName, required this.dateOfBirth, required this.phoneNumber, required this.email, required this.licenseNumber, required this.pharmacyName, required this.licenseDocumentUrl});
  factory _PharmacistRegisterRequest.fromJson(Map<String, dynamic> json) => _$PharmacistRegisterRequestFromJson(json);

@override final  String nationalId;
@override final  String password;
@override final  String confirmPassword;
@override final  String fullName;
@override final  String dateOfBirth;
@override final  String phoneNumber;
@override final  String email;
@override final  String licenseNumber;
@override final  String pharmacyName;
@override final  String licenseDocumentUrl;

/// Create a copy of PharmacistRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacistRegisterRequestCopyWith<_PharmacistRegisterRequest> get copyWith => __$PharmacistRegisterRequestCopyWithImpl<_PharmacistRegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacistRegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PharmacistRegisterRequest&&(identical(other.nationalId, nationalId) || other.nationalId == nationalId)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.pharmacyName, pharmacyName) || other.pharmacyName == pharmacyName)&&(identical(other.licenseDocumentUrl, licenseDocumentUrl) || other.licenseDocumentUrl == licenseDocumentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nationalId,password,confirmPassword,fullName,dateOfBirth,phoneNumber,email,licenseNumber,pharmacyName,licenseDocumentUrl);

@override
String toString() {
  return 'PharmacistRegisterRequest(nationalId: $nationalId, password: $password, confirmPassword: $confirmPassword, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, email: $email, licenseNumber: $licenseNumber, pharmacyName: $pharmacyName, licenseDocumentUrl: $licenseDocumentUrl)';
}


}

/// @nodoc
abstract mixin class _$PharmacistRegisterRequestCopyWith<$Res> implements $PharmacistRegisterRequestCopyWith<$Res> {
  factory _$PharmacistRegisterRequestCopyWith(_PharmacistRegisterRequest value, $Res Function(_PharmacistRegisterRequest) _then) = __$PharmacistRegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String nationalId, String password, String confirmPassword, String fullName, String dateOfBirth, String phoneNumber, String email, String licenseNumber, String pharmacyName, String licenseDocumentUrl
});




}
/// @nodoc
class __$PharmacistRegisterRequestCopyWithImpl<$Res>
    implements _$PharmacistRegisterRequestCopyWith<$Res> {
  __$PharmacistRegisterRequestCopyWithImpl(this._self, this._then);

  final _PharmacistRegisterRequest _self;
  final $Res Function(_PharmacistRegisterRequest) _then;

/// Create a copy of PharmacistRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nationalId = null,Object? password = null,Object? confirmPassword = null,Object? fullName = null,Object? dateOfBirth = null,Object? phoneNumber = null,Object? email = null,Object? licenseNumber = null,Object? pharmacyName = null,Object? licenseDocumentUrl = null,}) {
  return _then(_PharmacistRegisterRequest(
nationalId: null == nationalId ? _self.nationalId : nationalId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,pharmacyName: null == pharmacyName ? _self.pharmacyName : pharmacyName // ignore: cast_nullable_to_non_nullable
as String,licenseDocumentUrl: null == licenseDocumentUrl ? _self.licenseDocumentUrl : licenseDocumentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
