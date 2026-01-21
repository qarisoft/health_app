// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_rescription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionItem {

 int get drugId; int get quantity; String get dosage; String get frequency; String get duration; String? get instructions;
/// Create a copy of PrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionItemCopyWith<PrescriptionItem> get copyWith => _$PrescriptionItemCopyWithImpl<PrescriptionItem>(this as PrescriptionItem, _$identity);

  /// Serializes this PrescriptionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionItem&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drugId,quantity,dosage,frequency,duration,instructions);

@override
String toString() {
  return 'PrescriptionItem(drugId: $drugId, quantity: $quantity, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class $PrescriptionItemCopyWith<$Res>  {
  factory $PrescriptionItemCopyWith(PrescriptionItem value, $Res Function(PrescriptionItem) _then) = _$PrescriptionItemCopyWithImpl;
@useResult
$Res call({
 int drugId, int quantity, String dosage, String frequency, String duration, String? instructions
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
@pragma('vm:prefer-inline') @override $Res call({Object? drugId = null,Object? quantity = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = freezed,}) {
  return _then(_self.copyWith(
drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int drugId,  int quantity,  String dosage,  String frequency,  String duration,  String? instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
return $default(_that.drugId,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int drugId,  int quantity,  String dosage,  String frequency,  String duration,  String? instructions)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItem():
return $default(_that.drugId,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int drugId,  int quantity,  String dosage,  String frequency,  String duration,  String? instructions)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
return $default(_that.drugId,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionItem implements PrescriptionItem {
  const _PrescriptionItem({required this.drugId, required this.quantity, required this.dosage, required this.frequency, required this.duration, this.instructions});
  factory _PrescriptionItem.fromJson(Map<String, dynamic> json) => _$PrescriptionItemFromJson(json);

@override final  int drugId;
@override final  int quantity;
@override final  String dosage;
@override final  String frequency;
@override final  String duration;
@override final  String? instructions;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionItem&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drugId,quantity,dosage,frequency,duration,instructions);

@override
String toString() {
  return 'PrescriptionItem(drugId: $drugId, quantity: $quantity, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionItemCopyWith<$Res> implements $PrescriptionItemCopyWith<$Res> {
  factory _$PrescriptionItemCopyWith(_PrescriptionItem value, $Res Function(_PrescriptionItem) _then) = __$PrescriptionItemCopyWithImpl;
@override @useResult
$Res call({
 int drugId, int quantity, String dosage, String frequency, String duration, String? instructions
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
@override @pragma('vm:prefer-inline') $Res call({Object? drugId = null,Object? quantity = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = freezed,}) {
  return _then(_PrescriptionItem(
drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PrescriptionRequest {

 int get patientId; int get doctorId; String get diagnosis; List<PrescriptionItem> get items;
/// Create a copy of PrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionRequestCopyWith<PrescriptionRequest> get copyWith => _$PrescriptionRequestCopyWithImpl<PrescriptionRequest>(this as PrescriptionRequest, _$identity);

  /// Serializes this PrescriptionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionRequest&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,doctorId,diagnosis,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'PrescriptionRequest(patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, items: $items)';
}


}

/// @nodoc
abstract mixin class $PrescriptionRequestCopyWith<$Res>  {
  factory $PrescriptionRequestCopyWith(PrescriptionRequest value, $Res Function(PrescriptionRequest) _then) = _$PrescriptionRequestCopyWithImpl;
@useResult
$Res call({
 int patientId, int doctorId, String diagnosis, List<PrescriptionItem> items
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int patientId,  int doctorId,  String diagnosis,  List<PrescriptionItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionRequest() when $default != null:
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
case _PrescriptionRequest():
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
case _PrescriptionRequest() when $default != null:
return $default(_that.patientId,_that.doctorId,_that.diagnosis,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionRequest implements PrescriptionRequest {
  const _PrescriptionRequest({required this.patientId, required this.doctorId, required this.diagnosis, required final  List<PrescriptionItem> items}): _items = items;
  factory _PrescriptionRequest.fromJson(Map<String, dynamic> json) => _$PrescriptionRequestFromJson(json);

@override final  int patientId;
@override final  int doctorId;
@override final  String diagnosis;
 final  List<PrescriptionItem> _items;
@override List<PrescriptionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionRequest&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientId,doctorId,diagnosis,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PrescriptionRequest(patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionRequestCopyWith<$Res> implements $PrescriptionRequestCopyWith<$Res> {
  factory _$PrescriptionRequestCopyWith(_PrescriptionRequest value, $Res Function(_PrescriptionRequest) _then) = __$PrescriptionRequestCopyWithImpl;
@override @useResult
$Res call({
 int patientId, int doctorId, String diagnosis, List<PrescriptionItem> items
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
@override @pragma('vm:prefer-inline') $Res call({Object? patientId = null,Object? doctorId = null,Object? diagnosis = null,Object? items = null,}) {
  return _then(_PrescriptionRequest(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItem>,
  ));
}


}

/// @nodoc
mixin _$PrescriptionFormState {

 int get patientId; int get doctorId; String get diagnosis; List<PrescriptionItemForm> get items; bool get isLoading; String? get errorMessage;
/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionFormStateCopyWith<PrescriptionFormState> get copyWith => _$PrescriptionFormStateCopyWithImpl<PrescriptionFormState>(this as PrescriptionFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionFormState&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,patientId,doctorId,diagnosis,const DeepCollectionEquality().hash(items),isLoading,errorMessage);

@override
String toString() {
  return 'PrescriptionFormState(patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, items: $items, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PrescriptionFormStateCopyWith<$Res>  {
  factory $PrescriptionFormStateCopyWith(PrescriptionFormState value, $Res Function(PrescriptionFormState) _then) = _$PrescriptionFormStateCopyWithImpl;
@useResult
$Res call({
 int patientId, int doctorId, String diagnosis, List<PrescriptionItemForm> items, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$PrescriptionFormStateCopyWithImpl<$Res>
    implements $PrescriptionFormStateCopyWith<$Res> {
  _$PrescriptionFormStateCopyWithImpl(this._self, this._then);

  final PrescriptionFormState _self;
  final $Res Function(PrescriptionFormState) _then;

/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patientId = null,Object? doctorId = null,Object? diagnosis = null,Object? items = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItemForm>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionFormState].
extension PrescriptionFormStatePatterns on PrescriptionFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionFormState value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionFormState value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int patientId,  int doctorId,  String diagnosis,  List<PrescriptionItemForm> items,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionFormState() when $default != null:
return $default(_that.patientId,_that.doctorId,_that.diagnosis,_that.items,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int patientId,  int doctorId,  String diagnosis,  List<PrescriptionItemForm> items,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionFormState():
return $default(_that.patientId,_that.doctorId,_that.diagnosis,_that.items,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int patientId,  int doctorId,  String diagnosis,  List<PrescriptionItemForm> items,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionFormState() when $default != null:
return $default(_that.patientId,_that.doctorId,_that.diagnosis,_that.items,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PrescriptionFormState implements PrescriptionFormState {
  const _PrescriptionFormState({required this.patientId, required this.doctorId, this.diagnosis = '', final  List<PrescriptionItemForm> items = const [], this.isLoading = false, this.errorMessage}): _items = items;
  

@override final  int patientId;
@override final  int doctorId;
@override@JsonKey() final  String diagnosis;
 final  List<PrescriptionItemForm> _items;
@override@JsonKey() List<PrescriptionItemForm> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionFormStateCopyWith<_PrescriptionFormState> get copyWith => __$PrescriptionFormStateCopyWithImpl<_PrescriptionFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionFormState&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,patientId,doctorId,diagnosis,const DeepCollectionEquality().hash(_items),isLoading,errorMessage);

@override
String toString() {
  return 'PrescriptionFormState(patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, items: $items, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionFormStateCopyWith<$Res> implements $PrescriptionFormStateCopyWith<$Res> {
  factory _$PrescriptionFormStateCopyWith(_PrescriptionFormState value, $Res Function(_PrescriptionFormState) _then) = __$PrescriptionFormStateCopyWithImpl;
@override @useResult
$Res call({
 int patientId, int doctorId, String diagnosis, List<PrescriptionItemForm> items, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$PrescriptionFormStateCopyWithImpl<$Res>
    implements _$PrescriptionFormStateCopyWith<$Res> {
  __$PrescriptionFormStateCopyWithImpl(this._self, this._then);

  final _PrescriptionFormState _self;
  final $Res Function(_PrescriptionFormState) _then;

/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patientId = null,Object? doctorId = null,Object? diagnosis = null,Object? items = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_PrescriptionFormState(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItemForm>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PrescriptionItemForm {

 String get drugId; String get quantity; String get dosage; String get frequency; String get duration; String get instructions; bool get isExpanded;
/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionItemFormCopyWith<PrescriptionItemForm> get copyWith => _$PrescriptionItemFormCopyWithImpl<PrescriptionItemForm>(this as PrescriptionItemForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionItemForm&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,drugId,quantity,dosage,frequency,duration,instructions,isExpanded);

@override
String toString() {
  return 'PrescriptionItemForm(drugId: $drugId, quantity: $quantity, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, isExpanded: $isExpanded)';
}


}

/// @nodoc
abstract mixin class $PrescriptionItemFormCopyWith<$Res>  {
  factory $PrescriptionItemFormCopyWith(PrescriptionItemForm value, $Res Function(PrescriptionItemForm) _then) = _$PrescriptionItemFormCopyWithImpl;
@useResult
$Res call({
 String drugId, String quantity, String dosage, String frequency, String duration, String instructions, bool isExpanded
});




}
/// @nodoc
class _$PrescriptionItemFormCopyWithImpl<$Res>
    implements $PrescriptionItemFormCopyWith<$Res> {
  _$PrescriptionItemFormCopyWithImpl(this._self, this._then);

  final PrescriptionItemForm _self;
  final $Res Function(PrescriptionItemForm) _then;

/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drugId = null,Object? quantity = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,Object? isExpanded = null,}) {
  return _then(_self.copyWith(
drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionItemForm].
extension PrescriptionItemFormPatterns on PrescriptionItemForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionItemForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionItemForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionItemForm value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionItemForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionItemForm value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionItemForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String drugId,  String quantity,  String dosage,  String frequency,  String duration,  String instructions,  bool isExpanded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionItemForm() when $default != null:
return $default(_that.drugId,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.isExpanded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String drugId,  String quantity,  String dosage,  String frequency,  String duration,  String instructions,  bool isExpanded)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItemForm():
return $default(_that.drugId,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.isExpanded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String drugId,  String quantity,  String dosage,  String frequency,  String duration,  String instructions,  bool isExpanded)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItemForm() when $default != null:
return $default(_that.drugId,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.isExpanded);case _:
  return null;

}
}

}

/// @nodoc


class _PrescriptionItemForm extends PrescriptionItemForm {
  const _PrescriptionItemForm({this.drugId = '', this.quantity = '', this.dosage = '', this.frequency = '', this.duration = '', this.instructions = '', this.isExpanded = true}): super._();
  

@override@JsonKey() final  String drugId;
@override@JsonKey() final  String quantity;
@override@JsonKey() final  String dosage;
@override@JsonKey() final  String frequency;
@override@JsonKey() final  String duration;
@override@JsonKey() final  String instructions;
@override@JsonKey() final  bool isExpanded;

/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionItemFormCopyWith<_PrescriptionItemForm> get copyWith => __$PrescriptionItemFormCopyWithImpl<_PrescriptionItemForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionItemForm&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,drugId,quantity,dosage,frequency,duration,instructions,isExpanded);

@override
String toString() {
  return 'PrescriptionItemForm(drugId: $drugId, quantity: $quantity, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, isExpanded: $isExpanded)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionItemFormCopyWith<$Res> implements $PrescriptionItemFormCopyWith<$Res> {
  factory _$PrescriptionItemFormCopyWith(_PrescriptionItemForm value, $Res Function(_PrescriptionItemForm) _then) = __$PrescriptionItemFormCopyWithImpl;
@override @useResult
$Res call({
 String drugId, String quantity, String dosage, String frequency, String duration, String instructions, bool isExpanded
});




}
/// @nodoc
class __$PrescriptionItemFormCopyWithImpl<$Res>
    implements _$PrescriptionItemFormCopyWith<$Res> {
  __$PrescriptionItemFormCopyWithImpl(this._self, this._then);

  final _PrescriptionItemForm _self;
  final $Res Function(_PrescriptionItemForm) _then;

/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drugId = null,Object? quantity = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,Object? isExpanded = null,}) {
  return _then(_PrescriptionItemForm(
drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
