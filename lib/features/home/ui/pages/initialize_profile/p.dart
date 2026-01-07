import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/services/storage.dart';
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

@riverpod
class PProfile extends _$PProfile {
  // PatientProfileNotifier() : super(const PatientProfileState());
  @override
  PatientProfileState build() {
    return PatientProfileState();
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
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      await di<AppStorage>().setBool('isInitialized', true);
      ref.invalidate(isInitializedProvider);

      // Here you would make the actual API call
      // final response = await ApiService().initializePatientProfile(state.profile);

      state = state.copyWith(isLoading: false, isSubmitted: true);
    } catch (e) {
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
@riverpod
int currentStep(Ref ref) {
  return ref.watch(pProfileProvider).currentStep;
}

// final currentStepProvider = Provider<int>((ref) {
//   return ref.watch(patientProfileProvider).currentStep;
// });
@riverpod
bool isLoading(Ref ref) {
  return ref.watch(pProfileProvider).isLoading;
}

// final isLoadingProvider = Provider<bool>((ref) {
//   return ref.watch(patientProfileProvider).isLoading;
// });
@riverpod
PatientProfile profile(Ref ref) {
  return ref.watch(pProfileProvider).profile;
}

final isInitializedProvider = Provider<bool>((ref) {
  return di<AppStorage>().getBool('isInitialized');
});
