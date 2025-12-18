// ignore_for_file: constant_identifier_names

const bool DEV_ENV = true;

const version = 0;
const String AUTH_KEY = 'AUTH_KEY$version';
const String AUTH_TYPE_KEY = 'AUTH_TYPE_KEY$version';

const String DOCTOR_KEY = 'DOCTOR_KEY';
const String ADMIN_KEY = 'ADMIN_KEY';
const String PHARMACIST_KEY = 'PHARMACIST_KEY';
const String PATIENT_KEY = 'PATIENT_KEY';

extension AppDevEnv<T> on T {
  T? get dev => DEV_ENV ? this : null;
}
