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
mixin _$Patient {

 int get id; int get userId; String get fullName; String get dateOfBirth; int get gender; String get phoneNumber; String get email; String get address; int get bloodType; int get weight; int get height; String get emergencyContact; String get emergencyPhone; String get createdAt; String get updatedAt;
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientCopyWith<Patient> get copyWith => _$PatientCopyWithImpl<Patient>(this as Patient, _$identity);

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,dateOfBirth,gender,phoneNumber,email,address,bloodType,weight,height,emergencyContact,emergencyPhone,createdAt,updatedAt);

@override
String toString() {
  return 'Patient(id: $id, userId: $userId, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PatientCopyWith<$Res>  {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) _then) = _$PatientCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String fullName, String dateOfBirth, int gender, String phoneNumber, String email, String address, int bloodType, int weight, int height, String emergencyContact, String emergencyPhone, String createdAt, String updatedAt
});




}
/// @nodoc
class _$PatientCopyWithImpl<$Res>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._self, this._then);

  final Patient _self;
  final $Res Function(Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = null,Object? address = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = null,Object? emergencyPhone = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,emergencyPhone: null == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Patient].
extension PatientPatterns on Patient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Patient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Patient value)  $default,){
final _that = this;
switch (_that) {
case _Patient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Patient value)?  $default,){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Patient():
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Patient implements Patient {
   _Patient({this.id = 0, this.userId = 0, this.fullName = '', this.dateOfBirth = '', this.gender = 1, this.phoneNumber = '', this.email = '', this.address = '', this.bloodType = 1, this.weight = 1, this.height = 1, this.emergencyContact = '', this.emergencyPhone = '', this.createdAt = '', this.updatedAt = ''});
  factory _Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userId;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  int gender;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String email;
@override@JsonKey() final  String address;
@override@JsonKey() final  int bloodType;
@override@JsonKey() final  int weight;
@override@JsonKey() final  int height;
@override@JsonKey() final  String emergencyContact;
@override@JsonKey() final  String emergencyPhone;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String updatedAt;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientCopyWith<_Patient> get copyWith => __$PatientCopyWithImpl<_Patient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,dateOfBirth,gender,phoneNumber,email,address,bloodType,weight,height,emergencyContact,emergencyPhone,createdAt,updatedAt);

@override
String toString() {
  return 'Patient(id: $id, userId: $userId, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) _then) = __$PatientCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String fullName, String dateOfBirth, int gender, String phoneNumber, String email, String address, int bloodType, int weight, int height, String emergencyContact, String emergencyPhone, String createdAt, String updatedAt
});




}
/// @nodoc
class __$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(this._self, this._then);

  final _Patient _self;
  final $Res Function(_Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = null,Object? address = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = null,Object? emergencyPhone = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Patient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,emergencyPhone: null == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Doctor {

 int get id; int get userId; String get fullName; String get specialization; String get phoneNumber; String get email; String get licenseNumber; String get hospital; String get createdAt; String get updatedAt;
/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorCopyWith<Doctor> get copyWith => _$DoctorCopyWithImpl<Doctor>(this as Doctor, _$identity);

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Doctor&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.hospital, hospital) || other.hospital == hospital)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,specialization,phoneNumber,email,licenseNumber,hospital,createdAt,updatedAt);

@override
String toString() {
  return 'Doctor(id: $id, userId: $userId, fullName: $fullName, specialization: $specialization, phoneNumber: $phoneNumber, email: $email, licenseNumber: $licenseNumber, hospital: $hospital, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DoctorCopyWith<$Res>  {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) _then) = _$DoctorCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String fullName, String specialization, String phoneNumber, String email, String licenseNumber, String hospital, String createdAt, String updatedAt
});




}
/// @nodoc
class _$DoctorCopyWithImpl<$Res>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._self, this._then);

  final Doctor _self;
  final $Res Function(Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? specialization = null,Object? phoneNumber = null,Object? email = null,Object? licenseNumber = null,Object? hospital = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,hospital: null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Doctor].
