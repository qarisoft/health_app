// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Account {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Account()';
}


}

/// @nodoc
class $AccountCopyWith<$Res>  {
$AccountCopyWith(Account _, $Res Function(Account) __);
}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PatientAccount value)?  patient,TResult Function( DoctorAccount value)?  doctor,TResult Function( PharmacistAccount value)?  pharmacist,TResult Function( AdminAccount value)?  admin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PatientAccount() when patient != null:
return patient(_that);case DoctorAccount() when doctor != null:
return doctor(_that);case PharmacistAccount() when pharmacist != null:
return pharmacist(_that);case AdminAccount() when admin != null:
return admin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PatientAccount value)  patient,required TResult Function( DoctorAccount value)  doctor,required TResult Function( PharmacistAccount value)  pharmacist,required TResult Function( AdminAccount value)  admin,}){
final _that = this;
switch (_that) {
case PatientAccount():
return patient(_that);case DoctorAccount():
return doctor(_that);case PharmacistAccount():
return pharmacist(_that);case AdminAccount():
return admin(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PatientAccount value)?  patient,TResult? Function( DoctorAccount value)?  doctor,TResult? Function( PharmacistAccount value)?  pharmacist,TResult? Function( AdminAccount value)?  admin,}){
final _that = this;
switch (_that) {
case PatientAccount() when patient != null:
return patient(_that);case DoctorAccount() when doctor != null:
return doctor(_that);case PharmacistAccount() when pharmacist != null:
return pharmacist(_that);case AdminAccount() when admin != null:
return admin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Patient patient)?  patient,TResult Function( Doctor doctor)?  doctor,TResult Function( Pharmacist pharmacist)?  pharmacist,TResult Function( Admin admin)?  admin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PatientAccount() when patient != null:
return patient(_that.patient);case DoctorAccount() when doctor != null:
return doctor(_that.doctor);case PharmacistAccount() when pharmacist != null:
return pharmacist(_that.pharmacist);case AdminAccount() when admin != null:
return admin(_that.admin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Patient patient)  patient,required TResult Function( Doctor doctor)  doctor,required TResult Function( Pharmacist pharmacist)  pharmacist,required TResult Function( Admin admin)  admin,}) {final _that = this;
switch (_that) {
case PatientAccount():
return patient(_that.patient);case DoctorAccount():
return doctor(_that.doctor);case PharmacistAccount():
return pharmacist(_that.pharmacist);case AdminAccount():
return admin(_that.admin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Patient patient)?  patient,TResult? Function( Doctor doctor)?  doctor,TResult? Function( Pharmacist pharmacist)?  pharmacist,TResult? Function( Admin admin)?  admin,}) {final _that = this;
switch (_that) {
case PatientAccount() when patient != null:
return patient(_that.patient);case DoctorAccount() when doctor != null:
return doctor(_that.doctor);case PharmacistAccount() when pharmacist != null:
return pharmacist(_that.pharmacist);case AdminAccount() when admin != null:
return admin(_that.admin);case _:
  return null;

}
}

}

/// @nodoc


class PatientAccount implements Account {
   PatientAccount({required this.patient});
  

 final  Patient patient;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientAccountCopyWith<PatientAccount> get copyWith => _$PatientAccountCopyWithImpl<PatientAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientAccount&&(identical(other.patient, patient) || other.patient == patient));
}


@override
int get hashCode => Object.hash(runtimeType,patient);

@override
String toString() {
  return 'Account.patient(patient: $patient)';
}


}

/// @nodoc
abstract mixin class $PatientAccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory $PatientAccountCopyWith(PatientAccount value, $Res Function(PatientAccount) _then) = _$PatientAccountCopyWithImpl;
@useResult
$Res call({
 Patient patient
});


$PatientCopyWith<$Res> get patient;

}
/// @nodoc
class _$PatientAccountCopyWithImpl<$Res>
    implements $PatientAccountCopyWith<$Res> {
  _$PatientAccountCopyWithImpl(this._self, this._then);

  final PatientAccount _self;
  final $Res Function(PatientAccount) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? patient = null,}) {
  return _then(PatientAccount(
patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as Patient,
  ));
}

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientCopyWith<$Res> get patient {
  
  return $PatientCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}

/// @nodoc


class DoctorAccount implements Account {
   DoctorAccount({required this.doctor});
  

 final  Doctor doctor;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorAccountCopyWith<DoctorAccount> get copyWith => _$DoctorAccountCopyWithImpl<DoctorAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorAccount&&(identical(other.doctor, doctor) || other.doctor == doctor));
}


@override
int get hashCode => Object.hash(runtimeType,doctor);

@override
String toString() {
  return 'Account.doctor(doctor: $doctor)';
}


}

/// @nodoc
abstract mixin class $DoctorAccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory $DoctorAccountCopyWith(DoctorAccount value, $Res Function(DoctorAccount) _then) = _$DoctorAccountCopyWithImpl;
@useResult
$Res call({
 Doctor doctor
});


$DoctorCopyWith<$Res> get doctor;

}
/// @nodoc
class _$DoctorAccountCopyWithImpl<$Res>
    implements $DoctorAccountCopyWith<$Res> {
  _$DoctorAccountCopyWithImpl(this._self, this._then);

  final DoctorAccount _self;
  final $Res Function(DoctorAccount) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? doctor = null,}) {
  return _then(DoctorAccount(
doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as Doctor,
  ));
}

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorCopyWith<$Res> get doctor {
  
  return $DoctorCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}

/// @nodoc


