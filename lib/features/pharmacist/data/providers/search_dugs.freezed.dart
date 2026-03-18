// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_dugs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchDrugsState {

 List<MedicationSearchResult> get drugs; bool get isLoading; String? get error;
/// Create a copy of SearchDrugsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchDrugsStateCopyWith<SearchDrugsState> get copyWith => _$SearchDrugsStateCopyWithImpl<SearchDrugsState>(this as SearchDrugsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchDrugsState&&const DeepCollectionEquality().equals(other.drugs, drugs)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(drugs),isLoading,error);

@override
String toString() {
  return 'SearchDrugsState(drugs: $drugs, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $SearchDrugsStateCopyWith<$Res>  {
  factory $SearchDrugsStateCopyWith(SearchDrugsState value, $Res Function(SearchDrugsState) _then) = _$SearchDrugsStateCopyWithImpl;
@useResult
$Res call({
 List<MedicationSearchResult> drugs, bool isLoading, String? error
});




}
/// @nodoc
class _$SearchDrugsStateCopyWithImpl<$Res>
    implements $SearchDrugsStateCopyWith<$Res> {
  _$SearchDrugsStateCopyWithImpl(this._self, this._then);

  final SearchDrugsState _self;
  final $Res Function(SearchDrugsState) _then;

/// Create a copy of SearchDrugsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drugs = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
drugs: null == drugs ? _self.drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<MedicationSearchResult>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchDrugsState].
extension SearchDrugsStatePatterns on SearchDrugsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchDrugsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchDrugsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchDrugsState value)  $default,){
final _that = this;
switch (_that) {
case _SearchDrugsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchDrugsState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchDrugsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MedicationSearchResult> drugs,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchDrugsState() when $default != null:
return $default(_that.drugs,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MedicationSearchResult> drugs,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SearchDrugsState():
return $default(_that.drugs,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MedicationSearchResult> drugs,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SearchDrugsState() when $default != null:
return $default(_that.drugs,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SearchDrugsState implements SearchDrugsState {
  const _SearchDrugsState({final  List<MedicationSearchResult> drugs = const [], this.isLoading = false, this.error}): _drugs = drugs;
  

 final  List<MedicationSearchResult> _drugs;
@override@JsonKey() List<MedicationSearchResult> get drugs {
  if (_drugs is EqualUnmodifiableListView) return _drugs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drugs);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of SearchDrugsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchDrugsStateCopyWith<_SearchDrugsState> get copyWith => __$SearchDrugsStateCopyWithImpl<_SearchDrugsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchDrugsState&&const DeepCollectionEquality().equals(other._drugs, _drugs)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_drugs),isLoading,error);

@override
String toString() {
  return 'SearchDrugsState(drugs: $drugs, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SearchDrugsStateCopyWith<$Res> implements $SearchDrugsStateCopyWith<$Res> {
  factory _$SearchDrugsStateCopyWith(_SearchDrugsState value, $Res Function(_SearchDrugsState) _then) = __$SearchDrugsStateCopyWithImpl;
@override @useResult
$Res call({
 List<MedicationSearchResult> drugs, bool isLoading, String? error
});




}
/// @nodoc
class __$SearchDrugsStateCopyWithImpl<$Res>
    implements _$SearchDrugsStateCopyWith<$Res> {
  __$SearchDrugsStateCopyWithImpl(this._self, this._then);

  final _SearchDrugsState _self;
  final $Res Function(_SearchDrugsState) _then;

/// Create a copy of SearchDrugsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drugs = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_SearchDrugsState(
drugs: null == drugs ? _self._drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<MedicationSearchResult>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
