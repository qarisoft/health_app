// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEntity {

 String get phoneNumber; String get name; int get idCardNumber;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);

  /// Serializes this UserEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.idCardNumber, idCardNumber) || other.idCardNumber == idCardNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,name,idCardNumber);

@override
String toString() {
  return 'UserEntity(phoneNumber: $phoneNumber, name: $name, idCardNumber: $idCardNumber)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String name, int idCardNumber
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? name = null,Object? idCardNumber = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idCardNumber: null == idCardNumber ? _self.idCardNumber : idCardNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  String name,  int idCardNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.phoneNumber,_that.name,_that.idCardNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  String name,  int idCardNumber)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.phoneNumber,_that.name,_that.idCardNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  String name,  int idCardNumber)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.phoneNumber,_that.name,_that.idCardNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEntity implements UserEntity {
  const _UserEntity({required this.phoneNumber, required this.name, required this.idCardNumber});
  factory _UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

@override final  String phoneNumber;
@override final  String name;
@override final  int idCardNumber;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.idCardNumber, idCardNumber) || other.idCardNumber == idCardNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,name,idCardNumber);

@override
String toString() {
  return 'UserEntity(phoneNumber: $phoneNumber, name: $name, idCardNumber: $idCardNumber)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, String name, int idCardNumber
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? name = null,Object? idCardNumber = null,}) {
  return _then(_UserEntity(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idCardNumber: null == idCardNumber ? _self.idCardNumber : idCardNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DoctorEntity {

 bool get isActive; UserType get userType;
/// Create a copy of DoctorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorEntityCopyWith<DoctorEntity> get copyWith => _$DoctorEntityCopyWithImpl<DoctorEntity>(this as DoctorEntity, _$identity);

  /// Serializes this DoctorEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorEntity&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActive,userType);

@override
String toString() {
  return 'DoctorEntity(isActive: $isActive, userType: $userType)';
}


}

/// @nodoc
abstract mixin class $DoctorEntityCopyWith<$Res>  {
  factory $DoctorEntityCopyWith(DoctorEntity value, $Res Function(DoctorEntity) _then) = _$DoctorEntityCopyWithImpl;
@useResult
$Res call({
 bool isActive, UserType userType
});




}
/// @nodoc
class _$DoctorEntityCopyWithImpl<$Res>
    implements $DoctorEntityCopyWith<$Res> {
  _$DoctorEntityCopyWithImpl(this._self, this._then);

  final DoctorEntity _self;
  final $Res Function(DoctorEntity) _then;

/// Create a copy of DoctorEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isActive = null,Object? userType = null,}) {
  return _then(_self.copyWith(
isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorEntity].
extension DoctorEntityPatterns on DoctorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorEntity value)  $default,){
final _that = this;
switch (_that) {
case _DoctorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isActive,  UserType userType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorEntity() when $default != null:
return $default(_that.isActive,_that.userType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isActive,  UserType userType)  $default,) {final _that = this;
switch (_that) {
case _DoctorEntity():
return $default(_that.isActive,_that.userType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isActive,  UserType userType)?  $default,) {final _that = this;
switch (_that) {
case _DoctorEntity() when $default != null:
return $default(_that.isActive,_that.userType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorEntity implements DoctorEntity {
  const _DoctorEntity({this.isActive = false, this.userType = UserType.doctor});
  factory _DoctorEntity.fromJson(Map<String, dynamic> json) => _$DoctorEntityFromJson(json);

@override@JsonKey() final  bool isActive;
@override@JsonKey() final  UserType userType;

/// Create a copy of DoctorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorEntityCopyWith<_DoctorEntity> get copyWith => __$DoctorEntityCopyWithImpl<_DoctorEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorEntity&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActive,userType);

@override
String toString() {
  return 'DoctorEntity(isActive: $isActive, userType: $userType)';
}


}

/// @nodoc
abstract mixin class _$DoctorEntityCopyWith<$Res> implements $DoctorEntityCopyWith<$Res> {
  factory _$DoctorEntityCopyWith(_DoctorEntity value, $Res Function(_DoctorEntity) _then) = __$DoctorEntityCopyWithImpl;
@override @useResult
$Res call({
 bool isActive, UserType userType
});




}
/// @nodoc
class __$DoctorEntityCopyWithImpl<$Res>
    implements _$DoctorEntityCopyWith<$Res> {
  __$DoctorEntityCopyWithImpl(this._self, this._then);

  final _DoctorEntity _self;
  final $Res Function(_DoctorEntity) _then;

/// Create a copy of DoctorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isActive = null,Object? userType = null,}) {
  return _then(_DoctorEntity(
isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,
  ));
}


}


/// @nodoc
mixin _$PharmacistEntity {

 String get idCardNumber; bool get isActive; UserType get userType;
/// Create a copy of PharmacistEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistEntityCopyWith<PharmacistEntity> get copyWith => _$PharmacistEntityCopyWithImpl<PharmacistEntity>(this as PharmacistEntity, _$identity);

  /// Serializes this PharmacistEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacistEntity&&(identical(other.idCardNumber, idCardNumber) || other.idCardNumber == idCardNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idCardNumber,isActive,userType);

@override
String toString() {
  return 'PharmacistEntity(idCardNumber: $idCardNumber, isActive: $isActive, userType: $userType)';
}


}

/// @nodoc
abstract mixin class $PharmacistEntityCopyWith<$Res>  {
  factory $PharmacistEntityCopyWith(PharmacistEntity value, $Res Function(PharmacistEntity) _then) = _$PharmacistEntityCopyWithImpl;
@useResult
$Res call({
 String idCardNumber, bool isActive, UserType userType
});




}
/// @nodoc
class _$PharmacistEntityCopyWithImpl<$Res>
    implements $PharmacistEntityCopyWith<$Res> {
  _$PharmacistEntityCopyWithImpl(this._self, this._then);

  final PharmacistEntity _self;
  final $Res Function(PharmacistEntity) _then;

/// Create a copy of PharmacistEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idCardNumber = null,Object? isActive = null,Object? userType = null,}) {
  return _then(_self.copyWith(
idCardNumber: null == idCardNumber ? _self.idCardNumber : idCardNumber // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,
  ));
}

}


/// Adds pattern-matching-related methods to [PharmacistEntity].
extension PharmacistEntityPatterns on PharmacistEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacistEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacistEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacistEntity value)  $default,){
final _that = this;
switch (_that) {
case _PharmacistEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacistEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacistEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String idCardNumber,  bool isActive,  UserType userType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacistEntity() when $default != null:
return $default(_that.idCardNumber,_that.isActive,_that.userType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String idCardNumber,  bool isActive,  UserType userType)  $default,) {final _that = this;
switch (_that) {
case _PharmacistEntity():
return $default(_that.idCardNumber,_that.isActive,_that.userType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String idCardNumber,  bool isActive,  UserType userType)?  $default,) {final _that = this;
switch (_that) {
case _PharmacistEntity() when $default != null:
return $default(_that.idCardNumber,_that.isActive,_that.userType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PharmacistEntity implements PharmacistEntity {
  const _PharmacistEntity({this.idCardNumber = '', this.isActive = false, this.userType = UserType.pharmacist});
  factory _PharmacistEntity.fromJson(Map<String, dynamic> json) => _$PharmacistEntityFromJson(json);

@override@JsonKey() final  String idCardNumber;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  UserType userType;

/// Create a copy of PharmacistEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacistEntityCopyWith<_PharmacistEntity> get copyWith => __$PharmacistEntityCopyWithImpl<_PharmacistEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacistEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PharmacistEntity&&(identical(other.idCardNumber, idCardNumber) || other.idCardNumber == idCardNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idCardNumber,isActive,userType);

@override
String toString() {
  return 'PharmacistEntity(idCardNumber: $idCardNumber, isActive: $isActive, userType: $userType)';
}


}

/// @nodoc
abstract mixin class _$PharmacistEntityCopyWith<$Res> implements $PharmacistEntityCopyWith<$Res> {
  factory _$PharmacistEntityCopyWith(_PharmacistEntity value, $Res Function(_PharmacistEntity) _then) = __$PharmacistEntityCopyWithImpl;
@override @useResult
$Res call({
 String idCardNumber, bool isActive, UserType userType
});




}
/// @nodoc
class __$PharmacistEntityCopyWithImpl<$Res>
    implements _$PharmacistEntityCopyWith<$Res> {
  __$PharmacistEntityCopyWithImpl(this._self, this._then);

  final _PharmacistEntity _self;
  final $Res Function(_PharmacistEntity) _then;

/// Create a copy of PharmacistEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idCardNumber = null,Object? isActive = null,Object? userType = null,}) {
  return _then(_PharmacistEntity(
idCardNumber: null == idCardNumber ? _self.idCardNumber : idCardNumber // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,
  ));
}


}


/// @nodoc
mixin _$PatientEntity {

 String get name; UserType get userType; String get phoneNumber; String get idCardNumber; bool get isActive;
/// Create a copy of PatientEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientEntityCopyWith<PatientEntity> get copyWith => _$PatientEntityCopyWithImpl<PatientEntity>(this as PatientEntity, _$identity);

  /// Serializes this PatientEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.idCardNumber, idCardNumber) || other.idCardNumber == idCardNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,userType,phoneNumber,idCardNumber,isActive);

@override
String toString() {
  return 'PatientEntity(name: $name, userType: $userType, phoneNumber: $phoneNumber, idCardNumber: $idCardNumber, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PatientEntityCopyWith<$Res>  {
  factory $PatientEntityCopyWith(PatientEntity value, $Res Function(PatientEntity) _then) = _$PatientEntityCopyWithImpl;
@useResult
$Res call({
 String name, UserType userType, String phoneNumber, String idCardNumber, bool isActive
});




}
/// @nodoc
class _$PatientEntityCopyWithImpl<$Res>
    implements $PatientEntityCopyWith<$Res> {
  _$PatientEntityCopyWithImpl(this._self, this._then);

  final PatientEntity _self;
  final $Res Function(PatientEntity) _then;

/// Create a copy of PatientEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? userType = null,Object? phoneNumber = null,Object? idCardNumber = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,idCardNumber: null == idCardNumber ? _self.idCardNumber : idCardNumber // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientEntity].
extension PatientEntityPatterns on PatientEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientEntity value)  $default,){
final _that = this;
switch (_that) {
case _PatientEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PatientEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  UserType userType,  String phoneNumber,  String idCardNumber,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientEntity() when $default != null:
return $default(_that.name,_that.userType,_that.phoneNumber,_that.idCardNumber,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  UserType userType,  String phoneNumber,  String idCardNumber,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _PatientEntity():
return $default(_that.name,_that.userType,_that.phoneNumber,_that.idCardNumber,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  UserType userType,  String phoneNumber,  String idCardNumber,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _PatientEntity() when $default != null:
return $default(_that.name,_that.userType,_that.phoneNumber,_that.idCardNumber,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientEntity implements PatientEntity {
  const _PatientEntity({this.name = '', this.userType = UserType.patient, this.phoneNumber = '', this.idCardNumber = '', this.isActive = false});
  factory _PatientEntity.fromJson(Map<String, dynamic> json) => _$PatientEntityFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  UserType userType;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String idCardNumber;
@override@JsonKey() final  bool isActive;

/// Create a copy of PatientEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientEntityCopyWith<_PatientEntity> get copyWith => __$PatientEntityCopyWithImpl<_PatientEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.idCardNumber, idCardNumber) || other.idCardNumber == idCardNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,userType,phoneNumber,idCardNumber,isActive);

@override
String toString() {
  return 'PatientEntity(name: $name, userType: $userType, phoneNumber: $phoneNumber, idCardNumber: $idCardNumber, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PatientEntityCopyWith<$Res> implements $PatientEntityCopyWith<$Res> {
  factory _$PatientEntityCopyWith(_PatientEntity value, $Res Function(_PatientEntity) _then) = __$PatientEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, UserType userType, String phoneNumber, String idCardNumber, bool isActive
});




}
/// @nodoc
class __$PatientEntityCopyWithImpl<$Res>
    implements _$PatientEntityCopyWith<$Res> {
  __$PatientEntityCopyWithImpl(this._self, this._then);

  final _PatientEntity _self;
  final $Res Function(_PatientEntity) _then;

/// Create a copy of PatientEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? userType = null,Object? phoneNumber = null,Object? idCardNumber = null,Object? isActive = null,}) {
  return _then(_PatientEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,idCardNumber: null == idCardNumber ? _self.idCardNumber : idCardNumber // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AdminEntity {

 String get name; UserType get userType;
/// Create a copy of AdminEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminEntityCopyWith<AdminEntity> get copyWith => _$AdminEntityCopyWithImpl<AdminEntity>(this as AdminEntity, _$identity);

  /// Serializes this AdminEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,userType);

@override
String toString() {
  return 'AdminEntity(name: $name, userType: $userType)';
}


}

/// @nodoc
abstract mixin class $AdminEntityCopyWith<$Res>  {
  factory $AdminEntityCopyWith(AdminEntity value, $Res Function(AdminEntity) _then) = _$AdminEntityCopyWithImpl;
@useResult
$Res call({
 String name, UserType userType
});




}
/// @nodoc
class _$AdminEntityCopyWithImpl<$Res>
    implements $AdminEntityCopyWith<$Res> {
  _$AdminEntityCopyWithImpl(this._self, this._then);

  final AdminEntity _self;
  final $Res Function(AdminEntity) _then;

/// Create a copy of AdminEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? userType = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminEntity].
extension AdminEntityPatterns on AdminEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminEntity value)  $default,){
final _that = this;
switch (_that) {
case _AdminEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AdminEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  UserType userType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminEntity() when $default != null:
return $default(_that.name,_that.userType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  UserType userType)  $default,) {final _that = this;
switch (_that) {
case _AdminEntity():
return $default(_that.name,_that.userType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  UserType userType)?  $default,) {final _that = this;
switch (_that) {
case _AdminEntity() when $default != null:
return $default(_that.name,_that.userType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminEntity implements AdminEntity {
  const _AdminEntity({this.name = '', this.userType = UserType.admin});
  factory _AdminEntity.fromJson(Map<String, dynamic> json) => _$AdminEntityFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  UserType userType;

/// Create a copy of AdminEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminEntityCopyWith<_AdminEntity> get copyWith => __$AdminEntityCopyWithImpl<_AdminEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,userType);

@override
String toString() {
  return 'AdminEntity(name: $name, userType: $userType)';
}


}

/// @nodoc
abstract mixin class _$AdminEntityCopyWith<$Res> implements $AdminEntityCopyWith<$Res> {
  factory _$AdminEntityCopyWith(_AdminEntity value, $Res Function(_AdminEntity) _then) = __$AdminEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, UserType userType
});




}
/// @nodoc
class __$AdminEntityCopyWithImpl<$Res>
    implements _$AdminEntityCopyWith<$Res> {
  __$AdminEntityCopyWithImpl(this._self, this._then);

  final _AdminEntity _self;
  final $Res Function(_AdminEntity) _then;

/// Create a copy of AdminEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? userType = null,}) {
  return _then(_AdminEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,
  ));
}


}


/// @nodoc
mixin _$InitialAuthEntity {

 UserType get userType;
/// Create a copy of InitialAuthEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialAuthEntityCopyWith<InitialAuthEntity> get copyWith => _$InitialAuthEntityCopyWithImpl<InitialAuthEntity>(this as InitialAuthEntity, _$identity);

  /// Serializes this InitialAuthEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAuthEntity&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userType);

@override
String toString() {
  return 'InitialAuthEntity(userType: $userType)';
}


}

/// @nodoc
abstract mixin class $InitialAuthEntityCopyWith<$Res>  {
  factory $InitialAuthEntityCopyWith(InitialAuthEntity value, $Res Function(InitialAuthEntity) _then) = _$InitialAuthEntityCopyWithImpl;
@useResult
$Res call({
 UserType userType
});




}
/// @nodoc
class _$InitialAuthEntityCopyWithImpl<$Res>
    implements $InitialAuthEntityCopyWith<$Res> {
  _$InitialAuthEntityCopyWithImpl(this._self, this._then);

  final InitialAuthEntity _self;
  final $Res Function(InitialAuthEntity) _then;

/// Create a copy of InitialAuthEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userType = null,}) {
  return _then(_self.copyWith(
userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,
  ));
}

}


/// Adds pattern-matching-related methods to [InitialAuthEntity].
extension InitialAuthEntityPatterns on InitialAuthEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InitialAuthEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialAuthEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InitialAuthEntity value)  $default,){
final _that = this;
switch (_that) {
case _InitialAuthEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InitialAuthEntity value)?  $default,){
final _that = this;
switch (_that) {
case _InitialAuthEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserType userType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialAuthEntity() when $default != null:
return $default(_that.userType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserType userType)  $default,) {final _that = this;
switch (_that) {
case _InitialAuthEntity():
return $default(_that.userType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserType userType)?  $default,) {final _that = this;
switch (_that) {
case _InitialAuthEntity() when $default != null:
return $default(_that.userType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InitialAuthEntity implements InitialAuthEntity {
  const _InitialAuthEntity({this.userType = UserType.initial});
  factory _InitialAuthEntity.fromJson(Map<String, dynamic> json) => _$InitialAuthEntityFromJson(json);

@override@JsonKey() final  UserType userType;

/// Create a copy of InitialAuthEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialAuthEntityCopyWith<_InitialAuthEntity> get copyWith => __$InitialAuthEntityCopyWithImpl<_InitialAuthEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InitialAuthEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialAuthEntity&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userType);

@override
String toString() {
  return 'InitialAuthEntity(userType: $userType)';
}


}

/// @nodoc
abstract mixin class _$InitialAuthEntityCopyWith<$Res> implements $InitialAuthEntityCopyWith<$Res> {
  factory _$InitialAuthEntityCopyWith(_InitialAuthEntity value, $Res Function(_InitialAuthEntity) _then) = __$InitialAuthEntityCopyWithImpl;
@override @useResult
$Res call({
 UserType userType
});




}
/// @nodoc
class __$InitialAuthEntityCopyWithImpl<$Res>
    implements _$InitialAuthEntityCopyWith<$Res> {
  __$InitialAuthEntityCopyWithImpl(this._self, this._then);

  final _InitialAuthEntity _self;
  final $Res Function(_InitialAuthEntity) _then;

/// Create a copy of InitialAuthEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userType = null,}) {
  return _then(_InitialAuthEntity(
userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType,
  ));
}


}

/// @nodoc
mixin _$AppAuthState {

 Object get auth;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppAuthState&&const DeepCollectionEquality().equals(other.auth, auth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(auth));

@override
String toString() {
  return 'AppAuthState(auth: $auth)';
}


}

/// @nodoc
class $AppAuthStateCopyWith<$Res>  {
$AppAuthStateCopyWith(AppAuthState _, $Res Function(AppAuthState) __);
}


/// Adds pattern-matching-related methods to [AppAuthState].
extension AppAuthStatePatterns on AppAuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialAuth value)?  initial,TResult Function( PatientAuth value)?  patient,TResult Function( DoctorAuth value)?  doctor,TResult Function( PharmacistAuth value)?  pharmacisit,TResult Function( AdminAuth value)?  admin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialAuth() when initial != null:
return initial(_that);case PatientAuth() when patient != null:
return patient(_that);case DoctorAuth() when doctor != null:
return doctor(_that);case PharmacistAuth() when pharmacisit != null:
return pharmacisit(_that);case AdminAuth() when admin != null:
return admin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialAuth value)  initial,required TResult Function( PatientAuth value)  patient,required TResult Function( DoctorAuth value)  doctor,required TResult Function( PharmacistAuth value)  pharmacisit,required TResult Function( AdminAuth value)  admin,}){
final _that = this;
switch (_that) {
case InitialAuth():
return initial(_that);case PatientAuth():
return patient(_that);case DoctorAuth():
return doctor(_that);case PharmacistAuth():
return pharmacisit(_that);case AdminAuth():
return admin(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialAuth value)?  initial,TResult? Function( PatientAuth value)?  patient,TResult? Function( DoctorAuth value)?  doctor,TResult? Function( PharmacistAuth value)?  pharmacisit,TResult? Function( AdminAuth value)?  admin,}){
final _that = this;
switch (_that) {
case InitialAuth() when initial != null:
return initial(_that);case PatientAuth() when patient != null:
return patient(_that);case DoctorAuth() when doctor != null:
return doctor(_that);case PharmacistAuth() when pharmacisit != null:
return pharmacisit(_that);case AdminAuth() when admin != null:
return admin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( InitialAuthEntity auth)?  initial,TResult Function( PatientEntity auth)?  patient,TResult Function( DoctorEntity auth)?  doctor,TResult Function( PharmacistEntity auth)?  pharmacisit,TResult Function( AdminEntity auth)?  admin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialAuth() when initial != null:
return initial(_that.auth);case PatientAuth() when patient != null:
return patient(_that.auth);case DoctorAuth() when doctor != null:
return doctor(_that.auth);case PharmacistAuth() when pharmacisit != null:
return pharmacisit(_that.auth);case AdminAuth() when admin != null:
return admin(_that.auth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( InitialAuthEntity auth)  initial,required TResult Function( PatientEntity auth)  patient,required TResult Function( DoctorEntity auth)  doctor,required TResult Function( PharmacistEntity auth)  pharmacisit,required TResult Function( AdminEntity auth)  admin,}) {final _that = this;
switch (_that) {
case InitialAuth():
return initial(_that.auth);case PatientAuth():
return patient(_that.auth);case DoctorAuth():
return doctor(_that.auth);case PharmacistAuth():
return pharmacisit(_that.auth);case AdminAuth():
return admin(_that.auth);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( InitialAuthEntity auth)?  initial,TResult? Function( PatientEntity auth)?  patient,TResult? Function( DoctorEntity auth)?  doctor,TResult? Function( PharmacistEntity auth)?  pharmacisit,TResult? Function( AdminEntity auth)?  admin,}) {final _that = this;
switch (_that) {
case InitialAuth() when initial != null:
return initial(_that.auth);case PatientAuth() when patient != null:
return patient(_that.auth);case DoctorAuth() when doctor != null:
return doctor(_that.auth);case PharmacistAuth() when pharmacisit != null:
return pharmacisit(_that.auth);case AdminAuth() when admin != null:
return admin(_that.auth);case _:
  return null;

}
}

}

/// @nodoc


class InitialAuth implements AppAuthState {
   InitialAuth({this.auth = const InitialAuthEntity()});
  

@override@JsonKey() final  InitialAuthEntity auth;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialAuthCopyWith<InitialAuth> get copyWith => _$InitialAuthCopyWithImpl<InitialAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAuth&&(identical(other.auth, auth) || other.auth == auth));
}


@override
int get hashCode => Object.hash(runtimeType,auth);

@override
String toString() {
  return 'AppAuthState.initial(auth: $auth)';
}


}

/// @nodoc
abstract mixin class $InitialAuthCopyWith<$Res> implements $AppAuthStateCopyWith<$Res> {
  factory $InitialAuthCopyWith(InitialAuth value, $Res Function(InitialAuth) _then) = _$InitialAuthCopyWithImpl;
@useResult
$Res call({
 InitialAuthEntity auth
});


$InitialAuthEntityCopyWith<$Res> get auth;

}
/// @nodoc
class _$InitialAuthCopyWithImpl<$Res>
    implements $InitialAuthCopyWith<$Res> {
  _$InitialAuthCopyWithImpl(this._self, this._then);

  final InitialAuth _self;
  final $Res Function(InitialAuth) _then;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? auth = null,}) {
  return _then(InitialAuth(
auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as InitialAuthEntity,
  ));
}

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InitialAuthEntityCopyWith<$Res> get auth {
  
  return $InitialAuthEntityCopyWith<$Res>(_self.auth, (value) {
    return _then(_self.copyWith(auth: value));
  });
}
}

/// @nodoc


class PatientAuth implements AppAuthState {
   PatientAuth({required this.auth});
  

@override final  PatientEntity auth;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientAuthCopyWith<PatientAuth> get copyWith => _$PatientAuthCopyWithImpl<PatientAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientAuth&&(identical(other.auth, auth) || other.auth == auth));
}


@override
int get hashCode => Object.hash(runtimeType,auth);

@override
String toString() {
  return 'AppAuthState.patient(auth: $auth)';
}


}

/// @nodoc
abstract mixin class $PatientAuthCopyWith<$Res> implements $AppAuthStateCopyWith<$Res> {
  factory $PatientAuthCopyWith(PatientAuth value, $Res Function(PatientAuth) _then) = _$PatientAuthCopyWithImpl;
@useResult
$Res call({
 PatientEntity auth
});


$PatientEntityCopyWith<$Res> get auth;

}
/// @nodoc
class _$PatientAuthCopyWithImpl<$Res>
    implements $PatientAuthCopyWith<$Res> {
  _$PatientAuthCopyWithImpl(this._self, this._then);

  final PatientAuth _self;
  final $Res Function(PatientAuth) _then;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? auth = null,}) {
  return _then(PatientAuth(
auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as PatientEntity,
  ));
}

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientEntityCopyWith<$Res> get auth {
  
  return $PatientEntityCopyWith<$Res>(_self.auth, (value) {
    return _then(_self.copyWith(auth: value));
  });
}
}

/// @nodoc


class DoctorAuth implements AppAuthState {
   DoctorAuth({required this.auth});
  

@override final  DoctorEntity auth;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorAuthCopyWith<DoctorAuth> get copyWith => _$DoctorAuthCopyWithImpl<DoctorAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorAuth&&(identical(other.auth, auth) || other.auth == auth));
}


@override
int get hashCode => Object.hash(runtimeType,auth);

@override
String toString() {
  return 'AppAuthState.doctor(auth: $auth)';
}


}

