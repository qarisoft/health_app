// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthRecord {

 String get accessToken; String get role; int get userId;
/// Create a copy of AuthRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRecordCopyWith<AuthRecord> get copyWith => _$AuthRecordCopyWithImpl<AuthRecord>(this as AuthRecord, _$identity);

  /// Serializes this AuthRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRecord&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.role, role) || other.role == role)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,role,userId);

@override
String toString() {
  return 'AuthRecord(accessToken: $accessToken, role: $role, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AuthRecordCopyWith<$Res>  {
  factory $AuthRecordCopyWith(AuthRecord value, $Res Function(AuthRecord) _then) = _$AuthRecordCopyWithImpl;
@useResult
$Res call({
 String accessToken, String role, int userId
});




}
/// @nodoc
class _$AuthRecordCopyWithImpl<$Res>
    implements $AuthRecordCopyWith<$Res> {
  _$AuthRecordCopyWithImpl(this._self, this._then);

  final AuthRecord _self;
  final $Res Function(AuthRecord) _then;

/// Create a copy of AuthRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? role = null,Object? userId = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthRecord].
extension AuthRecordPatterns on AuthRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthRecord value)  $default,){
final _that = this;
switch (_that) {
case _AuthRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthRecord value)?  $default,){
final _that = this;
switch (_that) {
case _AuthRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String role,  int userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthRecord() when $default != null:
return $default(_that.accessToken,_that.role,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String role,  int userId)  $default,) {final _that = this;
switch (_that) {
case _AuthRecord():
return $default(_that.accessToken,_that.role,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String role,  int userId)?  $default,) {final _that = this;
switch (_that) {
case _AuthRecord() when $default != null:
return $default(_that.accessToken,_that.role,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthRecord implements AuthRecord {
   _AuthRecord({required this.accessToken, required this.role, required this.userId});
  factory _AuthRecord.fromJson(Map<String, dynamic> json) => _$AuthRecordFromJson(json);

@override final  String accessToken;
@override final  String role;
@override final  int userId;

/// Create a copy of AuthRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthRecordCopyWith<_AuthRecord> get copyWith => __$AuthRecordCopyWithImpl<_AuthRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthRecord&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.role, role) || other.role == role)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,role,userId);

@override
String toString() {
  return 'AuthRecord(accessToken: $accessToken, role: $role, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$AuthRecordCopyWith<$Res> implements $AuthRecordCopyWith<$Res> {
  factory _$AuthRecordCopyWith(_AuthRecord value, $Res Function(_AuthRecord) _then) = __$AuthRecordCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String role, int userId
});




}
/// @nodoc
class __$AuthRecordCopyWithImpl<$Res>
    implements _$AuthRecordCopyWith<$Res> {
  __$AuthRecordCopyWithImpl(this._self, this._then);

  final _AuthRecord _self;
  final $Res Function(_AuthRecord) _then;

/// Create a copy of AuthRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? role = null,Object? userId = null,}) {
  return _then(_AuthRecord(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AuthRecordData {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRecordData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthRecordData()';
}


}

/// @nodoc
class $AuthRecordDataCopyWith<$Res>  {
$AuthRecordDataCopyWith(AuthRecordData _, $Res Function(AuthRecordData) __);
}


/// Adds pattern-matching-related methods to [AuthRecordData].
extension AuthRecordDataPatterns on AuthRecordData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialAuthRecordData value)?  initial,TResult Function( TAuthRecordData value)?  auth,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialAuthRecordData() when initial != null:
return initial(_that);case TAuthRecordData() when auth != null:
return auth(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialAuthRecordData value)  initial,required TResult Function( TAuthRecordData value)  auth,}){
final _that = this;
switch (_that) {
case InitialAuthRecordData():
return initial(_that);case TAuthRecordData():
return auth(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialAuthRecordData value)?  initial,TResult? Function( TAuthRecordData value)?  auth,}){
final _that = this;
switch (_that) {
case InitialAuthRecordData() when initial != null:
return initial(_that);case TAuthRecordData() when auth != null:
return auth(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( AuthRecord record)?  auth,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialAuthRecordData() when initial != null:
return initial();case TAuthRecordData() when auth != null:
return auth(_that.record);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( AuthRecord record)  auth,}) {final _that = this;
switch (_that) {
case InitialAuthRecordData():
return initial();case TAuthRecordData():
return auth(_that.record);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( AuthRecord record)?  auth,}) {final _that = this;
switch (_that) {
case InitialAuthRecordData() when initial != null:
return initial();case TAuthRecordData() when auth != null:
return auth(_that.record);case _:
  return null;

}
}

}

/// @nodoc


class InitialAuthRecordData implements AuthRecordData {
   InitialAuthRecordData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAuthRecordData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthRecordData.initial()';
}


}




/// @nodoc


class TAuthRecordData implements AuthRecordData {
   TAuthRecordData({required this.record});
  

 final  AuthRecord record;

/// Create a copy of AuthRecordData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TAuthRecordDataCopyWith<TAuthRecordData> get copyWith => _$TAuthRecordDataCopyWithImpl<TAuthRecordData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TAuthRecordData&&(identical(other.record, record) || other.record == record));
}


@override
int get hashCode => Object.hash(runtimeType,record);

@override
String toString() {
  return 'AuthRecordData.auth(record: $record)';
}


}

/// @nodoc
abstract mixin class $TAuthRecordDataCopyWith<$Res> implements $AuthRecordDataCopyWith<$Res> {
  factory $TAuthRecordDataCopyWith(TAuthRecordData value, $Res Function(TAuthRecordData) _then) = _$TAuthRecordDataCopyWithImpl;
@useResult
$Res call({
 AuthRecord record
});


$AuthRecordCopyWith<$Res> get record;

}
/// @nodoc
class _$TAuthRecordDataCopyWithImpl<$Res>
    implements $TAuthRecordDataCopyWith<$Res> {
  _$TAuthRecordDataCopyWithImpl(this._self, this._then);

  final TAuthRecordData _self;
  final $Res Function(TAuthRecordData) _then;

/// Create a copy of AuthRecordData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? record = null,}) {
  return _then(TAuthRecordData(
record: null == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as AuthRecord,
  ));
}

/// Create a copy of AuthRecordData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthRecordCopyWith<$Res> get record {
  
  return $AuthRecordCopyWith<$Res>(_self.record, (value) {
    return _then(_self.copyWith(record: value));
  });
}
}

// dart format on
