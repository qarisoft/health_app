// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentPatient {

 int get patientId; String get fullName; String get patientCode; DateTime? get lastInteractionDate; String? get lastInteractionType;
/// Create a copy of RecentPatient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentPatientCopyWith<RecentPatient> get copyWith => _$RecentPatientCopyWithImpl<RecentPatient>(this as RecentPatient, _$identity);

  /// Serializes this RecentPatient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentPatient&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.patientCode, patientCode) || other.patientCode == patientCode)&&(identical(other.lastInteractionDate, lastInteractionDate) || other.lastInteractionDate == lastInteractionDate)&&(identical(other.lastInteractionType, lastInteractionType) || other.lastInteractionType == lastInteractionType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,fullName,patientCode,lastInteractionDate,lastInteractionType);

@override
String toString() {
  return 'RecentPatient(patientId: $patientId, fullName: $fullName, patientCode: $patientCode, lastInteractionDate: $lastInteractionDate, lastInteractionType: $lastInteractionType)';
}


}

/// @nodoc
abstract mixin class $RecentPatientCopyWith<$Res>  {
  factory $RecentPatientCopyWith(RecentPatient value, $Res Function(RecentPatient) _then) = _$RecentPatientCopyWithImpl;
@useResult
$Res call({
 int patientId, String fullName, String patientCode, DateTime? lastInteractionDate, String? lastInteractionType
});




}
/// @nodoc
class _$RecentPatientCopyWithImpl<$Res>
    implements $RecentPatientCopyWith<$Res> {
  _$RecentPatientCopyWithImpl(this._self, this._then);

  final RecentPatient _self;
  final $Res Function(RecentPatient) _then;

/// Create a copy of RecentPatient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patientId = null,Object? fullName = null,Object? patientCode = null,Object? lastInteractionDate = freezed,Object? lastInteractionType = freezed,}) {
  return _then(_self.copyWith(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,patientCode: null == patientCode ? _self.patientCode : patientCode // ignore: cast_nullable_to_non_nullable
as String,lastInteractionDate: freezed == lastInteractionDate ? _self.lastInteractionDate : lastInteractionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastInteractionType: freezed == lastInteractionType ? _self.lastInteractionType : lastInteractionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecentPatient].
extension RecentPatientPatterns on RecentPatient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentPatient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentPatient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentPatient value)  $default,){
final _that = this;
switch (_that) {
case _RecentPatient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentPatient value)?  $default,){
final _that = this;
switch (_that) {
case _RecentPatient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int patientId,  String fullName,  String patientCode,  DateTime? lastInteractionDate,  String? lastInteractionType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentPatient() when $default != null:
return $default(_that.patientId,_that.fullName,_that.patientCode,_that.lastInteractionDate,_that.lastInteractionType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int patientId,  String fullName,  String patientCode,  DateTime? lastInteractionDate,  String? lastInteractionType)  $default,) {final _that = this;
switch (_that) {
case _RecentPatient():
return $default(_that.patientId,_that.fullName,_that.patientCode,_that.lastInteractionDate,_that.lastInteractionType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int patientId,  String fullName,  String patientCode,  DateTime? lastInteractionDate,  String? lastInteractionType)?  $default,) {final _that = this;
switch (_that) {
case _RecentPatient() when $default != null:
return $default(_that.patientId,_that.fullName,_that.patientCode,_that.lastInteractionDate,_that.lastInteractionType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecentPatient implements RecentPatient {
   _RecentPatient({this.patientId = 0, this.fullName = 'full name', this.patientCode = 'patientCode', this.lastInteractionDate, this.lastInteractionType});
  factory _RecentPatient.fromJson(Map<String, dynamic> json) => _$RecentPatientFromJson(json);

@override@JsonKey() final  int patientId;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String patientCode;
@override final  DateTime? lastInteractionDate;
@override final  String? lastInteractionType;

/// Create a copy of RecentPatient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentPatientCopyWith<_RecentPatient> get copyWith => __$RecentPatientCopyWithImpl<_RecentPatient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecentPatientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentPatient&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.patientCode, patientCode) || other.patientCode == patientCode)&&(identical(other.lastInteractionDate, lastInteractionDate) || other.lastInteractionDate == lastInteractionDate)&&(identical(other.lastInteractionType, lastInteractionType) || other.lastInteractionType == lastInteractionType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,fullName,patientCode,lastInteractionDate,lastInteractionType);

@override
String toString() {
  return 'RecentPatient(patientId: $patientId, fullName: $fullName, patientCode: $patientCode, lastInteractionDate: $lastInteractionDate, lastInteractionType: $lastInteractionType)';
}


}

/// @nodoc
abstract mixin class _$RecentPatientCopyWith<$Res> implements $RecentPatientCopyWith<$Res> {
  factory _$RecentPatientCopyWith(_RecentPatient value, $Res Function(_RecentPatient) _then) = __$RecentPatientCopyWithImpl;
@override @useResult
$Res call({
 int patientId, String fullName, String patientCode, DateTime? lastInteractionDate, String? lastInteractionType
});




}
/// @nodoc
class __$RecentPatientCopyWithImpl<$Res>
    implements _$RecentPatientCopyWith<$Res> {
  __$RecentPatientCopyWithImpl(this._self, this._then);

  final _RecentPatient _self;
  final $Res Function(_RecentPatient) _then;

/// Create a copy of RecentPatient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patientId = null,Object? fullName = null,Object? patientCode = null,Object? lastInteractionDate = freezed,Object? lastInteractionType = freezed,}) {
  return _then(_RecentPatient(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,patientCode: null == patientCode ? _self.patientCode : patientCode // ignore: cast_nullable_to_non_nullable
as String,lastInteractionDate: freezed == lastInteractionDate ? _self.lastInteractionDate : lastInteractionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastInteractionType: freezed == lastInteractionType ? _self.lastInteractionType : lastInteractionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HomeResponse {

 List<RecentPatient> get data;
/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeResponseCopyWith<HomeResponse> get copyWith => _$HomeResponseCopyWithImpl<HomeResponse>(this as HomeResponse, _$identity);

  /// Serializes this HomeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'HomeResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $HomeResponseCopyWith<$Res>  {
  factory $HomeResponseCopyWith(HomeResponse value, $Res Function(HomeResponse) _then) = _$HomeResponseCopyWithImpl;
@useResult
$Res call({
 List<RecentPatient> data
});




}
/// @nodoc
class _$HomeResponseCopyWithImpl<$Res>
    implements $HomeResponseCopyWith<$Res> {
  _$HomeResponseCopyWithImpl(this._self, this._then);

  final HomeResponse _self;
  final $Res Function(HomeResponse) _then;

/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<RecentPatient>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeResponse].
extension HomeResponsePatterns on HomeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeResponse value)  $default,){
final _that = this;
switch (_that) {
case _HomeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HomeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RecentPatient> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RecentPatient> data)  $default,) {final _that = this;
switch (_that) {
case _HomeResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RecentPatient> data)?  $default,) {final _that = this;
switch (_that) {
case _HomeResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeResponse implements HomeResponse {
   _HomeResponse(final  List<RecentPatient> data): _data = data;
  factory _HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);

 final  List<RecentPatient> _data;
@override List<RecentPatient> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeResponseCopyWith<_HomeResponse> get copyWith => __$HomeResponseCopyWithImpl<_HomeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'HomeResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$HomeResponseCopyWith<$Res> implements $HomeResponseCopyWith<$Res> {
  factory _$HomeResponseCopyWith(_HomeResponse value, $Res Function(_HomeResponse) _then) = __$HomeResponseCopyWithImpl;
@override @useResult
$Res call({
 List<RecentPatient> data
});




}
/// @nodoc
class __$HomeResponseCopyWithImpl<$Res>
    implements _$HomeResponseCopyWith<$Res> {
  __$HomeResponseCopyWithImpl(this._self, this._then);

  final _HomeResponse _self;
  final $Res Function(_HomeResponse) _then;

/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_HomeResponse(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<RecentPatient>,
  ));
}


}

// dart format on
