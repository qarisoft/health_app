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
mixin _$IdName {

 String get name; int get id;
/// Create a copy of IdName
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdNameCopyWith<IdName> get copyWith => _$IdNameCopyWithImpl<IdName>(this as IdName, _$identity);

  /// Serializes this IdName to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdName&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id);

@override
String toString() {
  return 'IdName(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class $IdNameCopyWith<$Res>  {
  factory $IdNameCopyWith(IdName value, $Res Function(IdName) _then) = _$IdNameCopyWithImpl;
@useResult
$Res call({
 String name, int id
});




}
/// @nodoc
class _$IdNameCopyWithImpl<$Res>
    implements $IdNameCopyWith<$Res> {
  _$IdNameCopyWithImpl(this._self, this._then);

  final IdName _self;
  final $Res Function(IdName) _then;

/// Create a copy of IdName
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? id = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IdName].
extension IdNamePatterns on IdName {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdName value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdName() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdName value)  $default,){
final _that = this;
switch (_that) {
case _IdName():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdName value)?  $default,){
final _that = this;
switch (_that) {
case _IdName() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdName() when $default != null:
return $default(_that.name,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int id)  $default,) {final _that = this;
switch (_that) {
case _IdName():
return $default(_that.name,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int id)?  $default,) {final _that = this;
switch (_that) {
case _IdName() when $default != null:
return $default(_that.name,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdName implements IdName {
   _IdName({required this.name, required this.id});
  factory _IdName.fromJson(Map<String, dynamic> json) => _$IdNameFromJson(json);

@override final  String name;
@override final  int id;

/// Create a copy of IdName
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdNameCopyWith<_IdName> get copyWith => __$IdNameCopyWithImpl<_IdName>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdNameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdName&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id);

@override
String toString() {
  return 'IdName(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$IdNameCopyWith<$Res> implements $IdNameCopyWith<$Res> {
  factory _$IdNameCopyWith(_IdName value, $Res Function(_IdName) _then) = __$IdNameCopyWithImpl;
@override @useResult
$Res call({
 String name, int id
});




}
/// @nodoc
class __$IdNameCopyWithImpl<$Res>
    implements _$IdNameCopyWith<$Res> {
  __$IdNameCopyWithImpl(this._self, this._then);

  final _IdName _self;
  final $Res Function(_IdName) _then;

/// Create a copy of IdName
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? id = null,}) {
  return _then(_IdName(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PrescriptionFormState {

 int get patientId; IdName get patient; IdName get doctor; int get doctorId; String get diagnosis;// @Default('') String diagnosis,
 List<PrescriptionItemForm> get items; bool get isLoading; String? get errorMessage;
/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionFormStateCopyWith<PrescriptionFormState> get copyWith => _$PrescriptionFormStateCopyWithImpl<PrescriptionFormState>(this as PrescriptionFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionFormState&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,patientId,patient,doctor,doctorId,diagnosis,const DeepCollectionEquality().hash(items),isLoading,errorMessage);

@override
String toString() {
  return 'PrescriptionFormState(patientId: $patientId, patient: $patient, doctor: $doctor, doctorId: $doctorId, diagnosis: $diagnosis, items: $items, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PrescriptionFormStateCopyWith<$Res>  {
  factory $PrescriptionFormStateCopyWith(PrescriptionFormState value, $Res Function(PrescriptionFormState) _then) = _$PrescriptionFormStateCopyWithImpl;
@useResult
$Res call({
 int patientId, IdName patient, IdName doctor, int doctorId, String diagnosis, List<PrescriptionItemForm> items, bool isLoading, String? errorMessage
});


$IdNameCopyWith<$Res> get patient;$IdNameCopyWith<$Res> get doctor;

}
/// @nodoc
class _$PrescriptionFormStateCopyWithImpl<$Res>
    implements $PrescriptionFormStateCopyWith<$Res> {
  _$PrescriptionFormStateCopyWithImpl(this._self, this._then);

  final PrescriptionFormState _self;
  final $Res Function(PrescriptionFormState) _then;

/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patientId = null,Object? patient = null,Object? doctor = null,Object? doctorId = null,Object? diagnosis = null,Object? items = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as IdName,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as IdName,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItemForm>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res> get patient {
  
  return $IdNameCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res> get doctor {
  
  return $IdNameCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int patientId,  IdName patient,  IdName doctor,  int doctorId,  String diagnosis,  List<PrescriptionItemForm> items,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionFormState() when $default != null:
return $default(_that.patientId,_that.patient,_that.doctor,_that.doctorId,_that.diagnosis,_that.items,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int patientId,  IdName patient,  IdName doctor,  int doctorId,  String diagnosis,  List<PrescriptionItemForm> items,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionFormState():
return $default(_that.patientId,_that.patient,_that.doctor,_that.doctorId,_that.diagnosis,_that.items,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int patientId,  IdName patient,  IdName doctor,  int doctorId,  String diagnosis,  List<PrescriptionItemForm> items,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionFormState() when $default != null:
return $default(_that.patientId,_that.patient,_that.doctor,_that.doctorId,_that.diagnosis,_that.items,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PrescriptionFormState implements PrescriptionFormState {
  const _PrescriptionFormState({required this.patientId, required this.patient, required this.doctor, required this.doctorId, this.diagnosis = '', final  List<PrescriptionItemForm> items = const [], this.isLoading = false, this.errorMessage}): _items = items;
  

@override final  int patientId;
@override final  IdName patient;
@override final  IdName doctor;
@override final  int doctorId;
@override@JsonKey() final  String diagnosis;
// @Default('') String diagnosis,
 final  List<PrescriptionItemForm> _items;
// @Default('') String diagnosis,
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionFormState&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,patientId,patient,doctor,doctorId,diagnosis,const DeepCollectionEquality().hash(_items),isLoading,errorMessage);

@override
String toString() {
  return 'PrescriptionFormState(patientId: $patientId, patient: $patient, doctor: $doctor, doctorId: $doctorId, diagnosis: $diagnosis, items: $items, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionFormStateCopyWith<$Res> implements $PrescriptionFormStateCopyWith<$Res> {
  factory _$PrescriptionFormStateCopyWith(_PrescriptionFormState value, $Res Function(_PrescriptionFormState) _then) = __$PrescriptionFormStateCopyWithImpl;
@override @useResult
$Res call({
 int patientId, IdName patient, IdName doctor, int doctorId, String diagnosis, List<PrescriptionItemForm> items, bool isLoading, String? errorMessage
});


@override $IdNameCopyWith<$Res> get patient;@override $IdNameCopyWith<$Res> get doctor;

}
/// @nodoc
class __$PrescriptionFormStateCopyWithImpl<$Res>
    implements _$PrescriptionFormStateCopyWith<$Res> {
  __$PrescriptionFormStateCopyWithImpl(this._self, this._then);

  final _PrescriptionFormState _self;
  final $Res Function(_PrescriptionFormState) _then;

/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patientId = null,Object? patient = null,Object? doctor = null,Object? doctorId = null,Object? diagnosis = null,Object? items = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_PrescriptionFormState(
patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as IdName,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as IdName,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItemForm>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res> get patient {
  
  return $IdNameCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}/// Create a copy of PrescriptionFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res> get doctor {
  
  return $IdNameCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}

/// @nodoc
mixin _$PrescriptionItemForm {

 String get drugId;// @Default('') String drugName,
 IdName get drug; String get quantity; String get dosage; String get frequency; String get duration; String get instructions; bool get isExpanded;
/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionItemFormCopyWith<PrescriptionItemForm> get copyWith => _$PrescriptionItemFormCopyWithImpl<PrescriptionItemForm>(this as PrescriptionItemForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionItemForm&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,drugId,drug,quantity,dosage,frequency,duration,instructions,isExpanded);

@override
String toString() {
  return 'PrescriptionItemForm(drugId: $drugId, drug: $drug, quantity: $quantity, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, isExpanded: $isExpanded)';
}


}

/// @nodoc
abstract mixin class $PrescriptionItemFormCopyWith<$Res>  {
  factory $PrescriptionItemFormCopyWith(PrescriptionItemForm value, $Res Function(PrescriptionItemForm) _then) = _$PrescriptionItemFormCopyWithImpl;
@useResult
$Res call({
 String drugId, IdName drug, String quantity, String dosage, String frequency, String duration, String instructions, bool isExpanded
});


$IdNameCopyWith<$Res> get drug;

}
/// @nodoc
class _$PrescriptionItemFormCopyWithImpl<$Res>
    implements $PrescriptionItemFormCopyWith<$Res> {
  _$PrescriptionItemFormCopyWithImpl(this._self, this._then);

  final PrescriptionItemForm _self;
  final $Res Function(PrescriptionItemForm) _then;

/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drugId = null,Object? drug = null,Object? quantity = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,Object? isExpanded = null,}) {
  return _then(_self.copyWith(
drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as String,drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as IdName,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res> get drug {
  
  return $IdNameCopyWith<$Res>(_self.drug, (value) {
    return _then(_self.copyWith(drug: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String drugId,  IdName drug,  String quantity,  String dosage,  String frequency,  String duration,  String instructions,  bool isExpanded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionItemForm() when $default != null:
return $default(_that.drugId,_that.drug,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.isExpanded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String drugId,  IdName drug,  String quantity,  String dosage,  String frequency,  String duration,  String instructions,  bool isExpanded)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItemForm():
return $default(_that.drugId,_that.drug,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.isExpanded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String drugId,  IdName drug,  String quantity,  String dosage,  String frequency,  String duration,  String instructions,  bool isExpanded)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItemForm() when $default != null:
return $default(_that.drugId,_that.drug,_that.quantity,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.isExpanded);case _:
  return null;

}
}

}

/// @nodoc


class _PrescriptionItemForm extends PrescriptionItemForm {
  const _PrescriptionItemForm({this.drugId = '', required this.drug, this.quantity = '', this.dosage = '', this.frequency = '', this.duration = '', this.instructions = '', this.isExpanded = true}): super._();
  

@override@JsonKey() final  String drugId;
// @Default('') String drugName,
@override final  IdName drug;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionItemForm&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,drugId,drug,quantity,dosage,frequency,duration,instructions,isExpanded);

@override
String toString() {
  return 'PrescriptionItemForm(drugId: $drugId, drug: $drug, quantity: $quantity, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, isExpanded: $isExpanded)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionItemFormCopyWith<$Res> implements $PrescriptionItemFormCopyWith<$Res> {
  factory _$PrescriptionItemFormCopyWith(_PrescriptionItemForm value, $Res Function(_PrescriptionItemForm) _then) = __$PrescriptionItemFormCopyWithImpl;
@override @useResult
$Res call({
 String drugId, IdName drug, String quantity, String dosage, String frequency, String duration, String instructions, bool isExpanded
});


@override $IdNameCopyWith<$Res> get drug;

}
/// @nodoc
class __$PrescriptionItemFormCopyWithImpl<$Res>
    implements _$PrescriptionItemFormCopyWith<$Res> {
  __$PrescriptionItemFormCopyWithImpl(this._self, this._then);

  final _PrescriptionItemForm _self;
  final $Res Function(_PrescriptionItemForm) _then;

/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drugId = null,Object? drug = null,Object? quantity = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,Object? isExpanded = null,}) {
  return _then(_PrescriptionItemForm(
drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as String,drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as IdName,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PrescriptionItemForm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res> get drug {
  
  return $IdNameCopyWith<$Res>(_self.drug, (value) {
    return _then(_self.copyWith(drug: value));
  });
}
}

// dart format on
