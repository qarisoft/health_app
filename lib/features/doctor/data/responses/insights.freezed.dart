// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insights.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorDashboardInsight {

 int get patientsToday; int get patientsThisWeek; int get patientsThisMonth;
/// Create a copy of DoctorDashboardInsight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorDashboardInsightCopyWith<DoctorDashboardInsight> get copyWith => _$DoctorDashboardInsightCopyWithImpl<DoctorDashboardInsight>(this as DoctorDashboardInsight, _$identity);

  /// Serializes this DoctorDashboardInsight to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorDashboardInsight&&(identical(other.patientsToday, patientsToday) || other.patientsToday == patientsToday)&&(identical(other.patientsThisWeek, patientsThisWeek) || other.patientsThisWeek == patientsThisWeek)&&(identical(other.patientsThisMonth, patientsThisMonth) || other.patientsThisMonth == patientsThisMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientsToday,patientsThisWeek,patientsThisMonth);

@override
String toString() {
  return 'DoctorDashboardInsight(patientsToday: $patientsToday, patientsThisWeek: $patientsThisWeek, patientsThisMonth: $patientsThisMonth)';
}


}

/// @nodoc
abstract mixin class $DoctorDashboardInsightCopyWith<$Res>  {
  factory $DoctorDashboardInsightCopyWith(DoctorDashboardInsight value, $Res Function(DoctorDashboardInsight) _then) = _$DoctorDashboardInsightCopyWithImpl;
@useResult
$Res call({
 int patientsToday, int patientsThisWeek, int patientsThisMonth
});




}
/// @nodoc
class _$DoctorDashboardInsightCopyWithImpl<$Res>
    implements $DoctorDashboardInsightCopyWith<$Res> {
  _$DoctorDashboardInsightCopyWithImpl(this._self, this._then);

  final DoctorDashboardInsight _self;
  final $Res Function(DoctorDashboardInsight) _then;

/// Create a copy of DoctorDashboardInsight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patientsToday = null,Object? patientsThisWeek = null,Object? patientsThisMonth = null,}) {
  return _then(_self.copyWith(
patientsToday: null == patientsToday ? _self.patientsToday : patientsToday // ignore: cast_nullable_to_non_nullable
as int,patientsThisWeek: null == patientsThisWeek ? _self.patientsThisWeek : patientsThisWeek // ignore: cast_nullable_to_non_nullable
as int,patientsThisMonth: null == patientsThisMonth ? _self.patientsThisMonth : patientsThisMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorDashboardInsight].
extension DoctorDashboardInsightPatterns on DoctorDashboardInsight {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorDashboardInsight value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorDashboardInsight() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorDashboardInsight value)  $default,){
final _that = this;
switch (_that) {
case _DoctorDashboardInsight():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorDashboardInsight value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorDashboardInsight() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int patientsToday,  int patientsThisWeek,  int patientsThisMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorDashboardInsight() when $default != null:
return $default(_that.patientsToday,_that.patientsThisWeek,_that.patientsThisMonth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int patientsToday,  int patientsThisWeek,  int patientsThisMonth)  $default,) {final _that = this;
switch (_that) {
case _DoctorDashboardInsight():
return $default(_that.patientsToday,_that.patientsThisWeek,_that.patientsThisMonth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int patientsToday,  int patientsThisWeek,  int patientsThisMonth)?  $default,) {final _that = this;
switch (_that) {
case _DoctorDashboardInsight() when $default != null:
return $default(_that.patientsToday,_that.patientsThisWeek,_that.patientsThisMonth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorDashboardInsight implements DoctorDashboardInsight {
   _DoctorDashboardInsight({this.patientsToday = 0, this.patientsThisWeek = 0, this.patientsThisMonth = 0});
  factory _DoctorDashboardInsight.fromJson(Map<String, dynamic> json) => _$DoctorDashboardInsightFromJson(json);

@override@JsonKey() final  int patientsToday;
@override@JsonKey() final  int patientsThisWeek;
@override@JsonKey() final  int patientsThisMonth;

/// Create a copy of DoctorDashboardInsight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorDashboardInsightCopyWith<_DoctorDashboardInsight> get copyWith => __$DoctorDashboardInsightCopyWithImpl<_DoctorDashboardInsight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorDashboardInsightToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorDashboardInsight&&(identical(other.patientsToday, patientsToday) || other.patientsToday == patientsToday)&&(identical(other.patientsThisWeek, patientsThisWeek) || other.patientsThisWeek == patientsThisWeek)&&(identical(other.patientsThisMonth, patientsThisMonth) || other.patientsThisMonth == patientsThisMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patientsToday,patientsThisWeek,patientsThisMonth);

@override
String toString() {
  return 'DoctorDashboardInsight(patientsToday: $patientsToday, patientsThisWeek: $patientsThisWeek, patientsThisMonth: $patientsThisMonth)';
}


}

/// @nodoc
abstract mixin class _$DoctorDashboardInsightCopyWith<$Res> implements $DoctorDashboardInsightCopyWith<$Res> {
  factory _$DoctorDashboardInsightCopyWith(_DoctorDashboardInsight value, $Res Function(_DoctorDashboardInsight) _then) = __$DoctorDashboardInsightCopyWithImpl;
@override @useResult
$Res call({
 int patientsToday, int patientsThisWeek, int patientsThisMonth
});




}
/// @nodoc
class __$DoctorDashboardInsightCopyWithImpl<$Res>
    implements _$DoctorDashboardInsightCopyWith<$Res> {
  __$DoctorDashboardInsightCopyWithImpl(this._self, this._then);

  final _DoctorDashboardInsight _self;
  final $Res Function(_DoctorDashboardInsight) _then;

/// Create a copy of DoctorDashboardInsight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patientsToday = null,Object? patientsThisWeek = null,Object? patientsThisMonth = null,}) {
  return _then(_DoctorDashboardInsight(
patientsToday: null == patientsToday ? _self.patientsToday : patientsToday // ignore: cast_nullable_to_non_nullable
as int,patientsThisWeek: null == patientsThisWeek ? _self.patientsThisWeek : patientsThisWeek // ignore: cast_nullable_to_non_nullable
as int,patientsThisMonth: null == patientsThisMonth ? _self.patientsThisMonth : patientsThisMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
