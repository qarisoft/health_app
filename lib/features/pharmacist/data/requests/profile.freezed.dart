// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PharmacistProfileRequestData {

 String get fullName; String get phoneNumber; String get email; String get pharmacyName; String get licenseNumber;
/// Create a copy of PharmacistProfileRequestData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistProfileRequestDataCopyWith<PharmacistProfileRequestData> get copyWith => _$PharmacistProfileRequestDataCopyWithImpl<PharmacistProfileRequestData>(this as PharmacistProfileRequestData, _$identity);

  /// Serializes this PharmacistProfileRequestData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacistProfileRequestData&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.pharmacyName, pharmacyName) || other.pharmacyName == pharmacyName)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,email,pharmacyName,licenseNumber);

@override
String toString() {
  return 'PharmacistProfileRequestData(fullName: $fullName, phoneNumber: $phoneNumber, email: $email, pharmacyName: $pharmacyName, licenseNumber: $licenseNumber)';
}


}

/// @nodoc
abstract mixin class $PharmacistProfileRequestDataCopyWith<$Res>  {
  factory $PharmacistProfileRequestDataCopyWith(PharmacistProfileRequestData value, $Res Function(PharmacistProfileRequestData) _then) = _$PharmacistProfileRequestDataCopyWithImpl;
@useResult
$Res call({
 String fullName, String phoneNumber, String email, String pharmacyName, String licenseNumber
});




}
/// @nodoc
class _$PharmacistProfileRequestDataCopyWithImpl<$Res>
    implements $PharmacistProfileRequestDataCopyWith<$Res> {
  _$PharmacistProfileRequestDataCopyWithImpl(this._self, this._then);

  final PharmacistProfileRequestData _self;
  final $Res Function(PharmacistProfileRequestData) _then;

/// Create a copy of PharmacistProfileRequestData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? phoneNumber = null,Object? email = null,Object? pharmacyName = null,Object? licenseNumber = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pharmacyName: null == pharmacyName ? _self.pharmacyName : pharmacyName // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PharmacistProfileRequestData].
extension PharmacistProfileRequestDataPatterns on PharmacistProfileRequestData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacistProfileRequestData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacistProfileRequestData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacistProfileRequestData value)  $default,){
final _that = this;
switch (_that) {
case _PharmacistProfileRequestData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacistProfileRequestData value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacistProfileRequestData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String phoneNumber,  String email,  String pharmacyName,  String licenseNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacistProfileRequestData() when $default != null:
return $default(_that.fullName,_that.phoneNumber,_that.email,_that.pharmacyName,_that.licenseNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String phoneNumber,  String email,  String pharmacyName,  String licenseNumber)  $default,) {final _that = this;
switch (_that) {
case _PharmacistProfileRequestData():
return $default(_that.fullName,_that.phoneNumber,_that.email,_that.pharmacyName,_that.licenseNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String phoneNumber,  String email,  String pharmacyName,  String licenseNumber)?  $default,) {final _that = this;
switch (_that) {
case _PharmacistProfileRequestData() when $default != null:
return $default(_that.fullName,_that.phoneNumber,_that.email,_that.pharmacyName,_that.licenseNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PharmacistProfileRequestData implements PharmacistProfileRequestData {
   _PharmacistProfileRequestData({required this.fullName, required this.phoneNumber, required this.email, required this.pharmacyName, required this.licenseNumber});
  factory _PharmacistProfileRequestData.fromJson(Map<String, dynamic> json) => _$PharmacistProfileRequestDataFromJson(json);

@override final  String fullName;
@override final  String phoneNumber;
@override final  String email;
@override final  String pharmacyName;
@override final  String licenseNumber;

/// Create a copy of PharmacistProfileRequestData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacistProfileRequestDataCopyWith<_PharmacistProfileRequestData> get copyWith => __$PharmacistProfileRequestDataCopyWithImpl<_PharmacistProfileRequestData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacistProfileRequestDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PharmacistProfileRequestData&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.pharmacyName, pharmacyName) || other.pharmacyName == pharmacyName)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,email,pharmacyName,licenseNumber);

@override
String toString() {
  return 'PharmacistProfileRequestData(fullName: $fullName, phoneNumber: $phoneNumber, email: $email, pharmacyName: $pharmacyName, licenseNumber: $licenseNumber)';
}


}

/// @nodoc
abstract mixin class _$PharmacistProfileRequestDataCopyWith<$Res> implements $PharmacistProfileRequestDataCopyWith<$Res> {
  factory _$PharmacistProfileRequestDataCopyWith(_PharmacistProfileRequestData value, $Res Function(_PharmacistProfileRequestData) _then) = __$PharmacistProfileRequestDataCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String phoneNumber, String email, String pharmacyName, String licenseNumber
});




}
/// @nodoc
class __$PharmacistProfileRequestDataCopyWithImpl<$Res>
    implements _$PharmacistProfileRequestDataCopyWith<$Res> {
  __$PharmacistProfileRequestDataCopyWithImpl(this._self, this._then);

  final _PharmacistProfileRequestData _self;
  final $Res Function(_PharmacistProfileRequestData) _then;

/// Create a copy of PharmacistProfileRequestData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? phoneNumber = null,Object? email = null,Object? pharmacyName = null,Object? licenseNumber = null,}) {
  return _then(_PharmacistProfileRequestData(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pharmacyName: null == pharmacyName ? _self.pharmacyName : pharmacyName // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