/// @nodoc
abstract mixin class $DoctorAuthCopyWith<$Res> implements $AppAuthStateCopyWith<$Res> {
  factory $DoctorAuthCopyWith(DoctorAuth value, $Res Function(DoctorAuth) _then) = _$DoctorAuthCopyWithImpl;
@useResult
$Res call({
 DoctorEntity auth
});


$DoctorEntityCopyWith<$Res> get auth;

}
/// @nodoc
class _$DoctorAuthCopyWithImpl<$Res>
    implements $DoctorAuthCopyWith<$Res> {
  _$DoctorAuthCopyWithImpl(this._self, this._then);

  final DoctorAuth _self;
  final $Res Function(DoctorAuth) _then;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? auth = null,}) {
  return _then(DoctorAuth(
auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as DoctorEntity,
  ));
}

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorEntityCopyWith<$Res> get auth {
  
  return $DoctorEntityCopyWith<$Res>(_self.auth, (value) {
    return _then(_self.copyWith(auth: value));
  });
}
}

/// @nodoc


class PharmacistAuth implements AppAuthState {
   PharmacistAuth({required this.auth});
  

@override final  PharmacistEntity auth;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistAuthCopyWith<PharmacistAuth> get copyWith => _$PharmacistAuthCopyWithImpl<PharmacistAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacistAuth&&(identical(other.auth, auth) || other.auth == auth));
}


