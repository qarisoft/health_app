// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatientResponse {

 bool get success; String get message; Patient? get patient;
/// Create a copy of PatientResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientResponseCopyWith<PatientResponse> get copyWith => _$PatientResponseCopyWithImpl<PatientResponse>(this as PatientResponse, _$identity);

  /// Serializes this PatientResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.patient, patient) || other.patient == patient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,patient);

@override
String toString() {
  return 'PatientResponse(success: $success, message: $message, patient: $patient)';
}


}

/// @nodoc
abstract mixin class $PatientResponseCopyWith<$Res>  {
  factory $PatientResponseCopyWith(PatientResponse value, $Res Function(PatientResponse) _then) = _$PatientResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, Patient? patient
});


$PatientCopyWith<$Res>? get patient;

}
/// @nodoc
class _$PatientResponseCopyWithImpl<$Res>
    implements $PatientResponseCopyWith<$Res> {
  _$PatientResponseCopyWithImpl(this._self, this._then);

  final PatientResponse _self;
  final $Res Function(PatientResponse) _then;

/// Create a copy of PatientResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? patient = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as Patient?,
  ));
}
/// Create a copy of PatientResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientCopyWith<$Res>? get patient {
    if (_self.patient == null) {
    return null;
  }

  return $PatientCopyWith<$Res>(_self.patient!, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [PatientResponse].
extension PatientResponsePatterns on PatientResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientResponse value)  $default,){
final _that = this;
switch (_that) {
case _PatientResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PatientResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  Patient? patient)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientResponse() when $default != null:
return $default(_that.success,_that.message,_that.patient);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  Patient? patient)  $default,) {final _that = this;
switch (_that) {
case _PatientResponse():
return $default(_that.success,_that.message,_that.patient);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  Patient? patient)?  $default,) {final _that = this;
switch (_that) {
case _PatientResponse() when $default != null:
return $default(_that.success,_that.message,_that.patient);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientResponse implements PatientResponse {
  const _PatientResponse({this.success = false, this.message = '', this.patient});
  factory _PatientResponse.fromJson(Map<String, dynamic> json) => _$PatientResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  Patient? patient;

/// Create a copy of PatientResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientResponseCopyWith<_PatientResponse> get copyWith => __$PatientResponseCopyWithImpl<_PatientResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.patient, patient) || other.patient == patient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,patient);

@override
String toString() {
  return 'PatientResponse(success: $success, message: $message, patient: $patient)';
}


}

/// @nodoc
abstract mixin class _$PatientResponseCopyWith<$Res> implements $PatientResponseCopyWith<$Res> {
  factory _$PatientResponseCopyWith(_PatientResponse value, $Res Function(_PatientResponse) _then) = __$PatientResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, Patient? patient
});


@override $PatientCopyWith<$Res>? get patient;

}
/// @nodoc
class __$PatientResponseCopyWithImpl<$Res>
    implements _$PatientResponseCopyWith<$Res> {
  __$PatientResponseCopyWithImpl(this._self, this._then);

  final _PatientResponse _self;
  final $Res Function(_PatientResponse) _then;

/// Create a copy of PatientResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? patient = freezed,}) {
  return _then(_PatientResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as Patient?,
  ));
}

/// Create a copy of PatientResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientCopyWith<$Res>? get patient {
    if (_self.patient == null) {
    return null;
  }

  return $PatientCopyWith<$Res>(_self.patient!, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// @nodoc
mixin _$Patient {

 int get id; String get fullName; DateTime? get dateOfBirth; int get gender; int get bloodType; double get weight; double get height; String? get emergencyContact; String? get emergencyPhone; String? get patientCode; List<Allergy> get allergies; List<ChronicDisease> get chronicDiseases; List<Surgery> get surgeries; List<MedicalRecord> get medicalRecords; List<Prescription> get prescriptions;
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientCopyWith<Patient> get copyWith => _$PatientCopyWithImpl<Patient>(this as Patient, _$identity);

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&(identical(other.patientCode, patientCode) || other.patientCode == patientCode)&&const DeepCollectionEquality().equals(other.allergies, allergies)&&const DeepCollectionEquality().equals(other.chronicDiseases, chronicDiseases)&&const DeepCollectionEquality().equals(other.surgeries, surgeries)&&const DeepCollectionEquality().equals(other.medicalRecords, medicalRecords)&&const DeepCollectionEquality().equals(other.prescriptions, prescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,dateOfBirth,gender,bloodType,weight,height,emergencyContact,emergencyPhone,patientCode,const DeepCollectionEquality().hash(allergies),const DeepCollectionEquality().hash(chronicDiseases),const DeepCollectionEquality().hash(surgeries),const DeepCollectionEquality().hash(medicalRecords),const DeepCollectionEquality().hash(prescriptions));

@override
String toString() {
  return 'Patient(id: $id, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, patientCode: $patientCode, allergies: $allergies, chronicDiseases: $chronicDiseases, surgeries: $surgeries, medicalRecords: $medicalRecords, prescriptions: $prescriptions)';
}


}

/// @nodoc
abstract mixin class $PatientCopyWith<$Res>  {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) _then) = _$PatientCopyWithImpl;
@useResult
$Res call({
 int id, String fullName, DateTime? dateOfBirth, int gender, int bloodType, double weight, double height, String? emergencyContact, String? emergencyPhone, String? patientCode, List<Allergy> allergies, List<ChronicDisease> chronicDiseases, List<Surgery> surgeries, List<MedicalRecord> medicalRecords, List<Prescription> prescriptions
});




}
/// @nodoc
class _$PatientCopyWithImpl<$Res>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._self, this._then);

  final Patient _self;
  final $Res Function(Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? dateOfBirth = freezed,Object? gender = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = freezed,Object? emergencyPhone = freezed,Object? patientCode = freezed,Object? allergies = null,Object? chronicDiseases = null,Object? surgeries = null,Object? medicalRecords = null,Object? prescriptions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,emergencyPhone: freezed == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String?,patientCode: freezed == patientCode ? _self.patientCode : patientCode // ignore: cast_nullable_to_non_nullable
as String?,allergies: null == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<Allergy>,chronicDiseases: null == chronicDiseases ? _self.chronicDiseases : chronicDiseases // ignore: cast_nullable_to_non_nullable
as List<ChronicDisease>,surgeries: null == surgeries ? _self.surgeries : surgeries // ignore: cast_nullable_to_non_nullable
as List<Surgery>,medicalRecords: null == medicalRecords ? _self.medicalRecords : medicalRecords // ignore: cast_nullable_to_non_nullable
as List<MedicalRecord>,prescriptions: null == prescriptions ? _self.prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as List<Prescription>,
  ));
}

}


