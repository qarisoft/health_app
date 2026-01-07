// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Allergy {

 String get allergenName; String get reaction; String get severity;
/// Create a copy of Allergy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllergyCopyWith<Allergy> get copyWith => _$AllergyCopyWithImpl<Allergy>(this as Allergy, _$identity);

  /// Serializes this Allergy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Allergy&&(identical(other.allergenName, allergenName) || other.allergenName == allergenName)&&(identical(other.reaction, reaction) || other.reaction == reaction)&&(identical(other.severity, severity) || other.severity == severity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allergenName,reaction,severity);

@override
String toString() {
  return 'Allergy(allergenName: $allergenName, reaction: $reaction, severity: $severity)';
}


}

/// @nodoc
abstract mixin class $AllergyCopyWith<$Res>  {
  factory $AllergyCopyWith(Allergy value, $Res Function(Allergy) _then) = _$AllergyCopyWithImpl;
@useResult
$Res call({
 String allergenName, String reaction, String severity
});




}
/// @nodoc
class _$AllergyCopyWithImpl<$Res>
    implements $AllergyCopyWith<$Res> {
  _$AllergyCopyWithImpl(this._self, this._then);

  final Allergy _self;
  final $Res Function(Allergy) _then;

/// Create a copy of Allergy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allergenName = null,Object? reaction = null,Object? severity = null,}) {
  return _then(_self.copyWith(
allergenName: null == allergenName ? _self.allergenName : allergenName // ignore: cast_nullable_to_non_nullable
as String,reaction: null == reaction ? _self.reaction : reaction // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Allergy].
extension AllergyPatterns on Allergy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Allergy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Allergy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Allergy value)  $default,){
final _that = this;
switch (_that) {
case _Allergy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Allergy value)?  $default,){
final _that = this;
switch (_that) {
case _Allergy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String allergenName,  String reaction,  String severity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Allergy() when $default != null:
return $default(_that.allergenName,_that.reaction,_that.severity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String allergenName,  String reaction,  String severity)  $default,) {final _that = this;
switch (_that) {
case _Allergy():
return $default(_that.allergenName,_that.reaction,_that.severity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String allergenName,  String reaction,  String severity)?  $default,) {final _that = this;
switch (_that) {
case _Allergy() when $default != null:
return $default(_that.allergenName,_that.reaction,_that.severity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Allergy implements Allergy {
   _Allergy({this.allergenName = '', this.reaction = '', this.severity = ''});
  factory _Allergy.fromJson(Map<String, dynamic> json) => _$AllergyFromJson(json);

@override@JsonKey() final  String allergenName;
@override@JsonKey() final  String reaction;
@override@JsonKey() final  String severity;

/// Create a copy of Allergy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllergyCopyWith<_Allergy> get copyWith => __$AllergyCopyWithImpl<_Allergy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllergyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Allergy&&(identical(other.allergenName, allergenName) || other.allergenName == allergenName)&&(identical(other.reaction, reaction) || other.reaction == reaction)&&(identical(other.severity, severity) || other.severity == severity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allergenName,reaction,severity);

@override
String toString() {
  return 'Allergy(allergenName: $allergenName, reaction: $reaction, severity: $severity)';
}


}

/// @nodoc
abstract mixin class _$AllergyCopyWith<$Res> implements $AllergyCopyWith<$Res> {
  factory _$AllergyCopyWith(_Allergy value, $Res Function(_Allergy) _then) = __$AllergyCopyWithImpl;
@override @useResult
$Res call({
 String allergenName, String reaction, String severity
});




}
/// @nodoc
class __$AllergyCopyWithImpl<$Res>
    implements _$AllergyCopyWith<$Res> {
  __$AllergyCopyWithImpl(this._self, this._then);

  final _Allergy _self;
  final $Res Function(_Allergy) _then;

/// Create a copy of Allergy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allergenName = null,Object? reaction = null,Object? severity = null,}) {
  return _then(_Allergy(
allergenName: null == allergenName ? _self.allergenName : allergenName // ignore: cast_nullable_to_non_nullable
as String,reaction: null == reaction ? _self.reaction : reaction // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChronicDisease {

 String get diseaseName; String get description; String get diagnosisDate;
/// Create a copy of ChronicDisease
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChronicDiseaseCopyWith<ChronicDisease> get copyWith => _$ChronicDiseaseCopyWithImpl<ChronicDisease>(this as ChronicDisease, _$identity);

  /// Serializes this ChronicDisease to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChronicDisease&&(identical(other.diseaseName, diseaseName) || other.diseaseName == diseaseName)&&(identical(other.description, description) || other.description == description)&&(identical(other.diagnosisDate, diagnosisDate) || other.diagnosisDate == diagnosisDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,diseaseName,description,diagnosisDate);

@override
String toString() {
  return 'ChronicDisease(diseaseName: $diseaseName, description: $description, diagnosisDate: $diagnosisDate)';
}


}

/// @nodoc
abstract mixin class $ChronicDiseaseCopyWith<$Res>  {
  factory $ChronicDiseaseCopyWith(ChronicDisease value, $Res Function(ChronicDisease) _then) = _$ChronicDiseaseCopyWithImpl;
@useResult
$Res call({
 String diseaseName, String description, String diagnosisDate
});




}
/// @nodoc
class _$ChronicDiseaseCopyWithImpl<$Res>
    implements $ChronicDiseaseCopyWith<$Res> {
  _$ChronicDiseaseCopyWithImpl(this._self, this._then);

  final ChronicDisease _self;
  final $Res Function(ChronicDisease) _then;

/// Create a copy of ChronicDisease
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diseaseName = null,Object? description = null,Object? diagnosisDate = null,}) {
  return _then(_self.copyWith(
diseaseName: null == diseaseName ? _self.diseaseName : diseaseName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,diagnosisDate: null == diagnosisDate ? _self.diagnosisDate : diagnosisDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChronicDisease].
extension ChronicDiseasePatterns on ChronicDisease {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChronicDisease value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChronicDisease() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChronicDisease value)  $default,){
final _that = this;
switch (_that) {
case _ChronicDisease():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChronicDisease value)?  $default,){
final _that = this;
switch (_that) {
case _ChronicDisease() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String diseaseName,  String description,  String diagnosisDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChronicDisease() when $default != null:
return $default(_that.diseaseName,_that.description,_that.diagnosisDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String diseaseName,  String description,  String diagnosisDate)  $default,) {final _that = this;
switch (_that) {
case _ChronicDisease():
return $default(_that.diseaseName,_that.description,_that.diagnosisDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String diseaseName,  String description,  String diagnosisDate)?  $default,) {final _that = this;
switch (_that) {
case _ChronicDisease() when $default != null:
return $default(_that.diseaseName,_that.description,_that.diagnosisDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChronicDisease implements ChronicDisease {
   _ChronicDisease({this.diseaseName = '', this.description = '', this.diagnosisDate = ''});
  factory _ChronicDisease.fromJson(Map<String, dynamic> json) => _$ChronicDiseaseFromJson(json);

@override@JsonKey() final  String diseaseName;
@override@JsonKey() final  String description;
@override@JsonKey() final  String diagnosisDate;

/// Create a copy of ChronicDisease
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChronicDiseaseCopyWith<_ChronicDisease> get copyWith => __$ChronicDiseaseCopyWithImpl<_ChronicDisease>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChronicDiseaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChronicDisease&&(identical(other.diseaseName, diseaseName) || other.diseaseName == diseaseName)&&(identical(other.description, description) || other.description == description)&&(identical(other.diagnosisDate, diagnosisDate) || other.diagnosisDate == diagnosisDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,diseaseName,description,diagnosisDate);

@override
String toString() {
  return 'ChronicDisease(diseaseName: $diseaseName, description: $description, diagnosisDate: $diagnosisDate)';
}


}

/// @nodoc
abstract mixin class _$ChronicDiseaseCopyWith<$Res> implements $ChronicDiseaseCopyWith<$Res> {
  factory _$ChronicDiseaseCopyWith(_ChronicDisease value, $Res Function(_ChronicDisease) _then) = __$ChronicDiseaseCopyWithImpl;
@override @useResult
$Res call({
 String diseaseName, String description, String diagnosisDate
});




}
/// @nodoc
class __$ChronicDiseaseCopyWithImpl<$Res>
    implements _$ChronicDiseaseCopyWith<$Res> {
  __$ChronicDiseaseCopyWithImpl(this._self, this._then);

  final _ChronicDisease _self;
  final $Res Function(_ChronicDisease) _then;

/// Create a copy of ChronicDisease
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diseaseName = null,Object? description = null,Object? diagnosisDate = null,}) {
  return _then(_ChronicDisease(
diseaseName: null == diseaseName ? _self.diseaseName : diseaseName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,diagnosisDate: null == diagnosisDate ? _self.diagnosisDate : diagnosisDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Surgery {

 String get surgeryName; String get description; String get surgeryDate; String get hospital; String get surgeon;
/// Create a copy of Surgery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurgeryCopyWith<Surgery> get copyWith => _$SurgeryCopyWithImpl<Surgery>(this as Surgery, _$identity);

  /// Serializes this Surgery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Surgery&&(identical(other.surgeryName, surgeryName) || other.surgeryName == surgeryName)&&(identical(other.description, description) || other.description == description)&&(identical(other.surgeryDate, surgeryDate) || other.surgeryDate == surgeryDate)&&(identical(other.hospital, hospital) || other.hospital == hospital)&&(identical(other.surgeon, surgeon) || other.surgeon == surgeon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,surgeryName,description,surgeryDate,hospital,surgeon);

@override
String toString() {
  return 'Surgery(surgeryName: $surgeryName, description: $description, surgeryDate: $surgeryDate, hospital: $hospital, surgeon: $surgeon)';
}


}

/// @nodoc
abstract mixin class $SurgeryCopyWith<$Res>  {
  factory $SurgeryCopyWith(Surgery value, $Res Function(Surgery) _then) = _$SurgeryCopyWithImpl;
@useResult
$Res call({
 String surgeryName, String description, String surgeryDate, String hospital, String surgeon
});




}
/// @nodoc
class _$SurgeryCopyWithImpl<$Res>
    implements $SurgeryCopyWith<$Res> {
  _$SurgeryCopyWithImpl(this._self, this._then);

  final Surgery _self;
  final $Res Function(Surgery) _then;

/// Create a copy of Surgery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? surgeryName = null,Object? description = null,Object? surgeryDate = null,Object? hospital = null,Object? surgeon = null,}) {
  return _then(_self.copyWith(
surgeryName: null == surgeryName ? _self.surgeryName : surgeryName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,surgeryDate: null == surgeryDate ? _self.surgeryDate : surgeryDate // ignore: cast_nullable_to_non_nullable
as String,hospital: null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as String,surgeon: null == surgeon ? _self.surgeon : surgeon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Surgery].
extension SurgeryPatterns on Surgery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Surgery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Surgery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Surgery value)  $default,){
final _that = this;
switch (_that) {
case _Surgery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Surgery value)?  $default,){
final _that = this;
switch (_that) {
case _Surgery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String surgeryName,  String description,  String surgeryDate,  String hospital,  String surgeon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Surgery() when $default != null:
return $default(_that.surgeryName,_that.description,_that.surgeryDate,_that.hospital,_that.surgeon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String surgeryName,  String description,  String surgeryDate,  String hospital,  String surgeon)  $default,) {final _that = this;
switch (_that) {
case _Surgery():
return $default(_that.surgeryName,_that.description,_that.surgeryDate,_that.hospital,_that.surgeon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String surgeryName,  String description,  String surgeryDate,  String hospital,  String surgeon)?  $default,) {final _that = this;
switch (_that) {
case _Surgery() when $default != null:
return $default(_that.surgeryName,_that.description,_that.surgeryDate,_that.hospital,_that.surgeon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Surgery implements Surgery {
   _Surgery({this.surgeryName = '', this.description = '', this.surgeryDate = '', this.hospital = '', this.surgeon = ''});
  factory _Surgery.fromJson(Map<String, dynamic> json) => _$SurgeryFromJson(json);

@override@JsonKey() final  String surgeryName;
@override@JsonKey() final  String description;
@override@JsonKey() final  String surgeryDate;
@override@JsonKey() final  String hospital;
@override@JsonKey() final  String surgeon;

/// Create a copy of Surgery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SurgeryCopyWith<_Surgery> get copyWith => __$SurgeryCopyWithImpl<_Surgery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SurgeryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Surgery&&(identical(other.surgeryName, surgeryName) || other.surgeryName == surgeryName)&&(identical(other.description, description) || other.description == description)&&(identical(other.surgeryDate, surgeryDate) || other.surgeryDate == surgeryDate)&&(identical(other.hospital, hospital) || other.hospital == hospital)&&(identical(other.surgeon, surgeon) || other.surgeon == surgeon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,surgeryName,description,surgeryDate,hospital,surgeon);

@override
String toString() {
  return 'Surgery(surgeryName: $surgeryName, description: $description, surgeryDate: $surgeryDate, hospital: $hospital, surgeon: $surgeon)';
}


}

/// @nodoc
abstract mixin class _$SurgeryCopyWith<$Res> implements $SurgeryCopyWith<$Res> {
  factory _$SurgeryCopyWith(_Surgery value, $Res Function(_Surgery) _then) = __$SurgeryCopyWithImpl;
@override @useResult
$Res call({
 String surgeryName, String description, String surgeryDate, String hospital, String surgeon
});




}
/// @nodoc
class __$SurgeryCopyWithImpl<$Res>
    implements _$SurgeryCopyWith<$Res> {
  __$SurgeryCopyWithImpl(this._self, this._then);

  final _Surgery _self;
  final $Res Function(_Surgery) _then;

/// Create a copy of Surgery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? surgeryName = null,Object? description = null,Object? surgeryDate = null,Object? hospital = null,Object? surgeon = null,}) {
  return _then(_Surgery(
surgeryName: null == surgeryName ? _self.surgeryName : surgeryName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,surgeryDate: null == surgeryDate ? _self.surgeryDate : surgeryDate // ignore: cast_nullable_to_non_nullable
as String,hospital: null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as String,surgeon: null == surgeon ? _self.surgeon : surgeon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CurrentMedication {

 String get medicationName; String get dosage; String get frequency; String get duration; String get instructions;
/// Create a copy of CurrentMedication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentMedicationCopyWith<CurrentMedication> get copyWith => _$CurrentMedicationCopyWithImpl<CurrentMedication>(this as CurrentMedication, _$identity);

  /// Serializes this CurrentMedication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentMedication&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medicationName,dosage,frequency,duration,instructions);

@override
String toString() {
  return 'CurrentMedication(medicationName: $medicationName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class $CurrentMedicationCopyWith<$Res>  {
  factory $CurrentMedicationCopyWith(CurrentMedication value, $Res Function(CurrentMedication) _then) = _$CurrentMedicationCopyWithImpl;
@useResult
$Res call({
 String medicationName, String dosage, String frequency, String duration, String instructions
});




}
/// @nodoc
class _$CurrentMedicationCopyWithImpl<$Res>
    implements $CurrentMedicationCopyWith<$Res> {
  _$CurrentMedicationCopyWithImpl(this._self, this._then);

  final CurrentMedication _self;
  final $Res Function(CurrentMedication) _then;

/// Create a copy of CurrentMedication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? medicationName = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,}) {
  return _then(_self.copyWith(
medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentMedication].
extension CurrentMedicationPatterns on CurrentMedication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentMedication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentMedication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentMedication value)  $default,){
final _that = this;
switch (_that) {
case _CurrentMedication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentMedication value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentMedication() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String medicationName,  String dosage,  String frequency,  String duration,  String instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentMedication() when $default != null:
return $default(_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String medicationName,  String dosage,  String frequency,  String duration,  String instructions)  $default,) {final _that = this;
switch (_that) {
case _CurrentMedication():
return $default(_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String medicationName,  String dosage,  String frequency,  String duration,  String instructions)?  $default,) {final _that = this;
switch (_that) {
case _CurrentMedication() when $default != null:
return $default(_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentMedication implements CurrentMedication {
   _CurrentMedication({this.medicationName = '', this.dosage = '', this.frequency = '', this.duration = '', this.instructions = ''});
  factory _CurrentMedication.fromJson(Map<String, dynamic> json) => _$CurrentMedicationFromJson(json);

@override@JsonKey() final  String medicationName;
@override@JsonKey() final  String dosage;
@override@JsonKey() final  String frequency;
@override@JsonKey() final  String duration;
@override@JsonKey() final  String instructions;

/// Create a copy of CurrentMedication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentMedicationCopyWith<_CurrentMedication> get copyWith => __$CurrentMedicationCopyWithImpl<_CurrentMedication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentMedicationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentMedication&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medicationName,dosage,frequency,duration,instructions);

@override
String toString() {
  return 'CurrentMedication(medicationName: $medicationName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$CurrentMedicationCopyWith<$Res> implements $CurrentMedicationCopyWith<$Res> {
  factory _$CurrentMedicationCopyWith(_CurrentMedication value, $Res Function(_CurrentMedication) _then) = __$CurrentMedicationCopyWithImpl;
@override @useResult
$Res call({
 String medicationName, String dosage, String frequency, String duration, String instructions
});




}
/// @nodoc
class __$CurrentMedicationCopyWithImpl<$Res>
    implements _$CurrentMedicationCopyWith<$Res> {
  __$CurrentMedicationCopyWithImpl(this._self, this._then);

  final _CurrentMedication _self;
  final $Res Function(_CurrentMedication) _then;

/// Create a copy of CurrentMedication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? medicationName = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,}) {
  return _then(_CurrentMedication(
medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PatientProfile {

 String get fullName; String get dateOfBirth; int get gender; String get phoneNumber; String get email; String get address; int get bloodType; double get weight; double get height; String get emergencyContact; String get emergencyPhone; List<Allergy> get allergies; List<ChronicDisease> get chronicDiseases; List<Surgery> get surgeries; List<CurrentMedication> get currentMedications; String get notes;
/// Create a copy of PatientProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientProfileCopyWith<PatientProfile> get copyWith => _$PatientProfileCopyWithImpl<PatientProfile>(this as PatientProfile, _$identity);

  /// Serializes this PatientProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientProfile&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&const DeepCollectionEquality().equals(other.allergies, allergies)&&const DeepCollectionEquality().equals(other.chronicDiseases, chronicDiseases)&&const DeepCollectionEquality().equals(other.surgeries, surgeries)&&const DeepCollectionEquality().equals(other.currentMedications, currentMedications)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,dateOfBirth,gender,phoneNumber,email,address,bloodType,weight,height,emergencyContact,emergencyPhone,const DeepCollectionEquality().hash(allergies),const DeepCollectionEquality().hash(chronicDiseases),const DeepCollectionEquality().hash(surgeries),const DeepCollectionEquality().hash(currentMedications),notes);

@override
String toString() {
  return 'PatientProfile(fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, allergies: $allergies, chronicDiseases: $chronicDiseases, surgeries: $surgeries, currentMedications: $currentMedications, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $PatientProfileCopyWith<$Res>  {
  factory $PatientProfileCopyWith(PatientProfile value, $Res Function(PatientProfile) _then) = _$PatientProfileCopyWithImpl;
@useResult
$Res call({
 String fullName, String dateOfBirth, int gender, String phoneNumber, String email, String address, int bloodType, double weight, double height, String emergencyContact, String emergencyPhone, List<Allergy> allergies, List<ChronicDisease> chronicDiseases, List<Surgery> surgeries, List<CurrentMedication> currentMedications, String notes
});




}
/// @nodoc
class _$PatientProfileCopyWithImpl<$Res>
    implements $PatientProfileCopyWith<$Res> {
  _$PatientProfileCopyWithImpl(this._self, this._then);

  final PatientProfile _self;
  final $Res Function(PatientProfile) _then;

/// Create a copy of PatientProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = null,Object? address = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = null,Object? emergencyPhone = null,Object? allergies = null,Object? chronicDiseases = null,Object? surgeries = null,Object? currentMedications = null,Object? notes = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,emergencyPhone: null == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String,allergies: null == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<Allergy>,chronicDiseases: null == chronicDiseases ? _self.chronicDiseases : chronicDiseases // ignore: cast_nullable_to_non_nullable
as List<ChronicDisease>,surgeries: null == surgeries ? _self.surgeries : surgeries // ignore: cast_nullable_to_non_nullable
as List<Surgery>,currentMedications: null == currentMedications ? _self.currentMedications : currentMedications // ignore: cast_nullable_to_non_nullable
as List<CurrentMedication>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientProfile].
extension PatientProfilePatterns on PatientProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientProfile value)  $default,){
final _that = this;
switch (_that) {
case _PatientProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientProfile value)?  $default,){
final _that = this;
switch (_that) {
case _PatientProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  double weight,  double height,  String emergencyContact,  String emergencyPhone,  List<Allergy> allergies,  List<ChronicDisease> chronicDiseases,  List<Surgery> surgeries,  List<CurrentMedication> currentMedications,  String notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientProfile() when $default != null:
return $default(_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.allergies,_that.chronicDiseases,_that.surgeries,_that.currentMedications,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  double weight,  double height,  String emergencyContact,  String emergencyPhone,  List<Allergy> allergies,  List<ChronicDisease> chronicDiseases,  List<Surgery> surgeries,  List<CurrentMedication> currentMedications,  String notes)  $default,) {final _that = this;
switch (_that) {
case _PatientProfile():
return $default(_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.allergies,_that.chronicDiseases,_that.surgeries,_that.currentMedications,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String dateOfBirth,  int gender,  String phoneNumber,  String email,  String address,  int bloodType,  double weight,  double height,  String emergencyContact,  String emergencyPhone,  List<Allergy> allergies,  List<ChronicDisease> chronicDiseases,  List<Surgery> surgeries,  List<CurrentMedication> currentMedications,  String notes)?  $default,) {final _that = this;
switch (_that) {
case _PatientProfile() when $default != null:
return $default(_that.fullName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.allergies,_that.chronicDiseases,_that.surgeries,_that.currentMedications,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientProfile implements PatientProfile {
  const _PatientProfile({this.fullName = '', this.dateOfBirth = '', this.gender = 1, this.phoneNumber = '', this.email = '', this.address = '', this.bloodType = 1, this.weight = 0.0, this.height = 0.0, this.emergencyContact = '', this.emergencyPhone = '', final  List<Allergy> allergies = const [], final  List<ChronicDisease> chronicDiseases = const [], final  List<Surgery> surgeries = const [], final  List<CurrentMedication> currentMedications = const [], this.notes = ''}): _allergies = allergies,_chronicDiseases = chronicDiseases,_surgeries = surgeries,_currentMedications = currentMedications;
  factory _PatientProfile.fromJson(Map<String, dynamic> json) => _$PatientProfileFromJson(json);

@override@JsonKey() final  String fullName;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  int gender;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String email;
@override@JsonKey() final  String address;
@override@JsonKey() final  int bloodType;
@override@JsonKey() final  double weight;
@override@JsonKey() final  double height;
@override@JsonKey() final  String emergencyContact;
@override@JsonKey() final  String emergencyPhone;
 final  List<Allergy> _allergies;
@override@JsonKey() List<Allergy> get allergies {
  if (_allergies is EqualUnmodifiableListView) return _allergies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allergies);
}

 final  List<ChronicDisease> _chronicDiseases;
@override@JsonKey() List<ChronicDisease> get chronicDiseases {
  if (_chronicDiseases is EqualUnmodifiableListView) return _chronicDiseases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chronicDiseases);
}

 final  List<Surgery> _surgeries;
@override@JsonKey() List<Surgery> get surgeries {
  if (_surgeries is EqualUnmodifiableListView) return _surgeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_surgeries);
}

 final  List<CurrentMedication> _currentMedications;
@override@JsonKey() List<CurrentMedication> get currentMedications {
  if (_currentMedications is EqualUnmodifiableListView) return _currentMedications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentMedications);
}

@override@JsonKey() final  String notes;

/// Create a copy of PatientProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientProfileCopyWith<_PatientProfile> get copyWith => __$PatientProfileCopyWithImpl<_PatientProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientProfile&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&const DeepCollectionEquality().equals(other._allergies, _allergies)&&const DeepCollectionEquality().equals(other._chronicDiseases, _chronicDiseases)&&const DeepCollectionEquality().equals(other._surgeries, _surgeries)&&const DeepCollectionEquality().equals(other._currentMedications, _currentMedications)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,dateOfBirth,gender,phoneNumber,email,address,bloodType,weight,height,emergencyContact,emergencyPhone,const DeepCollectionEquality().hash(_allergies),const DeepCollectionEquality().hash(_chronicDiseases),const DeepCollectionEquality().hash(_surgeries),const DeepCollectionEquality().hash(_currentMedications),notes);

@override
String toString() {
  return 'PatientProfile(fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, allergies: $allergies, chronicDiseases: $chronicDiseases, surgeries: $surgeries, currentMedications: $currentMedications, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$PatientProfileCopyWith<$Res> implements $PatientProfileCopyWith<$Res> {
  factory _$PatientProfileCopyWith(_PatientProfile value, $Res Function(_PatientProfile) _then) = __$PatientProfileCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String dateOfBirth, int gender, String phoneNumber, String email, String address, int bloodType, double weight, double height, String emergencyContact, String emergencyPhone, List<Allergy> allergies, List<ChronicDisease> chronicDiseases, List<Surgery> surgeries, List<CurrentMedication> currentMedications, String notes
});




}
/// @nodoc
class __$PatientProfileCopyWithImpl<$Res>
    implements _$PatientProfileCopyWith<$Res> {
  __$PatientProfileCopyWithImpl(this._self, this._then);

  final _PatientProfile _self;
  final $Res Function(_PatientProfile) _then;

/// Create a copy of PatientProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = null,Object? address = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = null,Object? emergencyPhone = null,Object? allergies = null,Object? chronicDiseases = null,Object? surgeries = null,Object? currentMedications = null,Object? notes = null,}) {
  return _then(_PatientProfile(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,emergencyPhone: null == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String,allergies: null == allergies ? _self._allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<Allergy>,chronicDiseases: null == chronicDiseases ? _self._chronicDiseases : chronicDiseases // ignore: cast_nullable_to_non_nullable
as List<ChronicDisease>,surgeries: null == surgeries ? _self._surgeries : surgeries // ignore: cast_nullable_to_non_nullable
as List<Surgery>,currentMedications: null == currentMedications ? _self._currentMedications : currentMedications // ignore: cast_nullable_to_non_nullable
as List<CurrentMedication>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