@override
int get hashCode => Object.hash(runtimeType,auth);

@override
String toString() {
  return 'AppAuthState.pharmacisit(auth: $auth)';
}


}

/// @nodoc
abstract mixin class $PharmacistAuthCopyWith<$Res> implements $AppAuthStateCopyWith<$Res> {
  factory $PharmacistAuthCopyWith(PharmacistAuth value, $Res Function(PharmacistAuth) _then) = _$PharmacistAuthCopyWithImpl;
@useResult
$Res call({
 PharmacistEntity auth
});


$PharmacistEntityCopyWith<$Res> get auth;

}
/// @nodoc
class _$PharmacistAuthCopyWithImpl<$Res>
    implements $PharmacistAuthCopyWith<$Res> {
  _$PharmacistAuthCopyWithImpl(this._self, this._then);

  final PharmacistAuth _self;
  final $Res Function(PharmacistAuth) _then;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? auth = null,}) {
  return _then(PharmacistAuth(
auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as PharmacistEntity,
  ));
}

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PharmacistEntityCopyWith<$Res> get auth {
  
  return $PharmacistEntityCopyWith<$Res>(_self.auth, (value) {
    return _then(_self.copyWith(auth: value));
  });
}
}

/// @nodoc


class AdminAuth implements AppAuthState {
   AdminAuth({required this.auth});
  

@override final  AdminEntity auth;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminAuthCopyWith<AdminAuth> get copyWith => _$AdminAuthCopyWithImpl<AdminAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminAuth&&(identical(other.auth, auth) || other.auth == auth));
}