/// Adds pattern-matching-related methods to [Patient].
extension PatientPatterns on Patient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Patient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Patient value)  $default,){
final _that = this;
switch (_that) {
case _Patient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Patient value)?  $default,){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String fullName,  DateTime? dateOfBirth,  int gender,  int bloodType,  double weight,  double height,  String? emergencyContact,  String? emergencyPhone,  String? patientCode,  List<Allergy> allergies,  List<ChronicDisease> chronicDiseases,  List<Surgery> surgeries,  List<MedicalRecord> medicalRecords,  List<Prescription> prescriptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.fullName,_that.dateOfBirth,_that.gender,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.patientCode,_that.allergies,_that.chronicDiseases,_that.surgeries,_that.medicalRecords,_that.prescriptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String fullName,  DateTime? dateOfBirth,  int gender,  int bloodType,  double weight,  double height,  String? emergencyContact,  String? emergencyPhone,  String? patientCode,  List<Allergy> allergies,  List<ChronicDisease> chronicDiseases,  List<Surgery> surgeries,  List<MedicalRecord> medicalRecords,  List<Prescription> prescriptions)  $default,) {final _that = this;
switch (_that) {
case _Patient():
return $default(_that.id,_that.fullName,_that.dateOfBirth,_that.gender,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.patientCode,_that.allergies,_that.chronicDiseases,_that.surgeries,_that.medicalRecords,_that.prescriptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String fullName,  DateTime? dateOfBirth,  int gender,  int bloodType,  double weight,  double height,  String? emergencyContact,  String? emergencyPhone,  String? patientCode,  List<Allergy> allergies,  List<ChronicDisease> chronicDiseases,  List<Surgery> surgeries,  List<MedicalRecord> medicalRecords,  List<Prescription> prescriptions)?  $default,) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.fullName,_that.dateOfBirth,_that.gender,_that.bloodType,_that.weight,_that.height,_that.emergencyContact,_that.emergencyPhone,_that.patientCode,_that.allergies,_that.chronicDiseases,_that.surgeries,_that.medicalRecords,_that.prescriptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Patient implements Patient {
  const _Patient({required this.id, this.fullName = '', this.dateOfBirth, this.gender = 0, this.bloodType = 0, this.weight = 10, this.height = 10, this.emergencyContact, this.emergencyPhone, this.patientCode, final  List<Allergy> allergies = const [], final  List<ChronicDisease> chronicDiseases = const [], final  List<Surgery> surgeries = const [], final  List<MedicalRecord> medicalRecords = const [], final  List<Prescription> prescriptions = const []}): _allergies = allergies,_chronicDiseases = chronicDiseases,_surgeries = surgeries,_medicalRecords = medicalRecords,_prescriptions = prescriptions;
  factory _Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

@override final  int id;
@override@JsonKey() final  String fullName;
@override final  DateTime? dateOfBirth;
@override@JsonKey() final  int gender;
@override@JsonKey() final  int bloodType;
@override@JsonKey() final  double weight;
@override@JsonKey() final  double height;
@override final  String? emergencyContact;
@override final  String? emergencyPhone;
@override final  String? patientCode;
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

 final  List<MedicalRecord> _medicalRecords;
@override@JsonKey() List<MedicalRecord> get medicalRecords {
  if (_medicalRecords is EqualUnmodifiableListView) return _medicalRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medicalRecords);
}

 final  List<Prescription> _prescriptions;
@override@JsonKey() List<Prescription> get prescriptions {
  if (_prescriptions is EqualUnmodifiableListView) return _prescriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prescriptions);
}


