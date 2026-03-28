// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_medical_records.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatientMedicalRecord implements DiagnosticableTreeMixin {

 num get id; num get doctorId; String get diagnosis; String get notes; String get symptoms; String get treatment; String get recordDate; String get createdAt; String get doctorName; String get patientName;
/// Create a copy of PatientMedicalRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientMedicalRecordCopyWith<PatientMedicalRecord> get copyWith => _$PatientMedicalRecordCopyWithImpl<PatientMedicalRecord>(this as PatientMedicalRecord, _$identity);

  /// Serializes this PatientMedicalRecord to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PatientMedicalRecord'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('doctorId', doctorId))..add(DiagnosticsProperty('diagnosis', diagnosis))..add(DiagnosticsProperty('notes', notes))..add(DiagnosticsProperty('symptoms', symptoms))..add(DiagnosticsProperty('treatment', treatment))..add(DiagnosticsProperty('recordDate', recordDate))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('doctorName', doctorName))..add(DiagnosticsProperty('patientName', patientName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientMedicalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.symptoms, symptoms) || other.symptoms == symptoms)&&(identical(other.treatment, treatment) || other.treatment == treatment)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.patientName, patientName) || other.patientName == patientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,diagnosis,notes,symptoms,treatment,recordDate,createdAt,doctorName,patientName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PatientMedicalRecord(id: $id, doctorId: $doctorId, diagnosis: $diagnosis, notes: $notes, symptoms: $symptoms, treatment: $treatment, recordDate: $recordDate, createdAt: $createdAt, doctorName: $doctorName, patientName: $patientName)';
}


}

/// @nodoc
abstract mixin class $PatientMedicalRecordCopyWith<$Res>  {
  factory $PatientMedicalRecordCopyWith(PatientMedicalRecord value, $Res Function(PatientMedicalRecord) _then) = _$PatientMedicalRecordCopyWithImpl;
@useResult
$Res call({
 num id, num doctorId, String diagnosis, String notes, String symptoms, String treatment, String recordDate, String createdAt, String doctorName, String patientName
});




}
/// @nodoc
class _$PatientMedicalRecordCopyWithImpl<$Res>
    implements $PatientMedicalRecordCopyWith<$Res> {
  _$PatientMedicalRecordCopyWithImpl(this._self, this._then);

  final PatientMedicalRecord _self;
  final $Res Function(PatientMedicalRecord) _then;

/// Create a copy of PatientMedicalRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? diagnosis = null,Object? notes = null,Object? symptoms = null,Object? treatment = null,Object? recordDate = null,Object? createdAt = null,Object? doctorName = null,Object? patientName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as num,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as num,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,symptoms: null == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as String,treatment: null == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as String,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientMedicalRecord].
extension PatientMedicalRecordPatterns on PatientMedicalRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientMedicalRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientMedicalRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientMedicalRecord value)  $default,){
final _that = this;
switch (_that) {
case _PatientMedicalRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientMedicalRecord value)?  $default,){
final _that = this;
switch (_that) {
case _PatientMedicalRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num id,  num doctorId,  String diagnosis,  String notes,  String symptoms,  String treatment,  String recordDate,  String createdAt,  String doctorName,  String patientName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientMedicalRecord() when $default != null:
return $default(_that.id,_that.doctorId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate,_that.createdAt,_that.doctorName,_that.patientName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num id,  num doctorId,  String diagnosis,  String notes,  String symptoms,  String treatment,  String recordDate,  String createdAt,  String doctorName,  String patientName)  $default,) {final _that = this;
switch (_that) {
case _PatientMedicalRecord():
return $default(_that.id,_that.doctorId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate,_that.createdAt,_that.doctorName,_that.patientName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num id,  num doctorId,  String diagnosis,  String notes,  String symptoms,  String treatment,  String recordDate,  String createdAt,  String doctorName,  String patientName)?  $default,) {final _that = this;
switch (_that) {
case _PatientMedicalRecord() when $default != null:
return $default(_that.id,_that.doctorId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate,_that.createdAt,_that.doctorName,_that.patientName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientMedicalRecord with DiagnosticableTreeMixin implements PatientMedicalRecord {
  const _PatientMedicalRecord({this.id = 0, this.doctorId = 0, this.diagnosis = '', this.notes = '', this.symptoms = '', this.treatment = '', this.recordDate = '', this.createdAt = '', this.doctorName = '', this.patientName = ''});
  factory _PatientMedicalRecord.fromJson(Map<String, dynamic> json) => _$PatientMedicalRecordFromJson(json);

@override@JsonKey() final  num id;
@override@JsonKey() final  num doctorId;
@override@JsonKey() final  String diagnosis;
@override@JsonKey() final  String notes;
@override@JsonKey() final  String symptoms;
@override@JsonKey() final  String treatment;
@override@JsonKey() final  String recordDate;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String doctorName;
@override@JsonKey() final  String patientName;

/// Create a copy of PatientMedicalRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientMedicalRecordCopyWith<_PatientMedicalRecord> get copyWith => __$PatientMedicalRecordCopyWithImpl<_PatientMedicalRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientMedicalRecordToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PatientMedicalRecord'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('doctorId', doctorId))..add(DiagnosticsProperty('diagnosis', diagnosis))..add(DiagnosticsProperty('notes', notes))..add(DiagnosticsProperty('symptoms', symptoms))..add(DiagnosticsProperty('treatment', treatment))..add(DiagnosticsProperty('recordDate', recordDate))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('doctorName', doctorName))..add(DiagnosticsProperty('patientName', patientName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientMedicalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.symptoms, symptoms) || other.symptoms == symptoms)&&(identical(other.treatment, treatment) || other.treatment == treatment)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.patientName, patientName) || other.patientName == patientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,diagnosis,notes,symptoms,treatment,recordDate,createdAt,doctorName,patientName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PatientMedicalRecord(id: $id, doctorId: $doctorId, diagnosis: $diagnosis, notes: $notes, symptoms: $symptoms, treatment: $treatment, recordDate: $recordDate, createdAt: $createdAt, doctorName: $doctorName, patientName: $patientName)';
}


}

/// @nodoc
abstract mixin class _$PatientMedicalRecordCopyWith<$Res> implements $PatientMedicalRecordCopyWith<$Res> {
  factory _$PatientMedicalRecordCopyWith(_PatientMedicalRecord value, $Res Function(_PatientMedicalRecord) _then) = __$PatientMedicalRecordCopyWithImpl;
@override @useResult
$Res call({
 num id, num doctorId, String diagnosis, String notes, String symptoms, String treatment, String recordDate, String createdAt, String doctorName, String patientName
});




}
/// @nodoc
class __$PatientMedicalRecordCopyWithImpl<$Res>
    implements _$PatientMedicalRecordCopyWith<$Res> {
  __$PatientMedicalRecordCopyWithImpl(this._self, this._then);

  final _PatientMedicalRecord _self;
  final $Res Function(_PatientMedicalRecord) _then;

/// Create a copy of PatientMedicalRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? diagnosis = null,Object? notes = null,Object? symptoms = null,Object? treatment = null,Object? recordDate = null,Object? createdAt = null,Object? doctorName = null,Object? patientName = null,}) {
  return _then(_PatientMedicalRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as num,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as num,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,symptoms: null == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as String,treatment: null == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as String,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
