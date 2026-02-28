// ignore_for_file: constant_identifier_names

const bool DEV_ENV = true;

const version = 1087;
const String AUTH_KEY = 'AUTH_KEY$version';
const String AUTH_TYPE_KEY = 'AUTH_TYPE_KEY$version';

const String DOCTOR_KEY = 'doctor';
const String ADMIN_KEY = 'admin';
const String PHARMACIST_KEY = 'pharmacist';
const String PATIENT_KEY = 'patient';

const String INITIAL_KEY = 'initial';
// Define constants first

enum UserType {
  initial(INITIAL_KEY),
  patient(PATIENT_KEY),
  doctor(DOCTOR_KEY),
  pharmacist(PHARMACIST_KEY),
  admin(ADMIN_KEY);

  final String value;
  const UserType(this.value);

  String valueForApi() {
    return switch (this) {
      UserType.initial => 'patient',
      UserType.patient => 'patient',
      UserType.doctor => 'doctor',
      UserType.pharmacist => 'pharmacist',
      UserType.admin => 'admin',
    };
  }

  static UserType fromString(String s) {
    for (final type in UserType.values) {
      if (type.value == s) {
        return type;
      }
    }
    // Throw an error for invalid values (recommended)
    return UserType.patient;
    // throw ArgumentError('Invalid UserType value: $s');

    // OR return a default value (less strict)
    // return UserType.patient;
  }

  // Optional: Add a method to check if a string is valid
  static bool isValid(String s) {
    for (final type in UserType.values) {
      if (type.value == s) {
        return true;
      }
    }
    return false;
  }
}

const api = '192.168.1.104';

class K {
  // TODO Change this Url
  static const String baseUrl = "http://$api:5137/api";

  //
  static const String loginUrl = "/auth/login";
  static const String pingUrl = "/App_Check/ping";
  static const String registerUrl = "/auth/register";
  //
  static const String refreshTokenUrl = "/auth/refresh";

  static const String doctorHomeUrl =
      "/doctorDashboard/patients?filter=recent_activity";
  static const String doctorActivatePatientProfileUrl =
      "/Doctor/activate/patient/profile";
}
// pm-ea3e5492

class AppHeaders {
  static const String applicationJson = "application/json";
  static const String contentType = "content-type";
  static const String accept = "accept";
  static const String authorization = "authorization";
  static const String defaultLanguage = "language";
}

extension AppDevEnv<T> on T {
  T? get dev => DEV_ENV ? this : null;
}