class PharmacistAccount implements Account {
   PharmacistAccount({required this.pharmacist});
  

 final  Pharmacist pharmacist;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistAccountCopyWith<PharmacistAccount> get copyWith => _$PharmacistAccountCopyWithImpl<PharmacistAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacistAccount&&(identical(other.pharmacist, pharmacist) || other.pharmacist == pharmacist));
}


@override
int get hashCode => Object.hash(runtimeType,pharmacist);

@override
String toString() {
  return 'Account.pharmacist(pharmacist: $pharmacist)';
}


}

/// @nodoc
abstract mixin class $PharmacistAccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory $PharmacistAccountCopyWith(PharmacistAccount value, $Res Function(PharmacistAccount) _then) = _$PharmacistAccountCopyWithImpl;
@useResult
$Res call({
 Pharmacist pharmacist
});


$PharmacistCopyWith<$Res> get pharmacist;

}
/// @nodoc
class _$PharmacistAccountCopyWithImpl<$Res>
    implements $PharmacistAccountCopyWith<$Res> {
  _$PharmacistAccountCopyWithImpl(this._self, this._then);

  final PharmacistAccount _self;
  final $Res Function(PharmacistAccount) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pharmacist = null,}) {
  return _then(PharmacistAccount(
pharmacist: null == pharmacist ? _self.pharmacist : pharmacist // ignore: cast_nullable_to_non_nullable
as Pharmacist,
  ));
}

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PharmacistCopyWith<$Res> get pharmacist {
  
  return $PharmacistCopyWith<$Res>(_self.pharmacist, (value) {
    return _then(_self.copyWith(pharmacist: value));
  });
}
}

/// @nodoc


class AdminAccount implements Account {
   AdminAccount({required this.admin});
  

 final  Admin admin;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminAccountCopyWith<AdminAccount> get copyWith => _$AdminAccountCopyWithImpl<AdminAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminAccount&&(identical(other.admin, admin) || other.admin == admin));
}


@override
int get hashCode => Object.hash(runtimeType,admin);

@override
String toString() {
  return 'Account.admin(admin: $admin)';
}


}

/// @nodoc
abstract mixin class $AdminAccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory $AdminAccountCopyWith(AdminAccount value, $Res Function(AdminAccount) _then) = _$AdminAccountCopyWithImpl;
@useResult
$Res call({
 Admin admin
});


$AdminCopyWith<$Res> get admin;

}
/// @nodoc
class _$AdminAccountCopyWithImpl<$Res>
    implements $AdminAccountCopyWith<$Res> {
  _$AdminAccountCopyWithImpl(this._self, this._then);

  final AdminAccount _self;
  final $Res Function(AdminAccount) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? admin = null,}) {
  return _then(AdminAccount(
admin: null == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as Admin,
  ));
}

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminCopyWith<$Res> get admin {
  
  return $AdminCopyWith<$Res>(_self.admin, (value) {
    return _then(_self.copyWith(admin: value));
  });
}
}

/// @nodoc
mixin _$AccountState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountState()';
}


}

/// @nodoc
class $AccountStateCopyWith<$Res>  {
$AccountStateCopyWith(AccountState _, $Res Function(AccountState) __);
}


/// Adds pattern-matching-related methods to [AccountState].
extension AccountStatePatterns on AccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialAccountState value)?  initial,TResult Function( TAccountState value)?  acount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialAccountState() when initial != null:
return initial(_that);case TAccountState() when acount != null:
return acount(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialAccountState value)  initial,required TResult Function( TAccountState value)  acount,}){
final _that = this;
switch (_that) {
case InitialAccountState():
return initial(_that);case TAccountState():
return acount(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialAccountState value)?  initial,TResult? Function( TAccountState value)?  acount,}){
final _that = this;
switch (_that) {
case InitialAccountState() when initial != null:
return initial(_that);case TAccountState() when acount != null:
return acount(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Account account)?  acount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialAccountState() when initial != null:
return initial();case TAccountState() when acount != null:
return acount(_that.account);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Account account)  acount,}) {final _that = this;
switch (_that) {
case InitialAccountState():
return initial();case TAccountState():
return acount(_that.account);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Account account)?  acount,}) {final _that = this;
switch (_that) {
case InitialAccountState() when initial != null:
return initial();case TAccountState() when acount != null:
return acount(_that.account);case _:
  return null;

}
}

}

/// @nodoc


class InitialAccountState implements AccountState {
   InitialAccountState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountState.initial()';
}


}




/// @nodoc


class TAccountState implements AccountState {
   TAccountState({required this.account});
  

 final  Account account;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TAccountStateCopyWith<TAccountState> get copyWith => _$TAccountStateCopyWithImpl<TAccountState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TAccountState&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString() {
  return 'AccountState.acount(account: $account)';
}


}

/// @nodoc
abstract mixin class $TAccountStateCopyWith<$Res> implements $AccountStateCopyWith<$Res> {
  factory $TAccountStateCopyWith(TAccountState value, $Res Function(TAccountState) _then) = _$TAccountStateCopyWithImpl;
@useResult
$Res call({
 Account account
});


$AccountCopyWith<$Res> get account;

}
/// @nodoc
class _$TAccountStateCopyWithImpl<$Res>
    implements $TAccountStateCopyWith<$Res> {
  _$TAccountStateCopyWithImpl(this._self, this._then);

  final TAccountState _self;
  final $Res Function(TAccountState) _then;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? account = null,}) {
  return _then(TAccountState(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,
  ));
}

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get account {
  
  return $AccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

// dart format on