/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientCopyWith<_Patient> get copyWith => __$PatientCopyWithImpl<_Patient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyPhone, emergencyPhone) || other.emergencyPhone == emergencyPhone)&&(identical(other.patientCode, patientCode) || other.patientCode == patientCode)&&const DeepCollectionEquality().equals(other._allergies, _allergies)&&const DeepCollectionEquality().equals(other._chronicDiseases, _chronicDiseases)&&const DeepCollectionEquality().equals(other._surgeries, _surgeries)&&const DeepCollectionEquality().equals(other._medicalRecords, _medicalRecords)&&const DeepCollectionEquality().equals(other._prescriptions, _prescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,dateOfBirth,gender,bloodType,weight,height,emergencyContact,emergencyPhone,patientCode,const DeepCollectionEquality().hash(_allergies),const DeepCollectionEquality().hash(_chronicDiseases),const DeepCollectionEquality().hash(_surgeries),const DeepCollectionEquality().hash(_medicalRecords),const DeepCollectionEquality().hash(_prescriptions));

@override
String toString() {
  return 'Patient(id: $id, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, bloodType: $bloodType, weight: $weight, height: $height, emergencyContact: $emergencyContact, emergencyPhone: $emergencyPhone, patientCode: $patientCode, allergies: $allergies, chronicDiseases: $chronicDiseases, surgeries: $surgeries, medicalRecords: $medicalRecords, prescriptions: $prescriptions)';
}


}

/// @nodoc
abstract mixin class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) _then) = __$PatientCopyWithImpl;
@override @useResult
$Res call({
 int id, String fullName, DateTime? dateOfBirth, int gender, int bloodType, double weight, double height, String? emergencyContact, String? emergencyPhone, String? patientCode, List<Allergy> allergies, List<ChronicDisease> chronicDiseases, List<Surgery> surgeries, List<MedicalRecord> medicalRecords, List<Prescription> prescriptions
});




}
/// @nodoc
class __$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(this._self, this._then);

  final _Patient _self;
  final $Res Function(_Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? dateOfBirth = freezed,Object? gender = null,Object? bloodType = null,Object? weight = null,Object? height = null,Object? emergencyContact = freezed,Object? emergencyPhone = freezed,Object? patientCode = freezed,Object? allergies = null,Object? chronicDiseases = null,Object? surgeries = null,Object? medicalRecords = null,Object? prescriptions = null,}) {
  return _then(_Patient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,emergencyPhone: freezed == emergencyPhone ? _self.emergencyPhone : emergencyPhone // ignore: cast_nullable_to_non_nullable
as String?,patientCode: freezed == patientCode ? _self.patientCode : patientCode // ignore: cast_nullable_to_non_nullable
as String?,allergies: null == allergies ? _self._allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<Allergy>,chronicDiseases: null == chronicDiseases ? _self._chronicDiseases : chronicDiseases // ignore: cast_nullable_to_non_nullable
as List<ChronicDisease>,surgeries: null == surgeries ? _self._surgeries : surgeries // ignore: cast_nullable_to_non_nullable
as List<Surgery>,medicalRecords: null == medicalRecords ? _self._medicalRecords : medicalRecords // ignore: cast_nullable_to_non_nullable
as List<MedicalRecord>,prescriptions: null == prescriptions ? _self._prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as List<Prescription>,
  ));
}


}