extension DoctorPatterns on Doctor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Doctor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Doctor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Doctor value)  $default,){
final _that = this;
switch (_that) {
case _Doctor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Doctor value)?  $default,){
final _that = this;
switch (_that) {
case _Doctor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String fullName,  String specialization,  String phoneNumber,  String email,  String licenseNumber,  String hospital,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.specialization,_that.phoneNumber,_that.email,_that.licenseNumber,_that.hospital,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String fullName,  String specialization,  String phoneNumber,  String email,  String licenseNumber,  String hospital,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Doctor():
return $default(_that.id,_that.userId,_that.fullName,_that.specialization,_that.phoneNumber,_that.email,_that.licenseNumber,_that.hospital,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String fullName,  String specialization,  String phoneNumber,  String email,  String licenseNumber,  String hospital,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.specialization,_that.phoneNumber,_that.email,_that.licenseNumber,_that.hospital,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Doctor implements Doctor {
   _Doctor({this.id = 0, this.userId = 0, this.fullName = '', this.specialization = '', this.phoneNumber = '', this.email = '', this.licenseNumber = '', this.hospital = '', this.createdAt = '', this.updatedAt = ''});
  factory _Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userId;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String specialization;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String email;
@override@JsonKey() final  String licenseNumber;
@override@JsonKey() final  String hospital;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String updatedAt;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorCopyWith<_Doctor> get copyWith => __$DoctorCopyWithImpl<_Doctor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Doctor&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.hospital, hospital) || other.hospital == hospital)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,specialization,phoneNumber,email,licenseNumber,hospital,createdAt,updatedAt);

@override
String toString() {
  return 'Doctor(id: $id, userId: $userId, fullName: $fullName, specialization: $specialization, phoneNumber: $phoneNumber, email: $email, licenseNumber: $licenseNumber, hospital: $hospital, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$DoctorCopyWith(_Doctor value, $Res Function(_Doctor) _then) = __$DoctorCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String fullName, String specialization, String phoneNumber, String email, String licenseNumber, String hospital, String createdAt, String updatedAt
});




}
/// @nodoc
class __$DoctorCopyWithImpl<$Res>
    implements _$DoctorCopyWith<$Res> {
  __$DoctorCopyWithImpl(this._self, this._then);

  final _Doctor _self;
  final $Res Function(_Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? specialization = null,Object? phoneNumber = null,Object? email = null,Object? licenseNumber = null,Object? hospital = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Doctor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,hospital: null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Pharmacist {

 int get id; int get userId; String get fullName; String get dateOfBirth; int get gender; String get phoneNumber; String get email; String get address; int get bloodType; int get weight; int get height; String get emergencyContact; String get emergencyPhone; String get pharmacyName; String get createdAt; String get updatedAt;
/// Create a copy of Pharmacist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistCopyWith<Pharmacist> get copyWith => _$PharmacistCopyWithImpl<Pharmacist>(this as Pharmacist, _$identity);

  /// Serializes this Pharmacist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pharmacist&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&(identical(other.pharmacyName, pharmacyName) || other.pharmacyName == pharmacyName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,dateOfBirth,gender,phoneNumber,email,address,bloodType,weight,height,emergencyContact,emergencyPhone,pharmacyName,createdAt,updatedAt);

@override
String toString() {
  return 'Pharmacist(id: $id, userId: $userId, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, pharmacyName: $pharmacyName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PharmacistCopyWith<$Res>  {
  factory $PharmacistCopyWith(Pharmacist value, $Res Function(Pharmacist) _then) = _$PharmacistCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String fullName, String dateOfBirth, int gender, String phoneNumber, String email, String address, int bloodType, int weight, int height, String emergencyContact, String emergencyPhone, String pharmacyName, String createdAt, String updatedAt
});




}
/// @nodoc
class _$PharmacistCopyWithImpl<$Res>
    implements $PharmacistCopyWith<$Res> {
  _$PharmacistCopyWithImpl(this._self, this._then);

  final Pharmacist _self;
  final $Res Function(Pharmacist) _then;

/// Create a copy of Pharmacist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = null,Object? address = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = null,Object? emergencyPhone = null,Object? pharmacyName = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,emergencyPhone: null == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String,pharmacyName: null == pharmacyName ? _self.pharmacyName : pharmacyName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Pharmacist].
extension PharmacistPatterns on Pharmacist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pharmacist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pharmacist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pharmacist value)  $default,){
final _that = this;
switch (_that) {
case _Pharmacist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pharmacist value)?  $default,){
final _that = this;
switch (_that) {
case _Pharmacist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String pharmacyName,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pharmacist() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.pharmacyName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String pharmacyName,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Pharmacist():
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.pharmacyName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String pharmacyName,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Pharmacist() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.pharmacyName,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pharmacist implements Pharmacist {
   _Pharmacist({this.id = 0, this.userId = 0, this.fullName = '-', this.dateOfBirth = '-', this.gender = 1, this.phoneNumber = '-', this.email = '-', this.address = '-', this.bloodType = 1, this.weight = 1, this.height = 1, this.emergencyContact = '-', this.emergencyPhone = '-', this.pharmacyName = '-', this.createdAt = '-', this.updatedAt = '-'});
  factory _Pharmacist.fromJson(Map<String, dynamic> json) => _$PharmacistFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userId;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  int gender;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String email;
@override@JsonKey() final  String address;
@override@JsonKey() final  int bloodType;
@override@JsonKey() final  int weight;
@override@JsonKey() final  int height;
@override@JsonKey() final  String emergencyContact;
@override@JsonKey() final  String emergencyPhone;
@override@JsonKey() final  String pharmacyName;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String updatedAt;

/// Create a copy of Pharmacist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacistCopyWith<_Pharmacist> get copyWith => __$PharmacistCopyWithImpl<_Pharmacist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pharmacist&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&(identical(other.pharmacyName, pharmacyName) || other.pharmacyName == pharmacyName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,dateOfBirth,gender,phoneNumber,email,address,bloodType,weight,height,emergencyContact,emergencyPhone,pharmacyName,createdAt,updatedAt);

@override
String toString() {
  return 'Pharmacist(id: $id, userId: $userId, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, pharmacyName: $pharmacyName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PharmacistCopyWith<$Res> implements $PharmacistCopyWith<$Res> {
  factory _$PharmacistCopyWith(_Pharmacist value, $Res Function(_Pharmacist) _then) = __$PharmacistCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String fullName, String dateOfBirth, int gender, String phoneNumber, String email, String address, int bloodType, int weight, int height, String emergencyContact, String emergencyPhone, String pharmacyName, String createdAt, String updatedAt
});




}
/// @nodoc
class __$PharmacistCopyWithImpl<$Res>
    implements _$PharmacistCopyWith<$Res> {
  __$PharmacistCopyWithImpl(this._self, this._then);

  final _Pharmacist _self;
  final $Res Function(_Pharmacist) _then;

/// Create a copy of Pharmacist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = null,Object? address = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = null,Object? emergencyPhone = null,Object? pharmacyName = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Pharmacist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,emergencyPhone: null == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String,pharmacyName: null == pharmacyName ? _self.pharmacyName : pharmacyName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Admin {

 int get id; int get userId; String get fullName; String get dateOfBirth; int get gender; String get phoneNumber; String get email; String get address; int get bloodType; int get weight; int get height; String get emergencyContact; String get emergencyPhone; String get createdAt; String get updatedAt;
/// Create a copy of Admin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminCopyWith<Admin> get copyWith => _$AdminCopyWithImpl<Admin>(this as Admin, _$identity);

  /// Serializes this Admin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Admin&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,dateOfBirth,gender,phoneNumber,email,address,bloodType,weight,height,emergencyContact,emergencyPhone,createdAt,updatedAt);

@override
String toString() {
  return 'Admin(id: $id, userId: $userId, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AdminCopyWith<$Res>  {
  factory $AdminCopyWith(Admin value, $Res Function(Admin) _then) = _$AdminCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String fullName, String dateOfBirth, int gender, String phoneNumber, String email, String address, int bloodType, int weight, int height, String emergencyContact, String emergencyPhone, String createdAt, String updatedAt
});




}
/// @nodoc
class _$AdminCopyWithImpl<$Res>
    implements $AdminCopyWith<$Res> {
  _$AdminCopyWithImpl(this._self, this._then);

  final Admin _self;
  final $Res Function(Admin) _then;

/// Create a copy of Admin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = null,Object? address = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = null,Object? emergencyPhone = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,emergencyPhone: null == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Admin].
extension AdminPatterns on Admin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Admin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Admin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Admin value)  $default,){
final _that = this;
switch (_that) {
case _Admin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Admin value)?  $default,){
final _that = this;
switch (_that) {
case _Admin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Admin() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Admin():
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  int weight,  int height,  String emergencyContact,  String emergencyPhone,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Admin() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Admin implements Admin {
   _Admin({this.id = 0, this.userId = 0, this.fullName = '', this.dateOfBirth = '', this.gender = 1, this.phoneNumber = '', this.email = '', this.address = '', this.bloodType = 1, this.weight = 1, this.height = 1, this.emergencyContact = '', this.emergencyPhone = '', this.createdAt = '', this.updatedAt = ''});
  factory _Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userId;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  int gender;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String email;
@override@JsonKey() final  String address;
@override@JsonKey() final  int bloodType;
@override@JsonKey() final  int weight;
@override@JsonKey() final  int height;
@override@JsonKey() final  String emergencyContact;
@override@JsonKey() final  String emergencyPhone;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String updatedAt;

/// Create a copy of Admin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminCopyWith<_Admin> get copyWith => __$AdminCopyWithImpl<_Admin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Admin&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,dateOfBirth,gender,phoneNumber,email,address,bloodType,weight,height,emergencyContact,emergencyPhone,createdAt,updatedAt);

@override
String toString() {
  return 'Admin(id: $id, userId: $userId, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AdminCopyWith<$Res> implements $AdminCopyWith<$Res> {
  factory _$AdminCopyWith(_Admin value, $Res Function(_Admin) _then) = __$AdminCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String fullName, String dateOfBirth, int gender, String phoneNumber, String email, String address, int bloodType, int weight, int height, String emergencyContact, String emergencyPhone, String createdAt, String updatedAt
});




}
/// @nodoc
class __$AdminCopyWithImpl<$Res>
    implements _$AdminCopyWith<$Res> {
  __$AdminCopyWithImpl(this._self, this._then);

  final _Admin _self;
  final $Res Function(_Admin) _then;

/// Create a copy of Admin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = null,Object? address = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = null,Object? emergencyPhone = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Admin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,emergencyPhone: null == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
