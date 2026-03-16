import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/di.dart' show appRepo, di;
import 'package:health_app/features/auth/data/responses/user/user_response.dart';
import 'package:health_app/features/auth/domain/models/account.dart'
    hide Account;
import 'package:health_app/features/auth/domain/models/auth_state.dart';
import 'package:health_app/features/auth/domain/models/patient.dart';
import 'package:health_app/shared/ex.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/models.dart';
// import '../models/patient_profile.dart';

// part 'patient_profile_provider.freezed.dart';
part 'p.freezed.dart';
part 'p.g.dart';

@freezed
abstract class PatientProfileState with _$PatientProfileState {
  const factory PatientProfileState({
    @Default(PatientProfile()) PatientProfile profile,
    @Default(0) int currentStep,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isSubmitted,
  }) = _PatientProfileState;
}

@Riverpod(dependencies: [Account])
class PProfile extends _$PProfile {
  // PatientProfileNotifier() : super(const PatientProfileState());
  @override
  PatientProfileState build() {
    final a = ref.watch(allAcountsProvider);
    final patient = a.patient?.patient;
    if (patient != null) {
      return PatientProfileState(
        profile: PatientProfile(
          address: patient.address,
          bloodType: patient.bloodType,
          dateOfBirth: patient.dateOfBirth,
          email: patient.email,
          height: patient.height.toDouble(),
          weight: patient.weight.toDouble(),
          emergencyContact: patient.emergencyContact,
          emergencyPhone: patient.emergencyPhone,
          fullName: patient.fullName,
          gender: patient.gender,
          phoneNumber: patient.phoneNumber,

        ),
      );
    }
    return PatientProfileState();
  }

  void setPatientProfile(Patient p) {
    state = state.copyWith(
      profile: state.profile.copyWith(
        address: p.address,
        bloodType: p.bloodType,
        dateOfBirth: p.dateOfBirth,
        email: p.email,
        height: p.height.toDouble(),
        weight: p.weight.toDouble(),
        emergencyContact: p.emergencyContact,
        emergencyPhone: p.emergencyPhone,
        fullName: p.fullName,
        gender: p.gender,
      ),
    );
  }

  // Update basic profile info
  void updateFullName(String value) {
    state = state.copyWith(profile: state.profile.copyWith(fullName: value));
  }

  void updateDateOfBirth(String value) {
    state = state.copyWith(profile: state.profile.copyWith(dateOfBirth: value));
  }

  void updateGender(int value) {
    state = state.copyWith(profile: state.profile.copyWith(gender: value));
  }

  void updatePhoneNumber(String value) {
    state = state.copyWith(profile: state.profile.copyWith(phoneNumber: value));
  }

  void updateEmail(String value) {
    state = state.copyWith(profile: state.profile.copyWith(email: value));
  }

  void updateAddress(String value) {
    state = state.copyWith(profile: state.profile.copyWith(address: value));
  }

  void updateBloodType(int value) {
    state = state.copyWith(profile: state.profile.copyWith(bloodType: value));
  }

  void updateWeight(double value) {
    state = state.copyWith(profile: state.profile.copyWith(weight: value));
  }

  void updateHeight(double value) {
    state = state.copyWith(profile: state.profile.copyWith(height: value));
  }

  void updateEmergencyContact(String value) {
    state = state.copyWith(
      profile: state.profile.copyWith(emergencyContact: value),
    );
  }

  void updateEmergencyPhone(String value) {
    state = state.copyWith(
      profile: state.profile.copyWith(emergencyPhone: value),
    );
  }

  void updateNotes(String value) {
    state = state.copyWith(profile: state.profile.copyWith(notes: value));
  }

  // Manage lists
  void addAllergy(Allergy allergy) {
    final newAllergies = [...state.profile.allergies, allergy];
    state = state.copyWith(
      profile: state.profile.copyWith(allergies: newAllergies),
    );
  }

  void updateAllergy(int index, Allergy allergy) {
    final newAllergies = List<Allergy>.from(state.profile.allergies);
    newAllergies[index] = allergy;
    state = state.copyWith(
      profile: state.profile.copyWith(allergies: newAllergies),
    );
  }

  void removeAllergy(int index) {
    final newAllergies = List<Allergy>.from(state.profile.allergies);
    newAllergies.removeAt(index);
    state = state.copyWith(
      profile: state.profile.copyWith(allergies: newAllergies),
    );
  }

  void addChronicDisease(ChronicDisease disease) {
    final newDiseases = [...state.profile.chronicDiseases, disease];
    state = state.copyWith(
      profile: state.profile.copyWith(chronicDiseases: newDiseases),
    );
  }

  void updateChronicDisease(int index, ChronicDisease disease) {
    final newDiseases = List<ChronicDisease>.from(
      state.profile.chronicDiseases,
    );
    newDiseases[index] = disease;
    state = state.copyWith(
      profile: state.profile.copyWith(chronicDiseases: newDiseases),
    );
  }

  void removeChronicDisease(int index) {
    final newDiseases = List<ChronicDisease>.from(
      state.profile.chronicDiseases,
    );
    newDiseases.removeAt(index);
    state = state.copyWith(
      profile: state.profile.copyWith(chronicDiseases: newDiseases),
    );
  }

  void addSurgery(Surgery surgery) {
    final newSurgeries = [...state.profile.surgeries, surgery];
    state = state.copyWith(
      profile: state.profile.copyWith(surgeries: newSurgeries),
    );
  }