@override
int get hashCode => Object.hash(runtimeType,auth);

@override
String toString() {
  return 'AppAuthState.admin(auth: $auth)';
}


}

/// @nodoc
abstract mixin class $AdminAuthCopyWith<$Res> implements $AppAuthStateCopyWith<$Res> {
  factory $AdminAuthCopyWith(AdminAuth value, $Res Function(AdminAuth) _then) = _$AdminAuthCopyWithImpl;
@useResult
$Res call({
 AdminEntity auth
});


$AdminEntityCopyWith<$Res> get auth;

}
/// @nodoc
class _$AdminAuthCopyWithImpl<$Res>
    implements $AdminAuthCopyWith<$Res> {
  _$AdminAuthCopyWithImpl(this._self, this._then);

  final AdminAuth _self;
  final $Res Function(AdminAuth) _then;

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? auth = null,}) {
  return _then(AdminAuth(
auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as AdminEntity,
  ));
}

/// Create a copy of AppAuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminEntityCopyWith<$Res> get auth {
  
  return $AdminEntityCopyWith<$Res>(_self.auth, (value) {
    return _then(_self.copyWith(auth: value));
  });
}
}


/// @nodoc
mixin _$Authstate {

 String get token;
/// Create a copy of Authstate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthstateCopyWith<Authstate> get copyWith => _$AuthstateCopyWithImpl<Authstate>(this as Authstate, _$identity);

  /// Serializes this Authstate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authstate&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'Authstate(token: $token)';
}


}

