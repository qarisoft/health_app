// ignore_for_file: constant_identifier_names

const bool DEV_ENV = true;

const version = 0;
const String AUTH_KEY = 'AUTH_KEY$version';
const String AUTH_TYPE_KEY = 'AUTH_TYPE_KEY$version';

const String DOCTOR_KEY = 'DOCTOR_KEY';
const String ADMIN_KEY = 'ADMIN_KEY';
const String PHARMACIST_KEY = 'PHARMACIST_KEY';
const String PATIENT_KEY = 'PATIENT_KEY';
const String INITIAL_KEY = 'INITIAL_KEY';
// Define constants first

enum UserType {
  initial(INITIAL_KEY),
  patient(PATIENT_KEY),
  doctor(DOCTOR_KEY),
  pharmacist(PHARMACIST_KEY),
  admin(ADMIN_KEY);

  final String value;
  const UserType(this.value);
  
  static UserType fromString(String s) {
    for (final type in UserType.values) {
      if (type.value == s) {
        return type;
      }
    }
    // Throw an error for invalid values (recommended)
    throw ArgumentError('Invalid UserType value: $s');
    
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
extension AppDevEnv<T> on T {
  T? get dev => DEV_ENV ? this : null;
}
