import 'package:freezed_annotation/freezed_annotation.dart';
import './patient.dart';

part 'account.freezed.dart';
// part 'account.g.dart';

@freezed
abstract class Account with _$Account {
  factory Account.patient({required Patient patient}) = PatientAccount;
  factory Account.doctor({required Doctor doctor}) = DoctorAccount;
  factory Account.pharmacist({required Pharmacist pharmacist}) =
      PharmacistAccount;
  factory Account.admin({required Admin admin}) = AdminAccount;
}

extension A on Account {
  Map<String, dynamic> toJson() {
    return when(
      patient: (p) => p.toJson(),
      doctor: (p) => p.toJson(),
      pharmacist: (p) => p.toJson(),
      admin: (p) => p.toJson(),
    );
  }
}

@freezed
class AccountState with _$AccountState {
  factory AccountState.initial() = InitialAccountState;
  factory AccountState.acount({required Account account}) = TAccountState;
}