/// @nodoc
mixin _$Allergy {

 int get id; int get patientId; String get allergenName; String get reaction; String get severity; DateTime? get createdAt;
/// Create a copy of Allergy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllergyCopyWith<Allergy> get copyWith => _$AllergyCopyWithImpl<Allergy>(this as Allergy, _$identity);

  /// Serializes this Allergy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Allergy&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.allergenName, allergenName) || other.allergenName == allergenName)&&(identical(other.reaction, reaction) || other.reaction == reaction)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,allergenName,reaction,severity,createdAt);

@override
String toString() {
  return 'Allergy(id: $id, patientId: $patientId, allergenName: $allergenName, reaction: $reaction, severity: $severity, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AllergyCopyWith<$Res>  {
  factory $AllergyCopyWith(Allergy value, $Res Function(Allergy) _then) = _$AllergyCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, String allergenName, String reaction, String severity, DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? allergenName = null,Object? reaction = null,Object? severity = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,allergenName: null == allergenName ? _self.allergenName : allergenName // ignore: cast_nullable_to_non_nullable
as String,reaction: null == reaction ? _self.reaction : reaction // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  String allergenName,  String reaction,  String severity,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Allergy() when $default != null:
return $default(_that.id,_that.patientId,_that.allergenName,_that.reaction,_that.severity,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  String allergenName,  String reaction,  String severity,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Allergy():
return $default(_that.id,_that.patientId,_that.allergenName,_that.reaction,_that.severity,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  String allergenName,  String reaction,  String severity,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Allergy() when $default != null:
return $default(_that.id,_that.patientId,_that.allergenName,_that.reaction,_that.severity,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Allergy implements Allergy {
  const _Allergy({this.id = 0, this.patientId = 0, this.allergenName = '', this.reaction = '', this.severity = '', this.createdAt});
  factory _Allergy.fromJson(Map<String, dynamic> json) => _$AllergyFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int patientId;
@override@JsonKey() final  String allergenName;
@override@JsonKey() final  String reaction;
@override@JsonKey() final  String severity;
@override final  DateTime? createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Allergy&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.allergenName, allergenName) || other.allergenName == allergenName)&&(identical(other.reaction, reaction) || other.reaction == reaction)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,allergenName,reaction,severity,createdAt);

@override
String toString() {
  return 'Allergy(id: $id, patientId: $patientId, allergenName: $allergenName, reaction: $reaction, severity: $severity, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AllergyCopyWith<$Res> implements $AllergyCopyWith<$Res> {
  factory _$AllergyCopyWith(_Allergy value, $Res Function(_Allergy) _then) = __$AllergyCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, String allergenName, String reaction, String severity, DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? allergenName = null,Object? reaction = null,Object? severity = null,Object? createdAt = freezed,}) {
  return _then(_Allergy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,allergenName: null == allergenName ? _self.allergenName : allergenName // ignore: cast_nullable_to_non_nullable
as String,reaction: null == reaction ? _self.reaction : reaction // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ChronicDisease {

 int get id; int get patientId; String get diseaseName; String get description; DateTime? get diagnosisDate; DateTime? get createdAt;
/// Create a copy of ChronicDisease
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChronicDiseaseCopyWith<ChronicDisease> get copyWith => _$ChronicDiseaseCopyWithImpl<ChronicDisease>(this as ChronicDisease, _$identity);

  /// Serializes this ChronicDisease to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChronicDisease&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.diseaseName, diseaseName) || other.diseaseName == diseaseName)&&(identical(other.description, description) || other.description == description)&&(identical(other.diagnosisDate, diagnosisDate) || other.diagnosisDate == diagnosisDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,diseaseName,description,diagnosisDate,createdAt);

@override
String toString() {
  return 'ChronicDisease(id: $id, patientId: $patientId, diseaseName: $diseaseName, description: $description, diagnosisDate: $diagnosisDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChronicDiseaseCopyWith<$Res>  {
  factory $ChronicDiseaseCopyWith(ChronicDisease value, $Res Function(ChronicDisease) _then) = _$ChronicDiseaseCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, String diseaseName, String description, DateTime? diagnosisDate, DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? diseaseName = null,Object? description = null,Object? diagnosisDate = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,diseaseName: null == diseaseName ? _self.diseaseName : diseaseName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,diagnosisDate: freezed == diagnosisDate ? _self.diagnosisDate : diagnosisDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  String diseaseName,  String description,  DateTime? diagnosisDate,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChronicDisease() when $default != null:
return $default(_that.id,_that.patientId,_that.diseaseName,_that.description,_that.diagnosisDate,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  String diseaseName,  String description,  DateTime? diagnosisDate,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChronicDisease():
return $default(_that.id,_that.patientId,_that.diseaseName,_that.description,_that.diagnosisDate,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  String diseaseName,  String description,  DateTime? diagnosisDate,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChronicDisease() when $default != null:
return $default(_that.id,_that.patientId,_that.diseaseName,_that.description,_that.diagnosisDate,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChronicDisease implements ChronicDisease {
  const _ChronicDisease({this.id = 0, this.patientId = 0, this.diseaseName = '', this.description = '', this.diagnosisDate, this.createdAt});
  factory _ChronicDisease.fromJson(Map<String, dynamic> json) => _$ChronicDiseaseFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int patientId;
@override@JsonKey() final  String diseaseName;
@override@JsonKey() final  String description;
@override final  DateTime? diagnosisDate;
@override final  DateTime? createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChronicDisease&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.diseaseName, diseaseName) || other.diseaseName == diseaseName)&&(identical(other.description, description) || other.description == description)&&(identical(other.diagnosisDate, diagnosisDate) || other.diagnosisDate == diagnosisDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,diseaseName,description,diagnosisDate,createdAt);

@override
String toString() {
  return 'ChronicDisease(id: $id, patientId: $patientId, diseaseName: $diseaseName, description: $description, diagnosisDate: $diagnosisDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChronicDiseaseCopyWith<$Res> implements $ChronicDiseaseCopyWith<$Res> {
  factory _$ChronicDiseaseCopyWith(_ChronicDisease value, $Res Function(_ChronicDisease) _then) = __$ChronicDiseaseCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, String diseaseName, String description, DateTime? diagnosisDate, DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? diseaseName = null,Object? description = null,Object? diagnosisDate = freezed,Object? createdAt = freezed,}) {
  return _then(_ChronicDisease(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,diseaseName: null == diseaseName ? _self.diseaseName : diseaseName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,diagnosisDate: freezed == diagnosisDate ? _self.diagnosisDate : diagnosisDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Surgery {

 int get id; int get patientId; String get surgeryName; String get description; String get hospital; String get surgeon; DateTime? get surgeryDate; DateTime? get createdAt;
/// Create a copy of Surgery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurgeryCopyWith<Surgery> get copyWith => _$SurgeryCopyWithImpl<Surgery>(this as Surgery, _$identity);

  /// Serializes this Surgery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Surgery&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.surgeryName, surgeryName) || other.surgeryName == surgeryName)&&(identical(other.description, description) || other.description == description)&&(identical(other.hospital, hospital) || other.hospital == hospital)&&(identical(other.surgeon, surgeon) || other.surgeon == surgeon)&&(identical(other.surgeryDate, surgeryDate) || other.surgeryDate == surgeryDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,surgeryName,description,hospital,surgeon,surgeryDate,createdAt);

@override
String toString() {
  return 'Surgery(id: $id, patientId: $patientId, surgeryName: $surgeryName, description: $description, hospital: $hospital, surgeon: $surgeon, surgeryDate: $surgeryDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SurgeryCopyWith<$Res>  {
  factory $SurgeryCopyWith(Surgery value, $Res Function(Surgery) _then) = _$SurgeryCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, String surgeryName, String description, String hospital, String surgeon, DateTime? surgeryDate, DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? surgeryName = null,Object? description = null,Object? hospital = null,Object? surgeon = null,Object? surgeryDate = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,surgeryName: null == surgeryName ? _self.surgeryName : surgeryName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,hospital: null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as String,surgeon: null == surgeon ? _self.surgeon : surgeon // ignore: cast_nullable_to_non_nullable
as String,surgeryDate: freezed == surgeryDate ? _self.surgeryDate : surgeryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  String surgeryName,  String description,  String hospital,  String surgeon,  DateTime? surgeryDate,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Surgery() when $default != null:
return $default(_that.id,_that.patientId,_that.surgeryName,_that.description,_that.hospital,_that.surgeon,_that.surgeryDate,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  String surgeryName,  String description,  String hospital,  String surgeon,  DateTime? surgeryDate,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Surgery():
return $default(_that.id,_that.patientId,_that.surgeryName,_that.description,_that.hospital,_that.surgeon,_that.surgeryDate,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  String surgeryName,  String description,  String hospital,  String surgeon,  DateTime? surgeryDate,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Surgery() when $default != null:
return $default(_that.id,_that.patientId,_that.surgeryName,_that.description,_that.hospital,_that.surgeon,_that.surgeryDate,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Surgery implements Surgery {
  const _Surgery({this.id = 0, this.patientId = 0, this.surgeryName = '', this.description = '', this.hospital = '', this.surgeon = '', this.surgeryDate, this.createdAt});
  factory _Surgery.fromJson(Map<String, dynamic> json) => _$SurgeryFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int patientId;
@override@JsonKey() final  String surgeryName;
@override@JsonKey() final  String description;
@override@JsonKey() final  String hospital;
@override@JsonKey() final  String surgeon;
@override final  DateTime? surgeryDate;
@override final  DateTime? createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Surgery&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.surgeryName, surgeryName) || other.surgeryName == surgeryName)&&(identical(other.description, description) || other.description == description)&&(identical(other.hospital, hospital) || other.hospital == hospital)&&(identical(other.surgeon, surgeon) || other.surgeon == surgeon)&&(identical(other.surgeryDate, surgeryDate) || other.surgeryDate == surgeryDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,surgeryName,description,hospital,surgeon,surgeryDate,createdAt);

@override
String toString() {
  return 'Surgery(id: $id, patientId: $patientId, surgeryName: $surgeryName, description: $description, hospital: $hospital, surgeon: $surgeon, surgeryDate: $surgeryDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SurgeryCopyWith<$Res> implements $SurgeryCopyWith<$Res> {
  factory _$SurgeryCopyWith(_Surgery value, $Res Function(_Surgery) _then) = __$SurgeryCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, String surgeryName, String description, String hospital, String surgeon, DateTime? surgeryDate, DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? surgeryName = null,Object? description = null,Object? hospital = null,Object? surgeon = null,Object? surgeryDate = freezed,Object? createdAt = freezed,}) {
  return _then(_Surgery(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,surgeryName: null == surgeryName ? _self.surgeryName : surgeryName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,hospital: null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as String,surgeon: null == surgeon ? _self.surgeon : surgeon // ignore: cast_nullable_to_non_nullable
as String,surgeryDate: freezed == surgeryDate ? _self.surgeryDate : surgeryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$MedicalRecord {

 int get id; int get patientId; int? get doctorId; String get diagnosis; String get notes; String? get symptoms; String? get treatment; DateTime? get recordDate; DateTime? get createdAt; String get doctorName; String get patientName;
/// Create a copy of MedicalRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicalRecordCopyWith<MedicalRecord> get copyWith => _$MedicalRecordCopyWithImpl<MedicalRecord>(this as MedicalRecord, _$identity);

  /// Serializes this MedicalRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.symptoms, symptoms) || other.symptoms == symptoms)&&(identical(other.treatment, treatment) || other.treatment == treatment)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.patientName, patientName) || other.patientName == patientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,doctorId,diagnosis,notes,symptoms,treatment,recordDate,createdAt,doctorName,patientName);

@override
String toString() {
  return 'MedicalRecord(id: $id, patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, notes: $notes, symptoms: $symptoms, treatment: $treatment, recordDate: $recordDate, createdAt: $createdAt, doctorName: $doctorName, patientName: $patientName)';
}


}

/// @nodoc
abstract mixin class $MedicalRecordCopyWith<$Res>  {
  factory $MedicalRecordCopyWith(MedicalRecord value, $Res Function(MedicalRecord) _then) = _$MedicalRecordCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, int? doctorId, String diagnosis, String notes, String? symptoms, String? treatment, DateTime? recordDate, DateTime? createdAt, String doctorName, String patientName
});




}
/// @nodoc
class _$MedicalRecordCopyWithImpl<$Res>
    implements $MedicalRecordCopyWith<$Res> {
  _$MedicalRecordCopyWithImpl(this._self, this._then);

  final MedicalRecord _self;
  final $Res Function(MedicalRecord) _then;

/// Create a copy of MedicalRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? doctorId = freezed,Object? diagnosis = null,Object? notes = null,Object? symptoms = freezed,Object? treatment = freezed,Object? recordDate = freezed,Object? createdAt = freezed,Object? doctorName = null,Object? patientName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int?,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,symptoms: freezed == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as String?,treatment: freezed == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as String?,recordDate: freezed == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicalRecord].
extension MedicalRecordPatterns on MedicalRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicalRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicalRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicalRecord value)  $default,){
final _that = this;
switch (_that) {
case _MedicalRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicalRecord value)?  $default,){
final _that = this;
switch (_that) {
case _MedicalRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  int? doctorId,  String diagnosis,  String notes,  String? symptoms,  String? treatment,  DateTime? recordDate,  DateTime? createdAt,  String doctorName,  String patientName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicalRecord() when $default != null:
return $default(_that.id,_that.patientId,_that.doctorId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate,_that.createdAt,_that.doctorName,_that.patientName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  int? doctorId,  String diagnosis,  String notes,  String? symptoms,  String? treatment,  DateTime? recordDate,  DateTime? createdAt,  String doctorName,  String patientName)  $default,) {final _that = this;
switch (_that) {
case _MedicalRecord():
return $default(_that.id,_that.patientId,_that.doctorId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate,_that.createdAt,_that.doctorName,_that.patientName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  int? doctorId,  String diagnosis,  String notes,  String? symptoms,  String? treatment,  DateTime? recordDate,  DateTime? createdAt,  String doctorName,  String patientName)?  $default,) {final _that = this;
switch (_that) {
case _MedicalRecord() when $default != null:
return $default(_that.id,_that.patientId,_that.doctorId,_that.diagnosis,_that.notes,_that.symptoms,_that.treatment,_that.recordDate,_that.createdAt,_that.doctorName,_that.patientName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicalRecord implements MedicalRecord {
  const _MedicalRecord({required this.id, required this.patientId, this.doctorId, this.diagnosis = '', this.notes = '', this.symptoms, this.treatment, this.recordDate, this.createdAt, this.doctorName = '', this.patientName = ''});
  factory _MedicalRecord.fromJson(Map<String, dynamic> json) => _$MedicalRecordFromJson(json);

@override final  int id;
@override final  int patientId;
@override final  int? doctorId;
@override@JsonKey() final  String diagnosis;
@override@JsonKey() final  String notes;
@override final  String? symptoms;
@override final  String? treatment;
@override final  DateTime? recordDate;
@override final  DateTime? createdAt;
@override@JsonKey() final  String doctorName;
@override@JsonKey() final  String patientName;

/// Create a copy of MedicalRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicalRecordCopyWith<_MedicalRecord> get copyWith => __$MedicalRecordCopyWithImpl<_MedicalRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicalRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.symptoms, symptoms) || other.symptoms == symptoms)&&(identical(other.treatment, treatment) || other.treatment == treatment)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.patientName, patientName) || other.patientName == patientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,doctorId,diagnosis,notes,symptoms,treatment,recordDate,createdAt,doctorName,patientName);

@override
String toString() {
  return 'MedicalRecord(id: $id, patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, notes: $notes, symptoms: $symptoms, treatment: $treatment, recordDate: $recordDate, createdAt: $createdAt, doctorName: $doctorName, patientName: $patientName)';
}


}

/// @nodoc
abstract mixin class _$MedicalRecordCopyWith<$Res> implements $MedicalRecordCopyWith<$Res> {
  factory _$MedicalRecordCopyWith(_MedicalRecord value, $Res Function(_MedicalRecord) _then) = __$MedicalRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, int? doctorId, String diagnosis, String notes, String? symptoms, String? treatment, DateTime? recordDate, DateTime? createdAt, String doctorName, String patientName
});




}
/// @nodoc
class __$MedicalRecordCopyWithImpl<$Res>
    implements _$MedicalRecordCopyWith<$Res> {
  __$MedicalRecordCopyWithImpl(this._self, this._then);

  final _MedicalRecord _self;
  final $Res Function(_MedicalRecord) _then;

/// Create a copy of MedicalRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? doctorId = freezed,Object? diagnosis = null,Object? notes = null,Object? symptoms = freezed,Object? treatment = freezed,Object? recordDate = freezed,Object? createdAt = freezed,Object? doctorName = null,Object? patientName = null,}) {
  return _then(_MedicalRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int?,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,symptoms: freezed == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as String?,treatment: freezed == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as String?,recordDate: freezed == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Prescription {

 int get id; int get patientId; int get doctorId; String get diagnosis; String? get notes; int get status; DateTime? get prescriptionDate; DateTime? get createdAt; String get doctorName; String get patientName; List<PrescriptionItem> get items;
/// Create a copy of Prescription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionCopyWith<Prescription> get copyWith => _$PrescriptionCopyWithImpl<Prescription>(this as Prescription, _$identity);

  /// Serializes this Prescription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Prescription&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.prescriptionDate, prescriptionDate) || other.prescriptionDate == prescriptionDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,doctorId,diagnosis,notes,status,prescriptionDate,createdAt,doctorName,patientName,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'Prescription(id: $id, patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, notes: $notes, status: $status, prescriptionDate: $prescriptionDate, createdAt: $createdAt, doctorName: $doctorName, patientName: $patientName, items: $items)';
}


}

/// @nodoc
abstract mixin class $PrescriptionCopyWith<$Res>  {
  factory $PrescriptionCopyWith(Prescription value, $Res Function(Prescription) _then) = _$PrescriptionCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, int doctorId, String diagnosis, String? notes, int status, DateTime? prescriptionDate, DateTime? createdAt, String doctorName, String patientName, List<PrescriptionItem> items
});




}
/// @nodoc
class _$PrescriptionCopyWithImpl<$Res>
    implements $PrescriptionCopyWith<$Res> {
  _$PrescriptionCopyWithImpl(this._self, this._then);

  final Prescription _self;
  final $Res Function(Prescription) _then;

/// Create a copy of Prescription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? doctorId = null,Object? diagnosis = null,Object? notes = freezed,Object? status = null,Object? prescriptionDate = freezed,Object? createdAt = freezed,Object? doctorName = null,Object? patientName = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,prescriptionDate: freezed == prescriptionDate ? _self.prescriptionDate : prescriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [Prescription].
extension PrescriptionPatterns on Prescription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Prescription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Prescription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Prescription value)  $default,){
final _that = this;
switch (_that) {
case _Prescription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Prescription value)?  $default,){
final _that = this;
switch (_that) {
case _Prescription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  int doctorId,  String diagnosis,  String? notes,  int status,  DateTime? prescriptionDate,  DateTime? createdAt,  String doctorName,  String patientName,  List<PrescriptionItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Prescription() when $default != null:
return $default(_that.id,_that.patientId,_that.doctorId,_that.diagnosis,_that.notes,_that.status,_that.prescriptionDate,_that.createdAt,_that.doctorName,_that.patientName,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  int doctorId,  String diagnosis,  String? notes,  int status,  DateTime? prescriptionDate,  DateTime? createdAt,  String doctorName,  String patientName,  List<PrescriptionItem> items)  $default,) {final _that = this;
switch (_that) {
case _Prescription():
return $default(_that.id,_that.patientId,_that.doctorId,_that.diagnosis,_that.notes,_that.status,_that.prescriptionDate,_that.createdAt,_that.doctorName,_that.patientName,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  int doctorId,  String diagnosis,  String? notes,  int status,  DateTime? prescriptionDate,  DateTime? createdAt,  String doctorName,  String patientName,  List<PrescriptionItem> items)?  $default,) {final _that = this;
switch (_that) {
case _Prescription() when $default != null:
return $default(_that.id,_that.patientId,_that.doctorId,_that.diagnosis,_that.notes,_that.status,_that.prescriptionDate,_that.createdAt,_that.doctorName,_that.patientName,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Prescription implements Prescription {
  const _Prescription({this.id = 0, this.patientId = 0, this.doctorId = 0, this.diagnosis = '', this.notes, required this.status, this.prescriptionDate, this.createdAt, this.doctorName = '', this.patientName = '', final  List<PrescriptionItem> items = const []}): _items = items;
  factory _Prescription.fromJson(Map<String, dynamic> json) => _$PrescriptionFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int patientId;
@override@JsonKey() final  int doctorId;
@override@JsonKey() final  String diagnosis;
@override final  String? notes;
@override final  int status;
@override final  DateTime? prescriptionDate;
@override final  DateTime? createdAt;
@override@JsonKey() final  String doctorName;
@override@JsonKey() final  String patientName;
 final  List<PrescriptionItem> _items;
@override@JsonKey() List<PrescriptionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of Prescription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionCopyWith<_Prescription> get copyWith => __$PrescriptionCopyWithImpl<_Prescription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Prescription&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.prescriptionDate, prescriptionDate) || other.prescriptionDate == prescriptionDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,doctorId,diagnosis,notes,status,prescriptionDate,createdAt,doctorName,patientName,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'Prescription(id: $id, patientId: $patientId, doctorId: $doctorId, diagnosis: $diagnosis, notes: $notes, status: $status, prescriptionDate: $prescriptionDate, createdAt: $createdAt, doctorName: $doctorName, patientName: $patientName, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionCopyWith<$Res> implements $PrescriptionCopyWith<$Res> {
  factory _$PrescriptionCopyWith(_Prescription value, $Res Function(_Prescription) _then) = __$PrescriptionCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, int doctorId, String diagnosis, String? notes, int status, DateTime? prescriptionDate, DateTime? createdAt, String doctorName, String patientName, List<PrescriptionItem> items
});




}
/// @nodoc
class __$PrescriptionCopyWithImpl<$Res>
    implements _$PrescriptionCopyWith<$Res> {
  __$PrescriptionCopyWithImpl(this._self, this._then);

  final _Prescription _self;
  final $Res Function(_Prescription) _then;

/// Create a copy of Prescription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? doctorId = null,Object? diagnosis = null,Object? notes = freezed,Object? status = null,Object? prescriptionDate = freezed,Object? createdAt = freezed,Object? doctorName = null,Object? patientName = null,Object? items = null,}) {
  return _then(_Prescription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,diagnosis: null == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,prescriptionDate: freezed == prescriptionDate ? _self.prescriptionDate : prescriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PrescriptionItem>,
  ));
}


}


/// @nodoc
mixin _$PrescriptionItem {

 int get id; int get prescriptionId; int get drugId; String get medicationName; String get dosage; String get frequency; String get duration; String get instructions; int get quantity; bool get isDispensed; DateTime? get createdAt;
/// Create a copy of PrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionItemCopyWith<PrescriptionItem> get copyWith => _$PrescriptionItemCopyWithImpl<PrescriptionItem>(this as PrescriptionItem, _$identity);

  /// Serializes this PrescriptionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isDispensed, isDispensed) || other.isDispensed == isDispensed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prescriptionId,drugId,medicationName,dosage,frequency,duration,instructions,quantity,isDispensed,createdAt);

@override
String toString() {
  return 'PrescriptionItem(id: $id, prescriptionId: $prescriptionId, drugId: $drugId, medicationName: $medicationName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, quantity: $quantity, isDispensed: $isDispensed, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PrescriptionItemCopyWith<$Res>  {
  factory $PrescriptionItemCopyWith(PrescriptionItem value, $Res Function(PrescriptionItem) _then) = _$PrescriptionItemCopyWithImpl;
@useResult
$Res call({
 int id, int prescriptionId, int drugId, String medicationName, String dosage, String frequency, String duration, String instructions, int quantity, bool isDispensed, DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prescriptionId = null,Object? drugId = null,Object? medicationName = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,Object? quantity = null,Object? isDispensed = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as int,medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isDispensed: null == isDispensed ? _self.isDispensed : isDispensed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int prescriptionId,  int drugId,  String medicationName,  String dosage,  String frequency,  String duration,  String instructions,  int quantity,  bool isDispensed,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
return $default(_that.id,_that.prescriptionId,_that.drugId,_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.quantity,_that.isDispensed,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int prescriptionId,  int drugId,  String medicationName,  String dosage,  String frequency,  String duration,  String instructions,  int quantity,  bool isDispensed,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItem():
return $default(_that.id,_that.prescriptionId,_that.drugId,_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.quantity,_that.isDispensed,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int prescriptionId,  int drugId,  String medicationName,  String dosage,  String frequency,  String duration,  String instructions,  int quantity,  bool isDispensed,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionItem() when $default != null:
return $default(_that.id,_that.prescriptionId,_that.drugId,_that.medicationName,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.quantity,_that.isDispensed,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionItem implements PrescriptionItem {
  const _PrescriptionItem({this.id = 0, this.prescriptionId = 0, this.drugId = 0, this.medicationName = '', this.dosage = '', this.frequency = '', this.duration = '', this.instructions = '', this.quantity = 0, this.isDispensed = false, this.createdAt});
  factory _PrescriptionItem.fromJson(Map<String, dynamic> json) => _$PrescriptionItemFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int prescriptionId;
@override@JsonKey() final  int drugId;
@override@JsonKey() final  String medicationName;
@override@JsonKey() final  String dosage;
@override@JsonKey() final  String frequency;
@override@JsonKey() final  String duration;
@override@JsonKey() final  String instructions;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  bool isDispensed;
@override final  DateTime? createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.drugId, drugId) || other.drugId == drugId)&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isDispensed, isDispensed) || other.isDispensed == isDispensed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prescriptionId,drugId,medicationName,dosage,frequency,duration,instructions,quantity,isDispensed,createdAt);

@override
String toString() {
  return 'PrescriptionItem(id: $id, prescriptionId: $prescriptionId, drugId: $drugId, medicationName: $medicationName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, quantity: $quantity, isDispensed: $isDispensed, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionItemCopyWith<$Res> implements $PrescriptionItemCopyWith<$Res> {
  factory _$PrescriptionItemCopyWith(_PrescriptionItem value, $Res Function(_PrescriptionItem) _then) = __$PrescriptionItemCopyWithImpl;
@override @useResult
$Res call({
 int id, int prescriptionId, int drugId, String medicationName, String dosage, String frequency, String duration, String instructions, int quantity, bool isDispensed, DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prescriptionId = null,Object? drugId = null,Object? medicationName = null,Object? dosage = null,Object? frequency = null,Object? duration = null,Object? instructions = null,Object? quantity = null,Object? isDispensed = null,Object? createdAt = freezed,}) {
  return _then(_PrescriptionItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,drugId: null == drugId ? _self.drugId : drugId // ignore: cast_nullable_to_non_nullable
as int,medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isDispensed: null == isDispensed ? _self.isDispensed : isDispensed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
