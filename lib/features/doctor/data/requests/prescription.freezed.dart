// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionItem {

 String get medicationName; String get dosage; String get frequency; String? get duration; String? get instructions; int get quantity;
/// Create a copy of PrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionItemCopyWith<PrescriptionItem> get copyWith => _$PrescriptionItemCopyWithImpl<PrescriptionItem>(this as PrescriptionItem, _$identity);

  /// Serializes this PrescriptionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionItem&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medicationName,dosage,frequency,duration,instructions,quantity);

@override
String toString() {
  return 'PrescriptionItem(medicationName: $medicationName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $PrescriptionItemCopyWith<$Res>  {
  factory $PrescriptionItemCopyWith(PrescriptionItem value, $Res Function(PrescriptionItem) _then) = _$PrescriptionItemCopyWithImpl;
@useResult
$Res call({
 String medicationName, String dosage, String frequency, String? duration, String? instructions, int quantity
});




}
/// @nodoc
class _$PrescriptionItemCopyWithImpl<$Res>
    implements $PrescriptionItemCopyWith<$Res> {
  _$PrescriptionItemCopyWithImpl(this._self, this._then);

  final PrescriptionItem _self;
  final $Res Function(PrescriptionItem) _then;

/// Create a copy of PrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? medicationName = null,Object? dosage = null,Object? frequency = null,Object? duration = freezed,Object? instructions = freezed,Object? quantity = null,}) {
  return _then(_self.copyWith(
medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionItem].
extension PrescriptionItemPatterns on PrescriptionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionItem value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionItem value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String medicationName,  String dosage,  String frequency,  String? duration,  String? instructions,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
return $default(_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String medicationName,  String dosage,  String frequency,  String? duration,  String? instructions,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItem():
return $default(_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String medicationName,  String dosage,  String frequency,  String? duration,  String? instructions,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
return $default(_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PrescriptionItem implements PrescriptionItem {
  const _PrescriptionItem({required this.medicationName, required this.dosage, required this.frequency, this.duration, this.instructions, this.quantity = 1});
  factory _PrescriptionItem.fromJson(Map<String, dynamic> json) => _$PrescriptionItemFromJson(json);

@override final  String medicationName;
@override final  String dosage;
@override final  String frequency;
@override final  String? duration;
@override final  String? instructions;
@override@JsonKey() final  int quantity;

/// Create a copy of PrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionItemCopyWith<_PrescriptionItem> get copyWith => __$PrescriptionItemCopyWithImpl<_PrescriptionItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionItem&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medicationName,dosage,frequency,duration,instructions,quantity);

@override
String toString() {
  return 'PrescriptionItem(medicationName: $medicationName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionItemCopyWith<$Res> implements $PrescriptionItemCopyWith<$Res> {
  factory _$PrescriptionItemCopyWith(_PrescriptionItem value, $Res Function(_PrescriptionItem) _then) = __$PrescriptionItemCopyWithImpl;
@override @useResult
$Res call({
 String medicationName, String dosage, String frequency, String? duration, String? instructions, int quantity
});




}
/// @nodoc
class __$PrescriptionItemCopyWithImpl<$Res>
    implements _$PrescriptionItemCopyWith<$Res> {
  __$PrescriptionItemCopyWithImpl(this._self, this._then);

  final _PrescriptionItem _self;
  final $Res Function(_PrescriptionItem) _then;

/// Create a copy of PrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? medicationName = null,Object? dosage = null,Object? frequency = null,Object? duration = freezed,Object? instructions = freezed,Object? quantity = null,}) {
  return _then(_PrescriptionItem(
medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PrescriptionRequest {

 int get patientId; String get diagnosis; String? get notes; List<PrescriptionItem> get items; DateTime? get prescriptionDate;
/// Create a copy of PrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionRequestCopyWith<PrescriptionRequest> get copyWith => _$PrescriptionRequestCopyWithImpl<PrescriptionRequest>(this as PrescriptionRequest, _$identity);

  /// Serializes this PrescriptionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionRequest&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.prescriptionDate, prescriptionDate) || other.prescriptionDate == prescriptionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,diagnosis,notes,const DeepCollectionEquality().hash(items),prescriptionDate);

@override
String toString() {
  return 'PrescriptionRequest(patientId: $patientId, diagnosis: $diagnosis, notes: $notes, items: $items, prescriptionDate: $prescriptionDate)';
}


}

/// @nodoc
abstract mixin class $PrescriptionRequestCopyWith<$Res>  {
  factory $PrescriptionRequestCopyWith(PrescriptionRequest value, $Res Function(PrescriptionRequest) _then) = _$PrescriptionRequestCopyWithImpl;
@useResult
$Res call({
 int patientId, String diagnosis, String? notes, List<PrescriptionItem> items, DateTime? prescriptionDate
});




}
/// @nodoc
class _$PrescriptionRequestCopyWithImpl<$Res>
    implements $PrescriptionRequestCopyWith<$Res> {
  _$PrescriptionRequestCopyWithImpl(this._self, this._then);

  final PrescriptionRequest _self;
  final $Res Function(PrescriptionRequest) _then;

/// Create a copy of PrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patientId = null,Object? diagnosis = null,Object? notes = freezed,Object? items = null,Object? prescriptionDate = freezed,}) {
  return _then(_self.copyWith(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItem>,prescriptionDate: freezed == prescriptionDate ? _self.prescriptionDate : prescriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionRequest].
extension PrescriptionRequestPatterns on PrescriptionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionRequest value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int patientId,  String diagnosis,  String? notes,  List<PrescriptionItem> items,  DateTime? prescriptionDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionRequest() when $default != null:
return $default(_that.patientId,_that.diagnosis,_that.notes,_that.items,_that.prescriptionDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int patientId,  String diagnosis,  String? notes,  List<PrescriptionItem> items,  DateTime? prescriptionDate)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionRequest():
return $default(_that.patientId,_that.diagnosis,_that.notes,_that.items,_that.prescriptionDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int patientId,  String diagnosis,  String? notes,  List<PrescriptionItem> items,  DateTime? prescriptionDate)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionRequest() when $default != null:
return $default(_that.patientId,_that.diagnosis,_that.notes,_that.items,_that.prescriptionDate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PrescriptionRequest implements PrescriptionRequest {
  const _PrescriptionRequest({required this.patientId, required this.diagnosis, this.notes, final  List<PrescriptionItem> items = const [], this.prescriptionDate}): _items = items;
  factory _PrescriptionRequest.fromJson(Map<String, dynamic> json) => _$PrescriptionRequestFromJson(json);

@override final  int patientId;
@override final  String diagnosis;
@override final  String? notes;
 final  List<PrescriptionItem> _items;
@override@JsonKey() List<PrescriptionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime? prescriptionDate;

/// Create a copy of PrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionRequestCopyWith<_PrescriptionRequest> get copyWith => __$PrescriptionRequestCopyWithImpl<_PrescriptionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionRequest&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.prescriptionDate, prescriptionDate) || other.prescriptionDate == prescriptionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,diagnosis,notes,const DeepCollectionEquality().hash(_items),prescriptionDate);

@override
String toString() {
  return 'PrescriptionRequest(patientId: $patientId, diagnosis: $diagnosis, notes: $notes, items: $items, prescriptionDate: $prescriptionDate)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionRequestCopyWith<$Res> implements $PrescriptionRequestCopyWith<$Res> {
  factory _$PrescriptionRequestCopyWith(_PrescriptionRequest value, $Res Function(_PrescriptionRequest) _then) = __$PrescriptionRequestCopyWithImpl;
@override @useResult
$Res call({
 int patientId, String diagnosis, String? notes, List<PrescriptionItem> items, DateTime? prescriptionDate
});




}
/// @nodoc
class __$PrescriptionRequestCopyWithImpl<$Res>
    implements _$PrescriptionRequestCopyWith<$Res> {
  __$PrescriptionRequestCopyWithImpl(this._self, this._then);

  final _PrescriptionRequest _self;
  final $Res Function(_PrescriptionRequest) _then;

/// Create a copy of PrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patientId = null,Object? diagnosis = null,Object? notes = freezed,Object? items = null,Object? prescriptionDate = freezed,}) {
  return _then(_PrescriptionRequest(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItem>,prescriptionDate: freezed == prescriptionDate ? _self.prescriptionDate : prescriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PrescriptionsList {

 List<PrescriptionRequest> get prescriptions;
/// Create a copy of PrescriptionsList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionsListCopyWith<PrescriptionsList> get copyWith => _$PrescriptionsListCopyWithImpl<PrescriptionsList>(this as PrescriptionsList, _$identity);

  /// Serializes this PrescriptionsList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionsList&&const DeepCollectionEquality().equals(other.prescriptions, prescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(prescriptions));

@override
String toString() {
  return 'PrescriptionsList(prescriptions: $prescriptions)';
}


}

/// @nodoc
abstract mixin class $PrescriptionsListCopyWith<$Res>  {
  factory $PrescriptionsListCopyWith(PrescriptionsList value, $Res Function(PrescriptionsList) _then) = _$PrescriptionsListCopyWithImpl;
@useResult
$Res call({
 List<PrescriptionRequest> prescriptions
});




}
/// @nodoc
class _$PrescriptionsListCopyWithImpl<$Res>
    implements $PrescriptionsListCopyWith<$Res> {
  _$PrescriptionsListCopyWithImpl(this._self, this._then);

  final PrescriptionsList _self;
  final $Res Function(PrescriptionsList) _then;

/// Create a copy of PrescriptionsList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prescriptions = null,}) {
  return _then(_self.copyWith(
prescriptions: null == prescriptions ? _self.prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as List<PrescriptionRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionsList].
extension PrescriptionsListPatterns on PrescriptionsList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionsList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionsList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionsList value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionsList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionsList value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionsList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PrescriptionRequest> prescriptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionsList() when $default != null:
return $default(_that.prescriptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PrescriptionRequest> prescriptions)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionsList():
return $default(_that.prescriptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PrescriptionRequest> prescriptions)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionsList() when $default != null:
return $default(_that.prescriptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionsList implements PrescriptionsList {
   _PrescriptionsList({required final  List<PrescriptionRequest> prescriptions}): _prescriptions = prescriptions;
  factory _PrescriptionsList.fromJson(Map<String, dynamic> json) => _$PrescriptionsListFromJson(json);

 final  List<PrescriptionRequest> _prescriptions;
@override List<PrescriptionRequest> get prescriptions {
  if (_prescriptions is EqualUnmodifiableListView) return _prescriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prescriptions);
}


/// Create a copy of PrescriptionsList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionsListCopyWith<_PrescriptionsList> get copyWith => __$PrescriptionsListCopyWithImpl<_PrescriptionsList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionsListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionsList&&const DeepCollectionEquality().equals(other._prescriptions, _prescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_prescriptions));

@override
String toString() {
  return 'PrescriptionsList(prescriptions: $prescriptions)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionsListCopyWith<$Res> implements $PrescriptionsListCopyWith<$Res> {
  factory _$PrescriptionsListCopyWith(_PrescriptionsList value, $Res Function(_PrescriptionsList) _then) = __$PrescriptionsListCopyWithImpl;
@override @useResult
$Res call({
 List<PrescriptionRequest> prescriptions
});




}
/// @nodoc
class __$PrescriptionsListCopyWithImpl<$Res>
    implements _$PrescriptionsListCopyWith<$Res> {
  __$PrescriptionsListCopyWithImpl(this._self, this._then);

  final _PrescriptionsList _self;
  final $Res Function(_PrescriptionsList) _then;

/// Create a copy of PrescriptionsList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prescriptions = null,}) {
  return _then(_PrescriptionsList(
prescriptions: null == prescriptions ? _self._prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as List<PrescriptionRequest>,
  ));
}


}

// dart format on
