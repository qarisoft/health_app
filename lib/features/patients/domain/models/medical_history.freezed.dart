// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicalHistory {

// Personal Information
 String? get id; String get patientId; String get patientName; DateTime get dateOfBirth; Gender get gender;// Contact Information
 String get phoneNumber; String? get email; String get address;// Emergency Contact
 String get emergencyContactName; String get emergencyContactPhone; String? get emergencyContactRelationship;// Vital Statistics
 double get height; double get weight; BloodType get bloodType;// Medical Conditions
 List<String>? get chronicConditions; List<String>? get allergies; List<String>? get currentMedications; List<String>? get pastMedications;// Surgical History
 List<Surgery>? get surgeries;// Hospitalizations
 List<Hospitalization>? get hospitalizations;// Family History
 Map<String, String>? get familyMedicalHistory;// Lifestyle
 bool get isSmoker; int get cigarettesPerDay; bool get isAlcoholConsumer; String get alcoholFrequency; bool get usesRecreationalDrugs; String? get recreationalDrugsDetails;// Exercise & Diet
 String get exerciseFrequency; String get dietaryPreferences;// Vaccination History
 List<Vaccination>? get vaccinations;// Women's Health
 DateTime? get lastMenstrualPeriod; bool? get isPregnant; int? get pregnancies; int? get liveBirths;// Mental Health
 List<String>? get mentalHealthConditions; String? get currentTherapist;// Additional Notes
 String? get additionalNotes;// Meta Information
 DateTime get lastUpdated; DateTime get createdAt;
/// Create a copy of MedicalHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicalHistoryCopyWith<MedicalHistory> get copyWith => _$MedicalHistoryCopyWithImpl<MedicalHistory>(this as MedicalHistory, _$identity);

  /// Serializes this MedicalHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicalHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.emergencyContactRelationship, emergencyContactRelationship) || other.emergencyContactRelationship == emergencyContactRelationship)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&const DeepCollectionEquality().equals(other.chronicConditions, chronicConditions)&&const DeepCollectionEquality().equals(other.allergies, allergies)&&const DeepCollectionEquality().equals(other.currentMedications, currentMedications)&&const DeepCollectionEquality().equals(other.pastMedications, pastMedications)&&const DeepCollectionEquality().equals(other.surgeries, surgeries)&&const DeepCollectionEquality().equals(other.hospitalizations, hospitalizations)&&const DeepCollectionEquality().equals(other.familyMedicalHistory, familyMedicalHistory)&&(identical(other.isSmoker, isSmoker) || other.isSmoker == isSmoker)&&(identical(other.cigarettesPerDay, cigarettesPerDay) || other.cigarettesPerDay == cigarettesPerDay)&&(identical(other.isAlcoholConsumer, isAlcoholConsumer) || other.isAlcoholConsumer == isAlcoholConsumer)&&(identical(other.alcoholFrequency, alcoholFrequency) || other.alcoholFrequency == alcoholFrequency)&&(identical(other.usesRecreationalDrugs, usesRecreationalDrugs) || other.usesRecreationalDrugs == usesRecreationalDrugs)&&(identical(other.recreationalDrugsDetails, recreationalDrugsDetails) || other.recreationalDrugsDetails == recreationalDrugsDetails)&&(identical(other.exerciseFrequency, exerciseFrequency) || other.exerciseFrequency == exerciseFrequency)&&(identical(other.dietaryPreferences, dietaryPreferences) || other.dietaryPreferences == dietaryPreferences)&&const DeepCollectionEquality().equals(other.vaccinations, vaccinations)&&(identical(other.lastMenstrualPeriod, lastMenstrualPeriod) || other.lastMenstrualPeriod == lastMenstrualPeriod)&&(identical(other.isPregnant, isPregnant) || other.isPregnant == isPregnant)&&(identical(other.pregnancies, pregnancies) || other.pregnancies == pregnancies)&&(identical(other.liveBirths, liveBirths) || other.liveBirths == liveBirths)&&const DeepCollectionEquality().equals(other.mentalHealthConditions, mentalHealthConditions)&&(identical(other.currentTherapist, currentTherapist) || other.currentTherapist == currentTherapist)&&(identical(other.additionalNotes, additionalNotes) || other.additionalNotes == additionalNotes)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,patientId,patientName,dateOfBirth,gender,phoneNumber,email,address,emergencyContactName,emergencyContactPhone,emergencyContactRelationship,height,weight,bloodType,const DeepCollectionEquality().hash(chronicConditions),const DeepCollectionEquality().hash(allergies),const DeepCollectionEquality().hash(currentMedications),const DeepCollectionEquality().hash(pastMedications),const DeepCollectionEquality().hash(surgeries),const DeepCollectionEquality().hash(hospitalizations),const DeepCollectionEquality().hash(familyMedicalHistory),isSmoker,cigarettesPerDay,isAlcoholConsumer,alcoholFrequency,usesRecreationalDrugs,recreationalDrugsDetails,exerciseFrequency,dietaryPreferences,const DeepCollectionEquality().hash(vaccinations),lastMenstrualPeriod,isPregnant,pregnancies,liveBirths,const DeepCollectionEquality().hash(mentalHealthConditions),currentTherapist,additionalNotes,lastUpdated,createdAt]);