  void updateSurgery(int index, Surgery surgery) {
    final newSurgeries = List<Surgery>.from(state.profile.surgeries);
    newSurgeries[index] = surgery;
    state = state.copyWith(
      profile: state.profile.copyWith(surgeries: newSurgeries),
    );
  }

  void removeSurgery(int index) {
    final newSurgeries = List<Surgery>.from(state.profile.surgeries);
    newSurgeries.removeAt(index);
    state = state.copyWith(
      profile: state.profile.copyWith(surgeries: newSurgeries),
    );
  }

  void addMedication(CurrentMedication medication) {
    final newMedications = [...state.profile.currentMedications, medication];
    state = state.copyWith(
      profile: state.profile.copyWith(currentMedications: newMedications),
    );
  }

  void updateMedication(int index, CurrentMedication medication) {
    final newMedications = List<CurrentMedication>.from(
      state.profile.currentMedications,
    );
    newMedications[index] = medication;
    state = state.copyWith(
      profile: state.profile.copyWith(currentMedications: newMedications),
    );
  }

  void removeMedication(int index) {
    final newMedications = List<CurrentMedication>.from(
      state.profile.currentMedications,
    );
    newMedications.removeAt(index);
    state = state.copyWith(
      profile: state.profile.copyWith(currentMedications: newMedications),
    );
  }

  // Navigation
  void nextStep() {
    if (state.currentStep < 6) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step <= 6) {
      state = state.copyWith(currentStep: step);
    }
  }

  // API actions
  Future<void> submitProfile() async {
    // await di<AppStorage>().setBool(PATIENT_ACCOUNT_IS_INITIALIZED_KEY, true);
    // return;
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Simulate API call
      // await Future.delayed(const Duration(seconds: 2));
      // final json = await appRepo.initializePatientProfile(
      //   state.profile.toJson(),
      // );
      final js = await appRepo.api.initializePatientProfile(
        state.profile.toJson(),
      );
      // xlog(js);
      // ║    {
      // ║         "success": true,
      // ║         "message": "تم تهيئة الملف الطبي بنجاح",
      // ║         "patientId": 3131
      // ║    }
      // ║
      final id = ref
          .read(authRecordStateProvider)
          .whenOrNull(auth: (r) => r)
          ?.userId;
      if (id != null) {
        await di<AppStorage>().setBool(isInitializedKey(id), true);
        ref.invalidate(isInitializedProvider);
      }

      // Here you would make the actual API call
      // final response = await ApiService().initializePatientProfile(state.profile);

      state = state.copyWith(isLoading: false, isSubmitted: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateProfile() async {
    // await di<AppStorage>().setBool(PATIENT_ACCOUNT_IS_INITIALIZED_KEY, true);
    // return;
    state = state.copyWith(isLoading: true, error: null);

    try {
      final js = await appRepo.api.editPatientProfile({
        'fullName': state.profile.fullName,
        'dateOfBirth': state.profile.dateOfBirth,
        'gender': state.profile.gender,
        'phoneNumber': state.profile.phoneNumber,
        'email': state.profile.email,
        'address': state.profile.address,
        'bloodType': state.profile.bloodType,
        'weight': state.profile.weight,
        'height': state.profile.height,
        'emergencyContact': state.profile.emergencyContact,
        'emergencyPhone': state.profile.emergencyPhone,
      });
      // xlog('updating');
      // xlog(js);
      final response = PatientProfileResponse.fromJson(js);
      // xlog(response.message);
      final patient = response.patient;
      if (patient != null) {
        final patientAccount = PatientAccount(
          patient: Patient.fromJson(patient.toJson()),
        );
        await di<AppStorage>().setPatientAccount(patientAccount);
        ref.invalidate(authRecordStateProvider);
        ref.invalidate(accountProvider);
      }
      // di<AppStorage>().set

      state = state.copyWith(isLoading: false, isSubmitted: true);
    } catch (e) {
      xlog(e.toString());
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() {
    state = const PatientProfileState();
  }
}

// // Provider definitions
// final patientProfileProvider = StateNotifierProvider<PatientProfileNotifier, PatientProfileState>(
//   (ref) => PatientProfileNotifier(),
// );

// // Step-specific providers
@Riverpod(dependencies: [PProfile])
int currentStep(Ref ref) {
  return ref.watch(pProfileProvider).currentStep;
}

// final currentStepProvider = Provider<int>((ref) {
//   return ref.watch(patientProfileProvider).currentStep;
// });
@Riverpod(dependencies: [PProfile])
bool isLoading(Ref ref) {
  return ref.watch(pProfileProvider).isLoading;
}

// final isLoadingProvider = Provider<bool>((ref) {
//   return ref.watch(patientProfileProvider).isLoading;
// });
@Riverpod(dependencies: [PProfile])
PatientProfile profile(Ref ref) {
  return ref.watch(pProfileProvider).profile;
}

// @riverpod
// isInitialized(Ref ref, {required int id}) {
//   return di<AppStorage>().getBool(PATIENT_ACCOUNT_IS_INITIALIZED_KEY);
// }
@riverpod
bool isInitialized(Ref ref) {
  final a = ref
      .watch(authRecordStateProvider)
      .whenOrNull(auth: (record) => record);
  if (a == null) {
    return false;
  }
  // a.userId
  return di<AppStorage>().getBool(isInitializedKey(a.userId));
}

// final isInitializedProvider = Provider<bool>((ref) {
// });