/// @nodoc
abstract mixin class $AuthstateCopyWith<$Res>  {
  factory $AuthstateCopyWith(Authstate value, $Res Function(Authstate) _then) = _$AuthstateCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$AuthstateCopyWithImpl<$Res>
    implements $AuthstateCopyWith<$Res> {
  _$AuthstateCopyWithImpl(this._self, this._then);

  final Authstate _self;
  final $Res Function(Authstate) _then;

/// Create a copy of Authstate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Authstate].
extension AuthstatePatterns on Authstate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Authstate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Authstate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Authstate value)  $default,){
final _that = this;
switch (_that) {
case _Authstate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Authstate value)?  $default,){
final _that = this;
switch (_that) {
case _Authstate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Authstate() when $default != null:
return $default(_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token)  $default,) {final _that = this;
switch (_that) {
case _Authstate():
return $default(_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token)?  $default,) {final _that = this;
switch (_that) {
case _Authstate() when $default != null:
return $default(_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Authstate implements Authstate {
  const _Authstate({required this.token});
  factory _Authstate.fromJson(Map<String, dynamic> json) => _$AuthstateFromJson(json);

@override final  String token;

/// Create a copy of Authstate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthstateCopyWith<_Authstate> get copyWith => __$AuthstateCopyWithImpl<_Authstate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthstateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authstate&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'Authstate(token: $token)';
}


}

/// @nodoc
abstract mixin class _$AuthstateCopyWith<$Res> implements $AuthstateCopyWith<$Res> {
  factory _$AuthstateCopyWith(_Authstate value, $Res Function(_Authstate) _then) = __$AuthstateCopyWithImpl;
@override @useResult
$Res call({
 String token
});




}
/// @nodoc
class __$AuthstateCopyWithImpl<$Res>
    implements _$AuthstateCopyWith<$Res> {
  __$AuthstateCopyWithImpl(this._self, this._then);

  final _Authstate _self;
  final $Res Function(_Authstate) _then;

/// Create a copy of Authstate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_Authstate(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