@override
String toString() {
  return 'MedicalHistory(id: $id, patientId: $patientId, patientName: $patientName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, emergencyContactRelationship: $emergencyContactRelationship, height: $height, weight: $weight, bloodType: $bloodType, chronicConditions: $chronicConditions, allergies: $allergies, currentMedications: $currentMedications, pastMedications: $pastMedications, surgeries: $surgeries, hospitalizations: $hospitalizations, familyMedicalHistory: $familyMedicalHistory, isSmoker: $isSmoker, cigarettesPerDay: $cigarettesPerDay, isAlcoholConsumer: $isAlcoholConsumer, alcoholFrequency: $alcoholFrequency, usesRecreationalDrugs: $usesRecreationalDrugs, recreationalDrugsDetails: $recreationalDrugsDetails, exerciseFrequency: $exerciseFrequency, dietaryPreferences: $dietaryPreferences, vaccinations: $vaccinations, lastMenstrualPeriod: $lastMenstrualPeriod, isPregnant: $isPregnant, pregnancies: $pregnancies, liveBirths: $liveBirths, mentalHealthConditions: $mentalHealthConditions, currentTherapist: $currentTherapist, additionalNotes: $additionalNotes, lastUpdated: $lastUpdated, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MedicalHistoryCopyWith<$Res>  {
  factory $MedicalHistoryCopyWith(MedicalHistory value, $Res Function(MedicalHistory) _then) = _$MedicalHistoryCopyWithImpl;
@useResult
$Res call({
 String? id, String patientId, String patientName, DateTime dateOfBirth, Gender gender, String phoneNumber, String? email, String address, String emergencyContactName, String emergencyContactPhone, String? emergencyContactRelationship, double height, double weight, BloodType bloodType, List<String>? chronicConditions, List<String>? allergies, List<String>? currentMedications, List<String>? pastMedications, List<Surgery>? surgeries, List<Hospitalization>? hospitalizations, Map<String, String>? familyMedicalHistory, bool isSmoker, int cigarettesPerDay, bool isAlcoholConsumer, String alcoholFrequency, bool usesRecreationalDrugs, String? recreationalDrugsDetails, String exerciseFrequency, String dietaryPreferences, List<Vaccination>? vaccinations, DateTime? lastMenstrualPeriod, bool? isPregnant, int? pregnancies, int? liveBirths, List<String>? mentalHealthConditions, String? currentTherapist, String? additionalNotes, DateTime lastUpdated, DateTime createdAt
});




}
/// @nodoc
class _$MedicalHistoryCopyWithImpl<$Res>
    implements $MedicalHistoryCopyWith<$Res> {
  _$MedicalHistoryCopyWithImpl(this._self, this._then);

  final MedicalHistory _self;
  final $Res Function(MedicalHistory) _then;

/// Create a copy of MedicalHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? patientId = null,Object? patientName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = freezed,Object? address = null,Object? emergencyContactName = null,Object? emergencyContactPhone = null,Object? emergencyContactRelationship = freezed,Object? height = null,Object? weight = null,Object? bloodType = null,Object? chronicConditions = freezed,Object? allergies = freezed,Object? currentMedications = freezed,Object? pastMedications = freezed,Object? surgeries = freezed,Object? hospitalizations = freezed,Object? familyMedicalHistory = freezed,Object? isSmoker = null,Object? cigarettesPerDay = null,Object? isAlcoholConsumer = null,Object? alcoholFrequency = null,Object? usesRecreationalDrugs = null,Object? recreationalDrugsDetails = freezed,Object? exerciseFrequency = null,Object? dietaryPreferences = null,Object? vaccinations = freezed,Object? lastMenstrualPeriod = freezed,Object? isPregnant = freezed,Object? pregnancies = freezed,Object? liveBirths = freezed,Object? mentalHealthConditions = freezed,Object? currentTherapist = freezed,Object? additionalNotes = freezed,Object? lastUpdated = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,emergencyContactName: null == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String,emergencyContactPhone: null == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String,emergencyContactRelationship: freezed == emergencyContactRelationship ? _self.emergencyContactRelationship : emergencyContactRelationship // ignore: cast_nullable_to_non_nullable
as String?,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as BloodType,chronicConditions: freezed == chronicConditions ? _self.chronicConditions : chronicConditions // ignore: cast_nullable_to_non_nullable
as List<String>?,allergies: freezed == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>?,currentMedications: freezed == currentMedications ? _self.currentMedications : currentMedications // ignore: cast_nullable_to_non_nullable
as List<String>?,pastMedications: freezed == pastMedications ? _self.pastMedications : pastMedications // ignore: cast_nullable_to_non_nullable
as List<String>?,surgeries: freezed == surgeries ? _self.surgeries : surgeries // ignore: cast_nullable_to_non_nullable
as List<Surgery>?,hospitalizations: freezed == hospitalizations ? _self.hospitalizations : hospitalizations // ignore: cast_nullable_to_non_nullable
as List<Hospitalization>?,familyMedicalHistory: freezed == familyMedicalHistory ? _self.familyMedicalHistory : familyMedicalHistory // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,isSmoker: null == isSmoker ? _self.isSmoker : isSmoker // ignore: cast_nullable_to_non_nullable
as bool,cigarettesPerDay: null == cigarettesPerDay ? _self.cigarettesPerDay : cigarettesPerDay // ignore: cast_nullable_to_non_nullable
as int,isAlcoholConsumer: null == isAlcoholConsumer ? _self.isAlcoholConsumer : isAlcoholConsumer // ignore: cast_nullable_to_non_nullable
as bool,alcoholFrequency: null == alcoholFrequency ? _self.alcoholFrequency : alcoholFrequency // ignore: cast_nullable_to_non_nullable
as String,usesRecreationalDrugs: null == usesRecreationalDrugs ? _self.usesRecreationalDrugs : usesRecreationalDrugs // ignore: cast_nullable_to_non_nullable
as bool,recreationalDrugsDetails: freezed == recreationalDrugsDetails ? _self.recreationalDrugsDetails : recreationalDrugsDetails // ignore: cast_nullable_to_non_nullable
as String?,exerciseFrequency: null == exerciseFrequency ? _self.exerciseFrequency : exerciseFrequency // ignore: cast_nullable_to_non_nullable
as String,dietaryPreferences: null == dietaryPreferences ? _self.dietaryPreferences : dietaryPreferences // ignore: cast_nullable_to_non_nullable
as String,vaccinations: freezed == vaccinations ? _self.vaccinations : vaccinations // ignore: cast_nullable_to_non_nullable
as List<Vaccination>?,lastMenstrualPeriod: freezed == lastMenstrualPeriod ? _self.lastMenstrualPeriod : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
as DateTime?,isPregnant: freezed == isPregnant ? _self.isPregnant : isPregnant // ignore: cast_nullable_to_non_nullable
as bool?,pregnancies: freezed == pregnancies ? _self.pregnancies : pregnancies // ignore: cast_nullable_to_non_nullable
as int?,liveBirths: freezed == liveBirths ? _self.liveBirths : liveBirths // ignore: cast_nullable_to_non_nullable
as int?,mentalHealthConditions: freezed == mentalHealthConditions ? _self.mentalHealthConditions : mentalHealthConditions // ignore: cast_nullable_to_non_nullable
as List<String>?,currentTherapist: freezed == currentTherapist ? _self.currentTherapist : currentTherapist // ignore: cast_nullable_to_non_nullable
as String?,additionalNotes: freezed == additionalNotes ? _self.additionalNotes : additionalNotes // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicalHistory].
extension MedicalHistoryPatterns on MedicalHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicalHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicalHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicalHistory value)  $default,){
final _that = this;
switch (_that) {
case _MedicalHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicalHistory value)?  $default,){
final _that = this;
switch (_that) {
case _MedicalHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String patientId,  String patientName,  DateTime dateOfBirth,  Gender gender,  String phoneNumber,  String? email,  String address,  String emergencyContactName,  String emergencyContactPhone,  String? emergencyContactRelationship,  double height,  double weight,  BloodType bloodType,  List<String>? chronicConditions,  List<String>? allergies,  List<String>? currentMedications,  List<String>? pastMedications,  List<Surgery>? surgeries,  List<Hospitalization>? hospitalizations,  Map<String, String>? familyMedicalHistory,  bool isSmoker,  int cigarettesPerDay,  bool isAlcoholConsumer,  String alcoholFrequency,  bool usesRecreationalDrugs,  String? recreationalDrugsDetails,  String exerciseFrequency,  String dietaryPreferences,  List<Vaccination>? vaccinations,  DateTime? lastMenstrualPeriod,  bool? isPregnant,  int? pregnancies,  int? liveBirths,  List<String>? mentalHealthConditions,  String? currentTherapist,  String? additionalNotes,  DateTime lastUpdated,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicalHistory() when $default != null:
return $default(_that.id,_that.patientId,_that.patientName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelationship,_that.height,_that.weight,_that.bloodType,_that.chronicConditions,_that.allergies,_that.currentMedications,_that.pastMedications,_that.surgeries,_that.hospitalizations,_that.familyMedicalHistory,_that.isSmoker,_that.cigarettesPerDay,_that.isAlcoholConsumer,_that.alcoholFrequency,_that.usesRecreationalDrugs,_that.recreationalDrugsDetails,_that.exerciseFrequency,_that.dietaryPreferences,_that.vaccinations,_that.lastMenstrualPeriod,_that.isPregnant,_that.pregnancies,_that.liveBirths,_that.mentalHealthConditions,_that.currentTherapist,_that.additionalNotes,_that.lastUpdated,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String patientId,  String patientName,  DateTime dateOfBirth,  Gender gender,  String phoneNumber,  String? email,  String address,  String emergencyContactName,  String emergencyContactPhone,  String? emergencyContactRelationship,  double height,  double weight,  BloodType bloodType,  List<String>? chronicConditions,  List<String>? allergies,  List<String>? currentMedications,  List<String>? pastMedications,  List<Surgery>? surgeries,  List<Hospitalization>? hospitalizations,  Map<String, String>? familyMedicalHistory,  bool isSmoker,  int cigarettesPerDay,  bool isAlcoholConsumer,  String alcoholFrequency,  bool usesRecreationalDrugs,  String? recreationalDrugsDetails,  String exerciseFrequency,  String dietaryPreferences,  List<Vaccination>? vaccinations,  DateTime? lastMenstrualPeriod,  bool? isPregnant,  int? pregnancies,  int? liveBirths,  List<String>? mentalHealthConditions,  String? currentTherapist,  String? additionalNotes,  DateTime lastUpdated,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MedicalHistory():
return $default(_that.id,_that.patientId,_that.patientName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelationship,_that.height,_that.weight,_that.bloodType,_that.chronicConditions,_that.allergies,_that.currentMedications,_that.pastMedications,_that.surgeries,_that.hospitalizations,_that.familyMedicalHistory,_that.isSmoker,_that.cigarettesPerDay,_that.isAlcoholConsumer,_that.alcoholFrequency,_that.usesRecreationalDrugs,_that.recreationalDrugsDetails,_that.exerciseFrequency,_that.dietaryPreferences,_that.vaccinations,_that.lastMenstrualPeriod,_that.isPregnant,_that.pregnancies,_that.liveBirths,_that.mentalHealthConditions,_that.currentTherapist,_that.additionalNotes,_that.lastUpdated,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String patientId,  String patientName,  DateTime dateOfBirth,  Gender gender,  String phoneNumber,  String? email,  String address,  String emergencyContactName,  String emergencyContactPhone,  String? emergencyContactRelationship,  double height,  double weight,  BloodType bloodType,  List<String>? chronicConditions,  List<String>? allergies,  List<String>? currentMedications,  List<String>? pastMedications,  List<Surgery>? surgeries,  List<Hospitalization>? hospitalizations,  Map<String, String>? familyMedicalHistory,  bool isSmoker,  int cigarettesPerDay,  bool isAlcoholConsumer,  String alcoholFrequency,  bool usesRecreationalDrugs,  String? recreationalDrugsDetails,  String exerciseFrequency,  String dietaryPreferences,  List<Vaccination>? vaccinations,  DateTime? lastMenstrualPeriod,  bool? isPregnant,  int? pregnancies,  int? liveBirths,  List<String>? mentalHealthConditions,  String? currentTherapist,  String? additionalNotes,  DateTime lastUpdated,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MedicalHistory() when $default != null:
return $default(_that.id,_that.patientId,_that.patientName,_that.dateOfBirth,_that.gender,_that.phoneNumber,_that.email,_that.address,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelationship,_that.height,_that.weight,_that.bloodType,_that.chronicConditions,_that.allergies,_that.currentMedications,_that.pastMedications,_that.surgeries,_that.hospitalizations,_that.familyMedicalHistory,_that.isSmoker,_that.cigarettesPerDay,_that.isAlcoholConsumer,_that.alcoholFrequency,_that.usesRecreationalDrugs,_that.recreationalDrugsDetails,_that.exerciseFrequency,_that.dietaryPreferences,_that.vaccinations,_that.lastMenstrualPeriod,_that.isPregnant,_that.pregnancies,_that.liveBirths,_that.mentalHealthConditions,_that.currentTherapist,_that.additionalNotes,_that.lastUpdated,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicalHistory implements MedicalHistory {
  const _MedicalHistory({this.id, required this.patientId, required this.patientName, required this.dateOfBirth, required this.gender, required this.phoneNumber, this.email, required this.address, required this.emergencyContactName, required this.emergencyContactPhone, this.emergencyContactRelationship, required this.height, required this.weight, required this.bloodType, final  List<String>? chronicConditions, final  List<String>? allergies, final  List<String>? currentMedications, final  List<String>? pastMedications, final  List<Surgery>? surgeries, final  List<Hospitalization>? hospitalizations, final  Map<String, String>? familyMedicalHistory, required this.isSmoker, required this.cigarettesPerDay, required this.isAlcoholConsumer, required this.alcoholFrequency, required this.usesRecreationalDrugs, this.recreationalDrugsDetails, required this.exerciseFrequency, required this.dietaryPreferences, final  List<Vaccination>? vaccinations, this.lastMenstrualPeriod, this.isPregnant, this.pregnancies, this.liveBirths, final  List<String>? mentalHealthConditions, this.currentTherapist, this.additionalNotes, required this.lastUpdated, required this.createdAt}): _chronicConditions = chronicConditions,_allergies = allergies,_currentMedications = currentMedications,_pastMedications = pastMedications,_surgeries = surgeries,_hospitalizations = hospitalizations,_familyMedicalHistory = familyMedicalHistory,_vaccinations = vaccinations,_mentalHealthConditions = mentalHealthConditions;
  factory _MedicalHistory.fromJson(Map<String, dynamic> json) => _$MedicalHistoryFromJson(json);

// Personal Information
@override final  String? id;
@override final  String patientId;
@override final  String patientName;
@override final  DateTime dateOfBirth;
@override final  Gender gender;
// Contact Information
@override final  String phoneNumber;
@override final  String? email;
@override final  String address;
// Emergency Contact
@override final  String emergencyContactName;
@override final  String emergencyContactPhone;
@override final  String? emergencyContactRelationship;
// Vital Statistics
@override final  double height;
@override final  double weight;
@override final  BloodType bloodType;
// Medical Conditions
 final  List<String>? _chronicConditions;
// Medical Conditions
@override List<String>? get chronicConditions {
  final value = _chronicConditions;
  if (value == null) return null;
  if (_chronicConditions is EqualUnmodifiableListView) return _chronicConditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _allergies;
@override List<String>? get allergies {
  final value = _allergies;
  if (value == null) return null;
  if (_allergies is EqualUnmodifiableListView) return _allergies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _currentMedications;
@override List<String>? get currentMedications {
  final value = _currentMedications;
  if (value == null) return null;
  if (_currentMedications is EqualUnmodifiableListView) return _currentMedications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _pastMedications;
@override List<String>? get pastMedications {
  final value = _pastMedications;
  if (value == null) return null;
  if (_pastMedications is EqualUnmodifiableListView) return _pastMedications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Surgical History
 final  List<Surgery>? _surgeries;
// Surgical History
@override List<Surgery>? get surgeries {
  final value = _surgeries;
  if (value == null) return null;
  if (_surgeries is EqualUnmodifiableListView) return _surgeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Hospitalizations
 final  List<Hospitalization>? _hospitalizations;
// Hospitalizations
@override List<Hospitalization>? get hospitalizations {
  final value = _hospitalizations;
  if (value == null) return null;
  if (_hospitalizations is EqualUnmodifiableListView) return _hospitalizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Family History
 final  Map<String, String>? _familyMedicalHistory;
// Family History
@override Map<String, String>? get familyMedicalHistory {
  final value = _familyMedicalHistory;
  if (value == null) return null;
  if (_familyMedicalHistory is EqualUnmodifiableMapView) return _familyMedicalHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

// Lifestyle
@override final  bool isSmoker;
@override final  int cigarettesPerDay;
@override final  bool isAlcoholConsumer;
@override final  String alcoholFrequency;
@override final  bool usesRecreationalDrugs;
@override final  String? recreationalDrugsDetails;
// Exercise & Diet
@override final  String exerciseFrequency;
@override final  String dietaryPreferences;
// Vaccination History
 final  List<Vaccination>? _vaccinations;
// Vaccination History
@override List<Vaccination>? get vaccinations {
  final value = _vaccinations;
  if (value == null) return null;
  if (_vaccinations is EqualUnmodifiableListView) return _vaccinations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Women's Health
@override final  DateTime? lastMenstrualPeriod;
@override final  bool? isPregnant;
@override final  int? pregnancies;
@override final  int? liveBirths;
// Mental Health
 final  List<String>? _mentalHealthConditions;
// Mental Health
@override List<String>? get mentalHealthConditions {
  final value = _mentalHealthConditions;
  if (value == null) return null;
  if (_mentalHealthConditions is EqualUnmodifiableListView) return _mentalHealthConditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? currentTherapist;
// Additional Notes
@override final  String? additionalNotes;
// Meta Information
@override final  DateTime lastUpdated;
@override final  DateTime createdAt;

/// Create a copy of MedicalHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicalHistoryCopyWith<_MedicalHistory> get copyWith => __$MedicalHistoryCopyWithImpl<_MedicalHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicalHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicalHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.emergencyContactRelationship, emergencyContactRelationship) || other.emergencyContactRelationship == emergencyContactRelationship)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&const DeepCollectionEquality().equals(other._chronicConditions, _chronicConditions)&&const DeepCollectionEquality().equals(other._allergies, _allergies)&&const DeepCollectionEquality().equals(other._currentMedications, _currentMedications)&&const DeepCollectionEquality().equals(other._pastMedications, _pastMedications)&&const DeepCollectionEquality().equals(other._surgeries, _surgeries)&&const DeepCollectionEquality().equals(other._hospitalizations, _hospitalizations)&&const DeepCollectionEquality().equals(other._familyMedicalHistory, _familyMedicalHistory)&&(identical(other.isSmoker, isSmoker) || other.isSmoker == isSmoker)&&(identical(other.cigarettesPerDay, cigarettesPerDay) || other.cigarettesPerDay == cigarettesPerDay)&&(identical(other.isAlcoholConsumer, isAlcoholConsumer) || other.isAlcoholConsumer == isAlcoholConsumer)&&(identical(other.alcoholFrequency, alcoholFrequency) || other.alcoholFrequency == alcoholFrequency)&&(identical(other.usesRecreationalDrugs, usesRecreationalDrugs) || other.usesRecreationalDrugs == usesRecreationalDrugs)&&(identical(other.recreationalDrugsDetails, recreationalDrugsDetails) || other.recreationalDrugsDetails == recreationalDrugsDetails)&&(identical(other.exerciseFrequency, exerciseFrequency) || other.exerciseFrequency == exerciseFrequency)&&(identical(other.dietaryPreferences, dietaryPreferences) || other.dietaryPreferences == dietaryPreferences)&&const DeepCollectionEquality().equals(other._vaccinations, _vaccinations)&&(identical(other.lastMenstrualPeriod, lastMenstrualPeriod) || other.lastMenstrualPeriod == lastMenstrualPeriod)&&(identical(other.isPregnant, isPregnant) || other.isPregnant == isPregnant)&&(identical(other.pregnancies, pregnancies) || other.pregnancies == pregnancies)&&(identical(other.liveBirths, liveBirths) || other.liveBirths == liveBirths)&&const DeepCollectionEquality().equals(other._mentalHealthConditions, _mentalHealthConditions)&&(identical(other.currentTherapist, currentTherapist) || other.currentTherapist == currentTherapist)&&(identical(other.additionalNotes, additionalNotes) || other.additionalNotes == additionalNotes)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,patientId,patientName,dateOfBirth,gender,phoneNumber,email,address,emergencyContactName,emergencyContactPhone,emergencyContactRelationship,height,weight,bloodType,const DeepCollectionEquality().hash(_chronicConditions),const DeepCollectionEquality().hash(_allergies),const DeepCollectionEquality().hash(_currentMedications),const DeepCollectionEquality().hash(_pastMedications),const DeepCollectionEquality().hash(_surgeries),const DeepCollectionEquality().hash(_hospitalizations),const DeepCollectionEquality().hash(_familyMedicalHistory),isSmoker,cigarettesPerDay,isAlcoholConsumer,alcoholFrequency,usesRecreationalDrugs,recreationalDrugsDetails,exerciseFrequency,dietaryPreferences,const DeepCollectionEquality().hash(_vaccinations),lastMenstrualPeriod,isPregnant,pregnancies,liveBirths,const DeepCollectionEquality().hash(_mentalHealthConditions),currentTherapist,additionalNotes,lastUpdated,createdAt]);

@override
String toString() {
  return 'MedicalHistory(id: $id, patientId: $patientId, patientName: $patientName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, email: $email, address: $address, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, emergencyContactRelationship: $emergencyContactRelationship, height: $height, weight: $weight, bloodType: $bloodType, chronicConditions: $chronicConditions, allergies: $allergies, currentMedications: $currentMedications, pastMedications: $pastMedications, surgeries: $surgeries, hospitalizations: $hospitalizations, familyMedicalHistory: $familyMedicalHistory, isSmoker: $isSmoker, cigarettesPerDay: $cigarettesPerDay, isAlcoholConsumer: $isAlcoholConsumer, alcoholFrequency: $alcoholFrequency, usesRecreationalDrugs: $usesRecreationalDrugs, recreationalDrugsDetails: $recreationalDrugsDetails, exerciseFrequency: $exerciseFrequency, dietaryPreferences: $dietaryPreferences, vaccinations: $vaccinations, lastMenstrualPeriod: $lastMenstrualPeriod, isPregnant: $isPregnant, pregnancies: $pregnancies, liveBirths: $liveBirths, mentalHealthConditions: $mentalHealthConditions, currentTherapist: $currentTherapist, additionalNotes: $additionalNotes, lastUpdated: $lastUpdated, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MedicalHistoryCopyWith<$Res> implements $MedicalHistoryCopyWith<$Res> {
  factory _$MedicalHistoryCopyWith(_MedicalHistory value, $Res Function(_MedicalHistory) _then) = __$MedicalHistoryCopyWithImpl;
@override @useResult
$Res call({
 String? id, String patientId, String patientName, DateTime dateOfBirth, Gender gender, String phoneNumber, String? email, String address, String emergencyContactName, String emergencyContactPhone, String? emergencyContactRelationship, double height, double weight, BloodType bloodType, List<String>? chronicConditions, List<String>? allergies, List<String>? currentMedications, List<String>? pastMedications, List<Surgery>? surgeries, List<Hospitalization>? hospitalizations, Map<String, String>? familyMedicalHistory, bool isSmoker, int cigarettesPerDay, bool isAlcoholConsumer, String alcoholFrequency, bool usesRecreationalDrugs, String? recreationalDrugsDetails, String exerciseFrequency, String dietaryPreferences, List<Vaccination>? vaccinations, DateTime? lastMenstrualPeriod, bool? isPregnant, int? pregnancies, int? liveBirths, List<String>? mentalHealthConditions, String? currentTherapist, String? additionalNotes, DateTime lastUpdated, DateTime createdAt
});




}
/// @nodoc
class __$MedicalHistoryCopyWithImpl<$Res>
    implements _$MedicalHistoryCopyWith<$Res> {
  __$MedicalHistoryCopyWithImpl(this._self, this._then);

  final _MedicalHistory _self;
  final $Res Function(_MedicalHistory) _then;

/// Create a copy of MedicalHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? patientId = null,Object? patientName = null,Object? dateOfBirth = null,Object? gender = null,Object? phoneNumber = null,Object? email = freezed,Object? address = null,Object? emergencyContactName = null,Object? emergencyContactPhone = null,Object? emergencyContactRelationship = freezed,Object? height = null,Object? weight = null,Object? bloodType = null,Object? chronicConditions = freezed,Object? allergies = freezed,Object? currentMedications = freezed,Object? pastMedications = freezed,Object? surgeries = freezed,Object? hospitalizations = freezed,Object? familyMedicalHistory = freezed,Object? isSmoker = null,Object? cigarettesPerDay = null,Object? isAlcoholConsumer = null,Object? alcoholFrequency = null,Object? usesRecreationalDrugs = null,Object? recreationalDrugsDetails = freezed,Object? exerciseFrequency = null,Object? dietaryPreferences = null,Object? vaccinations = freezed,Object? lastMenstrualPeriod = freezed,Object? isPregnant = freezed,Object? pregnancies = freezed,Object? liveBirths = freezed,Object? mentalHealthConditions = freezed,Object? currentTherapist = freezed,Object? additionalNotes = freezed,Object? lastUpdated = null,Object? createdAt = null,}) {
  return _then(_MedicalHistory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,emergencyContactName: null == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String,emergencyContactPhone: null == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String,emergencyContactRelationship: freezed == emergencyContactRelationship ? _self.emergencyContactRelationship : emergencyContactRelationship // ignore: cast_nullable_to_non_nullable
as String?,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as BloodType,chronicConditions: freezed == chronicConditions ? _self._chronicConditions : chronicConditions // ignore: cast_nullable_to_non_nullable
as List<String>?,allergies: freezed == allergies ? _self._allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>?,currentMedications: freezed == currentMedications ? _self._currentMedications : currentMedications // ignore: cast_nullable_to_non_nullable
as List<String>?,pastMedications: freezed == pastMedications ? _self._pastMedications : pastMedications // ignore: cast_nullable_to_non_nullable
as List<String>?,surgeries: freezed == surgeries ? _self._surgeries : surgeries // ignore: cast_nullable_to_non_nullable
as List<Surgery>?,hospitalizations: freezed == hospitalizations ? _self._hospitalizations : hospitalizations // ignore: cast_nullable_to_non_nullable
as List<Hospitalization>?,familyMedicalHistory: freezed == familyMedicalHistory ? _self._familyMedicalHistory : familyMedicalHistory // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,isSmoker: null == isSmoker ? _self.isSmoker : isSmoker // ignore: cast_nullable_to_non_nullable
as bool,cigarettesPerDay: null == cigarettesPerDay ? _self.cigarettesPerDay : cigarettesPerDay // ignore: cast_nullable_to_non_nullable
as int,isAlcoholConsumer: null == isAlcoholConsumer ? _self.isAlcoholConsumer : isAlcoholConsumer // ignore: cast_nullable_to_non_nullable
as bool,alcoholFrequency: null == alcoholFrequency ? _self.alcoholFrequency : alcoholFrequency // ignore: cast_nullable_to_non_nullable
as String,usesRecreationalDrugs: null == usesRecreationalDrugs ? _self.usesRecreationalDrugs : usesRecreationalDrugs // ignore: cast_nullable_to_non_nullable
as bool,recreationalDrugsDetails: freezed == recreationalDrugsDetails ? _self.recreationalDrugsDetails : recreationalDrugsDetails // ignore: cast_nullable_to_non_nullable
as String?,exerciseFrequency: null == exerciseFrequency ? _self.exerciseFrequency : exerciseFrequency // ignore: cast_nullable_to_non_nullable
as String,dietaryPreferences: null == dietaryPreferences ? _self.dietaryPreferences : dietaryPreferences // ignore: cast_nullable_to_non_nullable
as String,vaccinations: freezed == vaccinations ? _self._vaccinations : vaccinations // ignore: cast_nullable_to_non_nullable
as List<Vaccination>?,lastMenstrualPeriod: freezed == lastMenstrualPeriod ? _self.lastMenstrualPeriod : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
as DateTime?,isPregnant: freezed == isPregnant ? _self.isPregnant : isPregnant // ignore: cast_nullable_to_non_nullable
as bool?,pregnancies: freezed == pregnancies ? _self.pregnancies : pregnancies // ignore: cast_nullable_to_non_nullable
as int?,liveBirths: freezed == liveBirths ? _self.liveBirths : liveBirths // ignore: cast_nullable_to_non_nullable
as int?,mentalHealthConditions: freezed == mentalHealthConditions ? _self._mentalHealthConditions : mentalHealthConditions // ignore: cast_nullable_to_non_nullable
as List<String>?,currentTherapist: freezed == currentTherapist ? _self.currentTherapist : currentTherapist // ignore: cast_nullable_to_non_nullable
as String?,additionalNotes: freezed == additionalNotes ? _self.additionalNotes : additionalNotes // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Surgery {

 String get procedureName; DateTime get date; String? get hospitalName; String? get surgeonName; String? get complications;
/// Create a copy of Surgery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurgeryCopyWith<Surgery> get copyWith => _$SurgeryCopyWithImpl<Surgery>(this as Surgery, _$identity);

  /// Serializes this Surgery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Surgery&&(identical(other.procedureName, procedureName) || other.procedureName == procedureName)&&(identical(other.date, date) || other.date == date)&&(identical(other.hospitalName, hospitalName) || other.hospitalName == hospitalName)&&(identical(other.surgeonName, surgeonName) || other.surgeonName == surgeonName)&&(identical(other.complications, complications) || other.complications == complications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,procedureName,date,hospitalName,surgeonName,complications);

@override
String toString() {
  return 'Surgery(procedureName: $procedureName, date: $date, hospitalName: $hospitalName, surgeonName: $surgeonName, complications: $complications)';
}


}

/// @nodoc
abstract mixin class $SurgeryCopyWith<$Res>  {
  factory $SurgeryCopyWith(Surgery value, $Res Function(Surgery) _then) = _$SurgeryCopyWithImpl;
@useResult
$Res call({
 String procedureName, DateTime date, String? hospitalName, String? surgeonName, String? complications
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
@pragma('vm:prefer-inline') @override $Res call({Object? procedureName = null,Object? date = null,Object? hospitalName = freezed,Object? surgeonName = freezed,Object? complications = freezed,}) {
  return _then(_self.copyWith(
procedureName: null == procedureName ? _self.procedureName : procedureName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,hospitalName: freezed == hospitalName ? _self.hospitalName : hospitalName // ignore: cast_nullable_to_non_nullable
as String?,surgeonName: freezed == surgeonName ? _self.surgeonName : surgeonName // ignore: cast_nullable_to_non_nullable
as String?,complications: freezed == complications ? _self.complications : complications // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String procedureName,  DateTime date,  String? hospitalName,  String? surgeonName,  String? complications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Surgery() when $default != null:
return $default(_that.procedureName,_that.date,_that.hospitalName,_that.surgeonName,_that.complications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String procedureName,  DateTime date,  String? hospitalName,  String? surgeonName,  String? complications)  $default,) {final _that = this;
switch (_that) {
case _Surgery():
return $default(_that.procedureName,_that.date,_that.hospitalName,_that.surgeonName,_that.complications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String procedureName,  DateTime date,  String? hospitalName,  String? surgeonName,  String? complications)?  $default,) {final _that = this;
switch (_that) {
case _Surgery() when $default != null:
return $default(_that.procedureName,_that.date,_that.hospitalName,_that.surgeonName,_that.complications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Surgery implements Surgery {
  const _Surgery({required this.procedureName, required this.date, this.hospitalName, this.surgeonName, this.complications});
  factory _Surgery.fromJson(Map<String, dynamic> json) => _$SurgeryFromJson(json);

@override final  String procedureName;
@override final  DateTime date;
@override final  String? hospitalName;
@override final  String? surgeonName;
@override final  String? complications;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Surgery&&(identical(other.procedureName, procedureName) || other.procedureName == procedureName)&&(identical(other.date, date) || other.date == date)&&(identical(other.hospitalName, hospitalName) || other.hospitalName == hospitalName)&&(identical(other.surgeonName, surgeonName) || other.surgeonName == surgeonName)&&(identical(other.complications, complications) || other.complications == complications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,procedureName,date,hospitalName,surgeonName,complications);

@override
String toString() {
  return 'Surgery(procedureName: $procedureName, date: $date, hospitalName: $hospitalName, surgeonName: $surgeonName, complications: $complications)';
}


}

/// @nodoc
abstract mixin class _$SurgeryCopyWith<$Res> implements $SurgeryCopyWith<$Res> {
  factory _$SurgeryCopyWith(_Surgery value, $Res Function(_Surgery) _then) = __$SurgeryCopyWithImpl;
@override @useResult
$Res call({
 String procedureName, DateTime date, String? hospitalName, String? surgeonName, String? complications
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
@override @pragma('vm:prefer-inline') $Res call({Object? procedureName = null,Object? date = null,Object? hospitalName = freezed,Object? surgeonName = freezed,Object? complications = freezed,}) {
  return _then(_Surgery(
procedureName: null == procedureName ? _self.procedureName : procedureName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,hospitalName: freezed == hospitalName ? _self.hospitalName : hospitalName // ignore: cast_nullable_to_non_nullable
as String?,surgeonName: freezed == surgeonName ? _self.surgeonName : surgeonName // ignore: cast_nullable_to_non_nullable
as String?,complications: freezed == complications ? _self.complications : complications // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Hospitalization {

 DateTime get admissionDate; DateTime get dischargeDate; String get reason; String? get hospitalName; String? get treatmentDetails;
/// Create a copy of Hospitalization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HospitalizationCopyWith<Hospitalization> get copyWith => _$HospitalizationCopyWithImpl<Hospitalization>(this as Hospitalization, _$identity);

  /// Serializes this Hospitalization to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hospitalization&&(identical(other.admissionDate, admissionDate) || other.admissionDate == admissionDate)&&(identical(other.dischargeDate, dischargeDate) || other.dischargeDate == dischargeDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.hospitalName, hospitalName) || other.hospitalName == hospitalName)&&(identical(other.treatmentDetails, treatmentDetails) || other.treatmentDetails == treatmentDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionDate,dischargeDate,reason,hospitalName,treatmentDetails);

@override
String toString() {
  return 'Hospitalization(admissionDate: $admissionDate, dischargeDate: $dischargeDate, reason: $reason, hospitalName: $hospitalName, treatmentDetails: $treatmentDetails)';
}


}

/// @nodoc
abstract mixin class $HospitalizationCopyWith<$Res>  {
  factory $HospitalizationCopyWith(Hospitalization value, $Res Function(Hospitalization) _then) = _$HospitalizationCopyWithImpl;
@useResult
$Res call({
 DateTime admissionDate, DateTime dischargeDate, String reason, String? hospitalName, String? treatmentDetails
});




}
/// @nodoc
class _$HospitalizationCopyWithImpl<$Res>
    implements $HospitalizationCopyWith<$Res> {
  _$HospitalizationCopyWithImpl(this._self, this._then);

  final Hospitalization _self;
  final $Res Function(Hospitalization) _then;

/// Create a copy of Hospitalization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? admissionDate = null,Object? dischargeDate = null,Object? reason = null,Object? hospitalName = freezed,Object? treatmentDetails = freezed,}) {
  return _then(_self.copyWith(
admissionDate: null == admissionDate ? _self.admissionDate : admissionDate // ignore: cast_nullable_to_non_nullable
as DateTime,dischargeDate: null == dischargeDate ? _self.dischargeDate : dischargeDate // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,hospitalName: freezed == hospitalName ? _self.hospitalName : hospitalName // ignore: cast_nullable_to_non_nullable
as String?,treatmentDetails: freezed == treatmentDetails ? _self.treatmentDetails : treatmentDetails // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Hospitalization].
extension HospitalizationPatterns on Hospitalization {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hospitalization value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hospitalization() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hospitalization value)  $default,){
final _that = this;
switch (_that) {
case _Hospitalization():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hospitalization value)?  $default,){
final _that = this;
switch (_that) {
case _Hospitalization() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime admissionDate,  DateTime dischargeDate,  String reason,  String? hospitalName,  String? treatmentDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hospitalization() when $default != null:
return $default(_that.admissionDate,_that.dischargeDate,_that.reason,_that.hospitalName,_that.treatmentDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime admissionDate,  DateTime dischargeDate,  String reason,  String? hospitalName,  String? treatmentDetails)  $default,) {final _that = this;
switch (_that) {
case _Hospitalization():
return $default(_that.admissionDate,_that.dischargeDate,_that.reason,_that.hospitalName,_that.treatmentDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime admissionDate,  DateTime dischargeDate,  String reason,  String? hospitalName,  String? treatmentDetails)?  $default,) {final _that = this;
switch (_that) {
case _Hospitalization() when $default != null:
return $default(_that.admissionDate,_that.dischargeDate,_that.reason,_that.hospitalName,_that.treatmentDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hospitalization implements Hospitalization {
  const _Hospitalization({required this.admissionDate, required this.dischargeDate, required this.reason, this.hospitalName, this.treatmentDetails});
  factory _Hospitalization.fromJson(Map<String, dynamic> json) => _$HospitalizationFromJson(json);

@override final  DateTime admissionDate;
@override final  DateTime dischargeDate;
@override final  String reason;
@override final  String? hospitalName;
@override final  String? treatmentDetails;

/// Create a copy of Hospitalization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HospitalizationCopyWith<_Hospitalization> get copyWith => __$HospitalizationCopyWithImpl<_Hospitalization>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HospitalizationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hospitalization&&(identical(other.admissionDate, admissionDate) || other.admissionDate == admissionDate)&&(identical(other.dischargeDate, dischargeDate) || other.dischargeDate == dischargeDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.hospitalName, hospitalName) || other.hospitalName == hospitalName)&&(identical(other.treatmentDetails, treatmentDetails) || other.treatmentDetails == treatmentDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionDate,dischargeDate,reason,hospitalName,treatmentDetails);

@override
String toString() {
  return 'Hospitalization(admissionDate: $admissionDate, dischargeDate: $dischargeDate, reason: $reason, hospitalName: $hospitalName, treatmentDetails: $treatmentDetails)';
}


}

/// @nodoc
abstract mixin class _$HospitalizationCopyWith<$Res> implements $HospitalizationCopyWith<$Res> {
  factory _$HospitalizationCopyWith(_Hospitalization value, $Res Function(_Hospitalization) _then) = __$HospitalizationCopyWithImpl;
@override @useResult
$Res call({
 DateTime admissionDate, DateTime dischargeDate, String reason, String? hospitalName, String? treatmentDetails
});




}
/// @nodoc
class __$HospitalizationCopyWithImpl<$Res>
    implements _$HospitalizationCopyWith<$Res> {
  __$HospitalizationCopyWithImpl(this._self, this._then);

  final _Hospitalization _self;
  final $Res Function(_Hospitalization) _then;

/// Create a copy of Hospitalization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? admissionDate = null,Object? dischargeDate = null,Object? reason = null,Object? hospitalName = freezed,Object? treatmentDetails = freezed,}) {
  return _then(_Hospitalization(
admissionDate: null == admissionDate ? _self.admissionDate : admissionDate // ignore: cast_nullable_to_non_nullable
as DateTime,dischargeDate: null == dischargeDate ? _self.dischargeDate : dischargeDate // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,hospitalName: freezed == hospitalName ? _self.hospitalName : hospitalName // ignore: cast_nullable_to_non_nullable
as String?,treatmentDetails: freezed == treatmentDetails ? _self.treatmentDetails : treatmentDetails // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Vaccination {

 String get vaccineName; DateTime get dateAdministered; DateTime? get expirationDate; String? get administeringFacility; String? get lotNumber;
/// Create a copy of Vaccination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaccinationCopyWith<Vaccination> get copyWith => _$VaccinationCopyWithImpl<Vaccination>(this as Vaccination, _$identity);

  /// Serializes this Vaccination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vaccination&&(identical(other.vaccineName, vaccineName) || other.vaccineName == vaccineName)&&(identical(other.dateAdministered, dateAdministered) || other.dateAdministered == dateAdministered)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.administeringFacility, administeringFacility) || other.administeringFacility == administeringFacility)&&(identical(other.lotNumber, lotNumber) || other.lotNumber == lotNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vaccineName,dateAdministered,expirationDate,administeringFacility,lotNumber);

@override
String toString() {
  return 'Vaccination(vaccineName: $vaccineName, dateAdministered: $dateAdministered, expirationDate: $expirationDate, administeringFacility: $administeringFacility, lotNumber: $lotNumber)';
}


}

/// @nodoc
abstract mixin class $VaccinationCopyWith<$Res>  {
  factory $VaccinationCopyWith(Vaccination value, $Res Function(Vaccination) _then) = _$VaccinationCopyWithImpl;
@useResult
$Res call({
 String vaccineName, DateTime dateAdministered, DateTime? expirationDate, String? administeringFacility, String? lotNumber
});




}
/// @nodoc
class _$VaccinationCopyWithImpl<$Res>
    implements $VaccinationCopyWith<$Res> {
  _$VaccinationCopyWithImpl(this._self, this._then);

  final Vaccination _self;
  final $Res Function(Vaccination) _then;

/// Create a copy of Vaccination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vaccineName = null,Object? dateAdministered = null,Object? expirationDate = freezed,Object? administeringFacility = freezed,Object? lotNumber = freezed,}) {
  return _then(_self.copyWith(
vaccineName: null == vaccineName ? _self.vaccineName : vaccineName // ignore: cast_nullable_to_non_nullable
as String,dateAdministered: null == dateAdministered ? _self.dateAdministered : dateAdministered // ignore: cast_nullable_to_non_nullable
as DateTime,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,administeringFacility: freezed == administeringFacility ? _self.administeringFacility : administeringFacility // ignore: cast_nullable_to_non_nullable
as String?,lotNumber: freezed == lotNumber ? _self.lotNumber : lotNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Vaccination].
extension VaccinationPatterns on Vaccination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vaccination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vaccination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vaccination value)  $default,){
final _that = this;
switch (_that) {
case _Vaccination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vaccination value)?  $default,){
final _that = this;
switch (_that) {
case _Vaccination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vaccineName,  DateTime dateAdministered,  DateTime? expirationDate,  String? administeringFacility,  String? lotNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vaccination() when $default != null:
return $default(_that.vaccineName,_that.dateAdministered,_that.expirationDate,_that.administeringFacility,_that.lotNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vaccineName,  DateTime dateAdministered,  DateTime? expirationDate,  String? administeringFacility,  String? lotNumber)  $default,) {final _that = this;
switch (_that) {
case _Vaccination():
return $default(_that.vaccineName,_that.dateAdministered,_that.expirationDate,_that.administeringFacility,_that.lotNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vaccineName,  DateTime dateAdministered,  DateTime? expirationDate,  String? administeringFacility,  String? lotNumber)?  $default,) {final _that = this;
switch (_that) {
case _Vaccination() when $default != null:
return $default(_that.vaccineName,_that.dateAdministered,_that.expirationDate,_that.administeringFacility,_that.lotNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vaccination implements Vaccination {
  const _Vaccination({required this.vaccineName, required this.dateAdministered, this.expirationDate, this.administeringFacility, this.lotNumber});
  factory _Vaccination.fromJson(Map<String, dynamic> json) => _$VaccinationFromJson(json);

@override final  String vaccineName;
@override final  DateTime dateAdministered;
@override final  DateTime? expirationDate;
@override final  String? administeringFacility;
@override final  String? lotNumber;

/// Create a copy of Vaccination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaccinationCopyWith<_Vaccination> get copyWith => __$VaccinationCopyWithImpl<_Vaccination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VaccinationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vaccination&&(identical(other.vaccineName, vaccineName) || other.vaccineName == vaccineName)&&(identical(other.dateAdministered, dateAdministered) || other.dateAdministered == dateAdministered)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.administeringFacility, administeringFacility) || other.administeringFacility == administeringFacility)&&(identical(other.lotNumber, lotNumber) || other.lotNumber == lotNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vaccineName,dateAdministered,expirationDate,administeringFacility,lotNumber);

@override
String toString() {
  return 'Vaccination(vaccineName: $vaccineName, dateAdministered: $dateAdministered, expirationDate: $expirationDate, administeringFacility: $administeringFacility, lotNumber: $lotNumber)';
}


}

/// @nodoc
abstract mixin class _$VaccinationCopyWith<$Res> implements $VaccinationCopyWith<$Res> {
  factory _$VaccinationCopyWith(_Vaccination value, $Res Function(_Vaccination) _then) = __$VaccinationCopyWithImpl;
@override @useResult
$Res call({
 String vaccineName, DateTime dateAdministered, DateTime? expirationDate, String? administeringFacility, String? lotNumber
});




}
/// @nodoc
class __$VaccinationCopyWithImpl<$Res>
    implements _$VaccinationCopyWith<$Res> {
  __$VaccinationCopyWithImpl(this._self, this._then);

  final _Vaccination _self;
  final $Res Function(_Vaccination) _then;

/// Create a copy of Vaccination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vaccineName = null,Object? dateAdministered = null,Object? expirationDate = freezed,Object? administeringFacility = freezed,Object? lotNumber = freezed,}) {
  return _then(_Vaccination(
vaccineName: null == vaccineName ? _self.vaccineName : vaccineName // ignore: cast_nullable_to_non_nullable
as String,dateAdministered: null == dateAdministered ? _self.dateAdministered : dateAdministered // ignore: cast_nullable_to_non_nullable
as DateTime,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,administeringFacility: freezed == administeringFacility ? _self.administeringFacility : administeringFacility // ignore: cast_nullable_to_non_nullable
as String?,lotNumber: freezed == lotNumber ? _self.lotNumber : lotNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
