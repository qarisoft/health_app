// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicalRecordRequest {

 int get patientId; String get diagnosis; String get notes; String get symptoms; String get treatment; DateTime get recordDate;
/// Create a copy of MedicalRecordRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicalRecordRequestCopyWith<MedicalRecordRequest> get copyWith => _$MedicalRecordRequestCopyWithImpl<MedicalRecordRequest>(this as MedicalRecordRequest, _$identity);

  /// Serializes this MedicalRecordRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicalRecordRequest&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.symptoms, symptoms) || other.symptoms == symptoms)&&(identical(other.treatment, treatment) || other.treatment == treatment)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,diagnosis,notes,symptoms,treatment,recordDate);

@override
String toString() {
  return 'MedicalRecordRequest(patientId: $patientId, diagnosis: $diagnosis, notes: $notes, symptoms: $symptoms, treatment: $treatment, recordDate: $recordDate)';
}


}

/// @nodoc
abstract mixin class $MedicalRecordRequestCopyWith<$Res>  {
  factory $MedicalRecordRequestCopyWith(MedicalRecordRequest value, $Res Function(MedicalRecordRequest) _then) = _$MedicalRecordRequestCopyWithImpl;
@useResult
$Res call({
 int patientId, String diagnosis, String notes, String symptoms, String treatment, DateTime recordDate
});




}
/// @nodoc
class _$MedicalRecordRequestCopyWithImpl<$Res>
    implements $MedicalRecordRequestCopyWith<$Res> {
  _$MedicalRecordRequestCopyWithImpl(this._self, this._then);

  final MedicalRecordRequest _self;
  final $Res Function(MedicalRecordRequest) _then;

/// Create a copy of MedicalRecordRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patientId = null,Object? diagnosis = null,Object? notes = null,Object? symptoms = null,Object? treatment = null,Object? recordDate = null,}) {
  return _then(_self.copyWith(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,symptoms: null == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as String,treatment: null == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as String,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicalRecordRequest].
extension MedicalRecordRequestPatterns on MedicalRecordRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicalRecordRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicalRecordRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicalRecordRequest value)  $default,){
final _that = this;
switch (_that) {
case _MedicalRecordRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicalRecordRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MedicalRecordRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int patientId,  String diagnosis,  String notes,  String symptoms,  String treatment,  DateTime recordDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicalRecordRequest() when $default != null:
return $default(_that.patientId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int patientId,  String diagnosis,  String notes,  String symptoms,  String treatment,  DateTime recordDate)  $default,) {final _that = this;
switch (_that) {
case _MedicalRecordRequest():
return $default(_that.patientId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int patientId,  String diagnosis,  String notes,  String symptoms,  String treatment,  DateTime recordDate)?  $default,) {final _that = this;
switch (_that) {
case _MedicalRecordRequest() when $default != null:
return $default(_that.patientId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MedicalRecordRequest implements MedicalRecordRequest {
   _MedicalRecordRequest({required this.patientId, required this.diagnosis, required this.notes, required this.symptoms, required this.treatment, required this.recordDate});
  factory _MedicalRecordRequest.fromJson(Map<String, dynamic> json) => _$MedicalRecordRequestFromJson(json);

@override final  int patientId;
@override final  String diagnosis;
@override final  String notes;
@override final  String symptoms;
@override final  String treatment;
@override final  DateTime recordDate;

/// Create a copy of MedicalRecordRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicalRecordRequestCopyWith<_MedicalRecordRequest> get copyWith => __$MedicalRecordRequestCopyWithImpl<_MedicalRecordRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicalRecordRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicalRecordRequest&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.symptoms, symptoms) || other.symptoms == symptoms)&&(identical(other.treatment, treatment) || other.treatment == treatment)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,diagnosis,notes,symptoms,treatment,recordDate);

@override
String toString() {
  return 'MedicalRecordRequest(patientId: $patientId, diagnosis: $diagnosis, notes: $notes, symptoms: $symptoms, treatment: $treatment, recordDate: $recordDate)';
}


}

/// @nodoc
abstract mixin class _$MedicalRecordRequestCopyWith<$Res> implements $MedicalRecordRequestCopyWith<$Res> {
  factory _$MedicalRecordRequestCopyWith(_MedicalRecordRequest value, $Res Function(_MedicalRecordRequest) _then) = __$MedicalRecordRequestCopyWithImpl;
@override @useResult
$Res call({
 int patientId, String diagnosis, String notes, String symptoms, String treatment, DateTime recordDate
});




}
/// @nodoc
class __$MedicalRecordRequestCopyWithImpl<$Res>
    implements _$MedicalRecordRequestCopyWith<$Res> {
  __$MedicalRecordRequestCopyWithImpl(this._self, this._then);

  final _MedicalRecordRequest _self;
  final $Res Function(_MedicalRecordRequest) _then;

/// Create a copy of MedicalRecordRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patientId = null,Object? diagnosis = null,Object? notes = null,Object? symptoms = null,Object? treatment = null,Object? recordDate = null,}) {
  return _then(_MedicalRecordRequest(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,symptoms: null == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as String,treatment: null == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as String,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$MedicalRecordList {

 List<MedicalRecordRequest> get records;
/// Create a copy of MedicalRecordList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicalRecordListCopyWith<MedicalRecordList> get copyWith => _$MedicalRecordListCopyWithImpl<MedicalRecordList>(this as MedicalRecordList, _$identity);

  /// Serializes this MedicalRecordList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicalRecordList&&const DeepCollectionEquality().equals(other.records, records));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(records));

@override
String toString() {
  return 'MedicalRecordList(records: $records)';
}


}

/// @nodoc
abstract mixin class $MedicalRecordListCopyWith<$Res>  {
  factory $MedicalRecordListCopyWith(MedicalRecordList value, $Res Function(MedicalRecordList) _then) = _$MedicalRecordListCopyWithImpl;
@useResult
$Res call({
 List<MedicalRecordRequest> records
});




}
/// @nodoc
class _$MedicalRecordListCopyWithImpl<$Res>
    implements $MedicalRecordListCopyWith<$Res> {
  _$MedicalRecordListCopyWithImpl(this._self, this._then);

  final MedicalRecordList _self;
  final $Res Function(MedicalRecordList) _then;

/// Create a copy of MedicalRecordList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? records = null,}) {
  return _then(_self.copyWith(
records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<MedicalRecordRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicalRecordList].
extension MedicalRecordListPatterns on MedicalRecordList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicalRecordList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicalRecordList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicalRecordList value)  $default,){
final _that = this;
switch (_that) {
case _MedicalRecordList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicalRecordList value)?  $default,){
final _that = this;
switch (_that) {
case _MedicalRecordList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MedicalRecordRequest> records)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicalRecordList() when $default != null:
return $default(_that.records);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MedicalRecordRequest> records)  $default,) {final _that = this;
switch (_that) {
case _MedicalRecordList():
return $default(_that.records);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MedicalRecordRequest> records)?  $default,) {final _that = this;
switch (_that) {
case _MedicalRecordList() when $default != null:
return $default(_that.records);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MedicalRecordList implements MedicalRecordList {
   _MedicalRecordList({required final  List<MedicalRecordRequest> records}): _records = records;
  factory _MedicalRecordList.fromJson(Map<String, dynamic> json) => _$MedicalRecordListFromJson(json);

 final  List<MedicalRecordRequest> _records;
@override List<MedicalRecordRequest> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}


/// Create a copy of MedicalRecordList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicalRecordListCopyWith<_MedicalRecordList> get copyWith => __$MedicalRecordListCopyWithImpl<_MedicalRecordList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicalRecordListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicalRecordList&&const DeepCollectionEquality().equals(other._records, _records));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_records));

@override
String toString() {
  return 'MedicalRecordList(records: $records)';
}


}

/// @nodoc
abstract mixin class _$MedicalRecordListCopyWith<$Res> implements $MedicalRecordListCopyWith<$Res> {
  factory _$MedicalRecordListCopyWith(_MedicalRecordList value, $Res Function(_MedicalRecordList) _then) = __$MedicalRecordListCopyWithImpl;
@override @useResult
$Res call({
 List<MedicalRecordRequest> records
});




}
/// @nodoc
class __$MedicalRecordListCopyWithImpl<$Res>
    implements _$MedicalRecordListCopyWith<$Res> {
  __$MedicalRecordListCopyWithImpl(this._self, this._then);

  final _MedicalRecordList _self;
  final $Res Function(_MedicalRecordList) _then;

/// Create a copy of MedicalRecordList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? records = null,}) {
  return _then(_MedicalRecordList(
records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<MedicalRecordRequest>,
  ));
}


}

// dart format on
