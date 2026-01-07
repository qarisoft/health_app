// test/mocks/mock_api_service.dart
import 'dart:ui';

import 'package:health_app/core/user/user.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/domain/models/auth_state.dart';
import 'package:health_app/shared/api/api_service.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/src/shared_preferences_legacy.dart';

class MockApiService extends Mock implements ApiService {}

class MockAppStorage extends Mock implements AppStorage {
  @override
  String getappLoale() => 'ar';

  @override
  Future<void> clearAllAccounts()async {
    
  }

  @override
  Future<void> clearAuthRecord()async {
    
  }

  @override
  Future<void> clearAuthToken()async {
    
  }

  @override
  AdminAccount? getAdminAccount() {
    
  }

  @override
  AuthRecord? getAuthRecord() {
    
  }

  @override
  DoctorAccount? getDoctorAccount() {
    
  }

  @override
  Map<String, dynamic>? getJson(String k) {
    
  }

  @override
  Locale getLocale() {
    return Locale('ar');
  }

  @override
  PatientAccount? getPatientAccount() {
    
  }

  @override
  PharmacistAccount? getPharmacistAccount() {
    
  }

  @override
  String? getString(String k) {
    
  }

  @override
  String? getUserToken() {
    
  }

  @override
  Future<void> setAdminAccount(AdminAccount account)async {
    
  }

  @override
  Future<void> setAppAuthState(AppAuthState auth)async {
    
  }

  @override
  Future<void> setAuthRecord(AuthRecord auth)async {
    
  }

  @override
  Future<void> setDoctorAccount(DoctorAccount account)async {
    
  }

  @override
  Future<void> setPatientAccount(PatientAccount account)async {
    
  }

  @override
  Future<void> setPharmacistAccount(PharmacistAccount account)async {
    
  }

  // @override
  // SharedPreferences get sharedPreferences {
    // return SharedPreferences()
  // } 
}
