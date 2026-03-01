// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_prescription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionItem {

 int get drugId; String get drugName; int get quantity; String get dosage; String get frequency; String get duration; String get instructions;
/// Create a copy of PrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionItemCopyWith<PrescriptionItem> get copyWith => _$PrescriptionItemCopyWithImpl<PrescriptionItem>(this as PrescriptionItem, _$identity);

  /// Serializes this PrescriptionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionItem&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.drugName, drugName) || other.drugName == drugName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drugId,drugName,quantity,dosage,frequency,duration,instructions);

@override
String toString() {
  return 'PrescriptionItem(drugId: $drugId, drugName: $drugName, quantity: $quantity, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class $PrescriptionItemCopyWith<$Res>  {
  factory $PrescriptionItemCopyWith(PrescriptionItem value, $Res Function(PrescriptionItem) _then) = _$PrescriptionItemCopyWithImpl;
@useResult
$Res call({
 int drugId, String drugName, int quantity, String dosage, String frequency, String duration, String instructions
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
@pragma('vm:prefer-inline') @override $Res call({Object? drugId = null,Object? drugName = null,Object? quantity = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,}) {
  return _then(_self.copyWith(
drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as int,drugName: null == drugName ? _self.drugName : drugName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int drugId,  String drugName,  int quantity,  String dosage,  String frequency,  String duration,  String instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
return $default(_that.drugId,_that.drugName,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int drugId,  String drugName,  int quantity,  String dosage,  String frequency,  String duration,  String instructions)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItem():
return $default(_that.drugId,_that.drugName,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int drugId,  String drugName,  int quantity,  String dosage,  String frequency,  String duration,  String instructions)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
return $default(_that.drugId,_that.drugName,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionItem implements PrescriptionItem {
   _PrescriptionItem({required this.drugId, required this.drugName, required this.quantity, required this.dosage, required this.frequency, required this.duration, required this.instructions});
  factory _PrescriptionItem.fromJson(Map<String, dynamic> json) => _$PrescriptionItemFromJson(json);

@override final  int drugId;
@override final  String drugName;
@override final  int quantity;
@override final  String dosage;
@override final  String frequency;
@override final  String duration;
@override final  String instructions;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionItem&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.drugName, drugName) || other.drugName == drugName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drugId,drugName,quantity,dosage,frequency,duration,instructions);

@override
String toString() {
  return 'PrescriptionItem(drugId: $drugId, drugName: $drugName, quantity: $quantity, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionItemCopyWith<$Res> implements $PrescriptionItemCopyWith<$Res> {
  factory _$PrescriptionItemCopyWith(_PrescriptionItem value, $Res Function(_PrescriptionItem) _then) = __$PrescriptionItemCopyWithImpl;
@override @useResult
$Res call({
 int drugId, String drugName, int quantity, String dosage, String frequency, String duration, String instructions
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
@override @pragma('vm:prefer-inline') $Res call({Object? drugId = null,Object? drugName = null,Object? quantity = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,}) {
  return _then(_PrescriptionItem(
drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as int,drugName: null == drugName ? _self.drugName : drugName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreatePrescriptionRequest {

 int get patientId; int get doctorId; String get diagnosis; List<PrescriptionItem> get items;
/// Create a copy of CreatePrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePrescriptionRequestCopyWith<CreatePrescriptionRequest> get copyWith => _$CreatePrescriptionRequestCopyWithImpl<CreatePrescriptionRequest>(this as CreatePrescriptionRequest, _$identity);

  /// Serializes this CreatePrescriptionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePrescriptionRequest&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,doctorId,diagnosis,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CreatePrescriptionRequest(patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, items: $items)';
}


}

/// @nodoc
abstract mixin class $CreatePrescriptionRequestCopyWith<$Res>  {
  factory $CreatePrescriptionRequestCopyWith(CreatePrescriptionRequest value, $Res Function(CreatePrescriptionRequest) _then) = _$CreatePrescriptionRequestCopyWithImpl;
@useResult
$Res call({
 int patientId, int doctorId, String diagnosis, List<PrescriptionItem> items
});




}
/// @nodoc
class _$CreatePrescriptionRequestCopyWithImpl<$Res>
    implements $CreatePrescriptionRequestCopyWith<$Res> {
  _$CreatePrescriptionRequestCopyWithImpl(this._self, this._then);

  final CreatePrescriptionRequest _self;
  final $Res Function(CreatePrescriptionRequest) _then;

/// Create a copy of CreatePrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patientId = null,Object? doctorId = null,Object? diagnosis = null,Object? items = null,}) {
  return _then(_self.copyWith(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePrescriptionRequest].
extension CreatePrescriptionRequestPatterns on CreatePrescriptionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePrescriptionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePrescriptionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePrescriptionRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreatePrescriptionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePrescriptionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePrescriptionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int patientId,  int doctorId,  String diagnosis,  List<PrescriptionItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePrescriptionRequest() when $default != null:
return $default(_that.patientId,_that.doctorId,_that.diagnosis,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int patientId,  int doctorId,  String diagnosis,  List<PrescriptionItem> items)  $default,) {final _that = this;
switch (_that) {
case _CreatePrescriptionRequest():
return $default(_that.patientId,_that.doctorId,_that.diagnosis,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int patientId,  int doctorId,  String diagnosis,  List<PrescriptionItem> items)?  $default,) {final _that = this;
switch (_that) {
case _CreatePrescriptionRequest() when $default != null:
return $default(_that.patientId,_that.doctorId,_that.diagnosis,_that.items);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _CreatePrescriptionRequest implements CreatePrescriptionRequest {
   _CreatePrescriptionRequest({required this.patientId, required this.doctorId, required this.diagnosis, required final  List<PrescriptionItem> items}): _items = items;
  factory _CreatePrescriptionRequest.fromJson(Map<String, dynamic> json) => _$CreatePrescriptionRequestFromJson(json);

@override final  int patientId;
@override final  int doctorId;
@override final  String diagnosis;
 final  List<PrescriptionItem> _items;
@override List<PrescriptionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CreatePrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePrescriptionRequestCopyWith<_CreatePrescriptionRequest> get copyWith => __$CreatePrescriptionRequestCopyWithImpl<_CreatePrescriptionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePrescriptionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePrescriptionRequest&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,doctorId,diagnosis,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CreatePrescriptionRequest(patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CreatePrescriptionRequestCopyWith<$Res> implements $CreatePrescriptionRequestCopyWith<$Res> {
  factory _$CreatePrescriptionRequestCopyWith(_CreatePrescriptionRequest value, $Res Function(_CreatePrescriptionRequest) _then) = __$CreatePrescriptionRequestCopyWithImpl;
@override @useResult
$Res call({
 int patientId, int doctorId, String diagnosis, List<PrescriptionItem> items
});




}
/// @nodoc
class __$CreatePrescriptionRequestCopyWithImpl<$Res>
    implements _$CreatePrescriptionRequestCopyWith<$Res> {
  __$CreatePrescriptionRequestCopyWithImpl(this._self, this._then);

  final _CreatePrescriptionRequest _self;
  final $Res Function(_CreatePrescriptionRequest) _then;

/// Create a copy of CreatePrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patientId = null,Object? doctorId = null,Object? diagnosis = null,Object? items = null,}) {
  return _then(_CreatePrescriptionRequest(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItem>,
  ));
}


}

// dart format on
