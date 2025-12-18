import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Main application title displayed in app bar and splash screen
  ///
  /// In en, this message translates to:
  /// **'HealthCare Pro'**
  String get appTitle;

  /// Title displayed on the login screen
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginTitle;

  /// Label for phone number input field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Label for password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Label for password confirmation input field during registration
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation'**
  String get passwordConfirmation;

  /// Text for login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Link text for password recovery
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Title for biometric authentication section
  ///
  /// In en, this message translates to:
  /// **'Biometric Authentication'**
  String get biometricAuth;

  /// Label for fingerprint authentication toggle
  ///
  /// In en, this message translates to:
  /// **'Use Fingerprint'**
  String get useFingerprint;

  /// Success message shown after successful login
  ///
  /// In en, this message translates to:
  /// **'Login successful!'**
  String get loginSuccess;

  /// Error message shown when login fails
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginFailed;

  /// Error message for incorrect login credentials
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number or password'**
  String get invalidCredentials;

  /// Welcome message on dashboard with user's name
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcome(String name);

  /// Title for medical history section and page
  ///
  /// In en, this message translates to:
  /// **'Medical History'**
  String get medicalHistory;

  /// Title for today's medication schedule section
  ///
  /// In en, this message translates to:
  /// **'Today\'s Medicine'**
  String get todaysMedicine;

  /// Title for upcoming appointments section
  ///
  /// In en, this message translates to:
  /// **'Upcoming Doctor Visits'**
  String get upcomingVisits;

  /// Button text to view all items in a list
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// Button text to mark medicine as taken
  ///
  /// In en, this message translates to:
  /// **'Take Medicine'**
  String get takeMedicine;

  /// Confirmation message when medicine is taken
  ///
  /// In en, this message translates to:
  /// **'Medicine Taken'**
  String get medicineTaken;

  /// Button text to confirm a doctor visit
  ///
  /// In en, this message translates to:
  /// **'Confirm Visit'**
  String get confirmVisit;

  /// Text showing scheduled time for appointments
  ///
  /// In en, this message translates to:
  /// **'Scheduled for {time}'**
  String scheduledFor(String time);

  /// Text shown during data loading
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Button text to retry a failed operation
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Button text to cancel an action
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Button text to confirm an action
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Button text to save changes
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Button text to edit information
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Button text to delete an item
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Title for settings page/menu
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Button text to logout from the app
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Message shown when no medical history exists
  ///
  /// In en, this message translates to:
  /// **'No medical history available'**
  String get noMedicalHistory;

  /// Message shown when no medication is scheduled
  ///
  /// In en, this message translates to:
  /// **'No medicine scheduled for today'**
  String get noMedicineScheduled;

  /// Message shown when no appointments are scheduled
  ///
  /// In en, this message translates to:
  /// **'No upcoming doctor visits'**
  String get noUpcomingVisits;

  /// Label for name input field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Button text for registration
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Title for account creation page
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get createAccount;

  /// Label for user type dropdown field
  ///
  /// In en, this message translates to:
  /// **'User Type'**
  String get userType;

  /// Hint text for user type dropdown
  ///
  /// In en, this message translates to:
  /// **'Select User Type'**
  String get selectUserType;

  /// User type option for patients
  ///
  /// In en, this message translates to:
  /// **'Patient'**
  String get patient;

  /// User type option for pharmacists
  ///
  /// In en, this message translates to:
  /// **'Pharmacist'**
  String get pharmacist;

  /// User type option for doctors
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// User type option for administrators
  ///
  /// In en, this message translates to:
  /// **'Administrator'**
  String get admin;

  /// Label for ID card number input field
  ///
  /// In en, this message translates to:
  /// **'ID Card Number'**
  String get idCardNumber;

  /// Section title for personal details in medical history
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// Section title for medical details
  ///
  /// In en, this message translates to:
  /// **'Medical Information'**
  String get medicalInformation;

  /// Section title for extra notes
  ///
  /// In en, this message translates to:
  /// **'Additional Notes'**
  String get additionalNotes;

  /// Section title for contact details
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// Section title for emergency contact information
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get emergencyContact;

  /// Section title for height, weight, BMI, etc.
  ///
  /// In en, this message translates to:
  /// **'Vital Statistics'**
  String get vitalStatistics;

  /// Section title for lifestyle information
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get lifestyle;

  /// Section title for family medical background
  ///
  /// In en, this message translates to:
  /// **'Family Medical History'**
  String get familyMedicalHistory;

  /// Section title for past surgeries
  ///
  /// In en, this message translates to:
  /// **'Surgical History'**
  String get surgicalHistory;

  /// Section title for immunization records
  ///
  /// In en, this message translates to:
  /// **'Vaccination History'**
  String get vaccinationHistory;

  /// Section title for mental health information
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get mentalHealth;

  /// Section title for women's specific health information
  ///
  /// In en, this message translates to:
  /// **'Women\'s Health'**
  String get womensHealth;

  /// Label for patient's full name field
  ///
  /// In en, this message translates to:
  /// **'Patient Name'**
  String get patientName;

  /// Label for birth date field
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// Label for gender selection field
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// Gender option for male
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// Gender option for female
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// Gender option for other/unspecified
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// Gender option for preferring not to disclose
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get preferNotToSay;

  /// Label for calculated age field
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// Label for email address field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Label for residential address field
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Label for emergency contact person's name
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact Name'**
  String get emergencyContactName;

  /// Label for emergency contact phone number
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact Phone'**
  String get emergencyContactPhone;

  /// Label for relationship to emergency contact
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get emergencyContactRelationship;

  /// Label for height measurement field
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// Unit of measurement for height (centimeters)
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get heightUnit;

  /// Label for weight measurement field
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// Unit of measurement for weight (kilograms)
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get weightUnit;

  /// Label for blood type field
  ///
  /// In en, this message translates to:
  /// **'Blood Type'**
  String get bloodType;

  /// Label for Body Mass Index field
  ///
  /// In en, this message translates to:
  /// **'BMI'**
  String get bmi;

  /// Label for smoking status toggle
  ///
  /// In en, this message translates to:
  /// **'Smoker'**
  String get isSmoker;

  /// Affirmative response option
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// Negative response option
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Label for daily cigarette consumption field
  ///
  /// In en, this message translates to:
  /// **'Cigarettes per day'**
  String get cigarettesPerDay;

  /// Label for alcohol consumption status toggle
  ///
  /// In en, this message translates to:
  /// **'Alcohol Consumer'**
  String get isAlcoholConsumer;

  /// Label for alcohol consumption frequency field
  ///
  /// In en, this message translates to:
  /// **'Alcohol Frequency'**
  String get alcoholFrequency;

  /// Label for recreational drug use toggle
  ///
  /// In en, this message translates to:
  /// **'Uses Recreational Drugs'**
  String get usesRecreationalDrugs;

  /// Label for recreational drugs details field
  ///
  /// In en, this message translates to:
  /// **'Recreational Drugs Details'**
  String get recreationalDrugsDetails;

  /// Label for exercise frequency field
  ///
  /// In en, this message translates to:
  /// **'Exercise Frequency'**
  String get exerciseFrequency;

  /// Label for dietary preferences field
  ///
  /// In en, this message translates to:
  /// **'Dietary Preferences'**
  String get dietaryPreferences;

  /// Label for chronic medical conditions field
  ///
  /// In en, this message translates to:
  /// **'Chronic Conditions'**
  String get chronicConditions;

  /// Hint text for chronic conditions input
  ///
  /// In en, this message translates to:
  /// **'Enter chronic conditions (comma separated)'**
  String get chronicConditionsHint;

  /// Label for allergies field
  ///
  /// In en, this message translates to:
  /// **'Allergies'**
  String get allergies;

  /// Hint text for allergies input
  ///
  /// In en, this message translates to:
  /// **'Enter allergies (comma separated)'**
  String get allergiesHint;

  /// Label for current medications field
  ///
  /// In en, this message translates to:
  /// **'Current Medications'**
  String get currentMedications;

  /// Hint text for current medications input
  ///
  /// In en, this message translates to:
  /// **'Enter current medications (comma separated)'**
  String get currentMedicationsHint;

  /// Label for past medications field
  ///
  /// In en, this message translates to:
  /// **'Past Medications'**
  String get pastMedications;

  /// Hint text for past medications input
  ///
  /// In en, this message translates to:
  /// **'Enter past medications (comma separated)'**
  String get pastMedicationsHint;

  /// Label for surgical procedure name field
  ///
  /// In en, this message translates to:
  /// **'Procedure Name'**
  String get procedureName;

  /// Label for surgery date field
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get surgeryDate;

  /// Label for hospital name field
  ///
  /// In en, this message translates to:
  /// **'Hospital Name'**
  String get hospitalName;

  /// Label for surgeon's name field
  ///
  /// In en, this message translates to:
  /// **'Surgeon Name'**
  String get surgeonName;

  /// Label for surgery complications field
  ///
  /// In en, this message translates to:
  /// **'Complications'**
  String get complications;

  /// Label for hospital admission date field
  ///
  /// In en, this message translates to:
  /// **'Admission Date'**
  String get admissionDate;

  /// Label for hospital discharge date field
  ///
  /// In en, this message translates to:
  /// **'Discharge Date'**
  String get dischargeDate;

  /// Label for hospitalization reason field
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get hospitalizationReason;

  /// Label for treatment details field
  ///
  /// In en, this message translates to:
  /// **'Treatment Details'**
  String get treatmentDetails;

  /// Label for vaccine name field
  ///
  /// In en, this message translates to:
  /// **'Vaccine Name'**
  String get vaccineName;

  /// Label for vaccine administration date field
  ///
  /// In en, this message translates to:
  /// **'Date Administered'**
  String get dateAdministered;

  /// Label for vaccine expiration date field
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get expirationDate;

  /// Label for vaccine administering facility field
  ///
  /// In en, this message translates to:
  /// **'Administering Facility'**
  String get administeringFacility;

  /// Label for vaccine lot number field
  ///
  /// In en, this message translates to:
  /// **'Lot Number'**
  String get lotNumber;

  /// Label for last menstrual period date field
  ///
  /// In en, this message translates to:
  /// **'Last Menstrual Period'**
  String get lastMenstrualPeriod;

  /// Label for pregnancy status toggle
  ///
  /// In en, this message translates to:
  /// **'Pregnant'**
  String get isPregnant;

  /// Label for number of pregnancies field
  ///
  /// In en, this message translates to:
  /// **'Pregnancies'**
  String get pregnancies;

  /// Label for number of live births field
  ///
  /// In en, this message translates to:
  /// **'Live Births'**
  String get liveBirths;

  /// Label for mental health conditions field
  ///
  /// In en, this message translates to:
  /// **'Mental Health Conditions'**
  String get mentalHealthConditions;

  /// Label for current therapist name field
  ///
  /// In en, this message translates to:
  /// **'Current Therapist'**
  String get currentTherapist;

  /// Label for last update timestamp
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// Label for creation timestamp
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get createdAt;

  /// Button text to save medical history form
  ///
  /// In en, this message translates to:
  /// **'Save Medical History'**
  String get saveMedicalHistory;

  /// Button/text for editing medical history
  ///
  /// In en, this message translates to:
  /// **'Edit Medical History'**
  String get editMedicalHistory;

  /// Button text to create new medical history
  ///
  /// In en, this message translates to:
  /// **'Create Medical History'**
  String get createMedicalHistory;

  /// Success message after saving medical history
  ///
  /// In en, this message translates to:
  /// **'Medical history saved successfully'**
  String get medicalHistorySaved;

  /// Message when no medical history record exists
  ///
  /// In en, this message translates to:
  /// **'No medical history found'**
  String get noMedicalHistoryFound;

  /// Validation error message for required fields
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// Validation error for invalid height input
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid height (1-300 cm)'**
  String get invalidHeight;

  /// Validation error for invalid weight input
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid weight (1-500 kg)'**
  String get invalidWeight;

  /// Validation error for invalid phone number
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhone;

  /// Generic label for surgery
  ///
  /// In en, this message translates to:
  /// **'Surgery'**
  String get surgery;

  /// Generic label for hospital stay
  ///
  /// In en, this message translates to:
  /// **'Hospitalization'**
  String get hospitalization;

  /// Generic label for immunization
  ///
  /// In en, this message translates to:
  /// **'Vaccination'**
  String get vaccination;

  /// Button text to add new surgery record
  ///
  /// In en, this message translates to:
  /// **'Add Surgery'**
  String get addSurgery;

  /// Button text to add new hospitalization record
  ///
  /// In en, this message translates to:
  /// **'Add Hospitalization'**
  String get addHospitalization;

  /// Button text to add new vaccination record
  ///
  /// In en, this message translates to:
  /// **'Add Vaccination'**
  String get addVaccination;

  /// Button text to add new medical condition
  ///
  /// In en, this message translates to:
  /// **'Add Condition'**
  String get addCondition;

  /// Button/text for viewing medical history
  ///
  /// In en, this message translates to:
  /// **'View Medical History'**
  String get viewMedicalHistory;

  /// Alternative label for chronic conditions
  ///
  /// In en, this message translates to:
  /// **'Chronic Diseases'**
  String get chronicDiseases;

  /// Hint text for chronic diseases input
  ///
  /// In en, this message translates to:
  /// **'List chronic conditions (e.g., Diabetes, Hypertension)'**
  String get chronicDiseasesHint;

  /// Alternative label for surgical history
  ///
  /// In en, this message translates to:
  /// **'Previous Surgeries'**
  String get previousSurgeries;

  /// Hint text for surgeries input
  ///
  /// In en, this message translates to:
  /// **'List previous surgical procedures'**
  String get surgeriesHint;

  /// Alternative label for family medical history
  ///
  /// In en, this message translates to:
  /// **'Family History'**
  String get familyHistory;

  /// Hint text for family history input
  ///
  /// In en, this message translates to:
  /// **'Notable family medical history'**
  String get familyHistoryHint;

  /// Alternative label for additional notes
  ///
  /// In en, this message translates to:
  /// **'Additional Notes'**
  String get notes;

  /// Hint text for additional notes input
  ///
  /// In en, this message translates to:
  /// **'Any other relevant medical information'**
  String get additionalNotesHint;

  /// Hint text for medications input
  ///
  /// In en, this message translates to:
  /// **'List current medications and dosages'**
  String get medicationsHint;

  /// Blood type option A
  ///
  /// In en, this message translates to:
  /// **'A'**
  String get bloodTypeA;

  /// Blood type option B
  ///
  /// In en, this message translates to:
  /// **'B'**
  String get bloodTypeB;

  /// Blood type option AB
  ///
  /// In en, this message translates to:
  /// **'AB'**
  String get bloodTypeAB;

  /// Blood type option O
  ///
  /// In en, this message translates to:
  /// **'O'**
  String get bloodTypeO;

  /// Hint text for blood type dropdown
  ///
  /// In en, this message translates to:
  /// **'Select Blood Type'**
  String get selectBloodType;

  /// Section title for additional information in forms
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get additionalInformation;

  /// Title for home page and navigation item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Title for patients section and navigation item
  ///
  /// In en, this message translates to:
  /// **'Patients'**
  String get patients;

  /// Button text to add new patient
  ///
  /// In en, this message translates to:
  /// **'Add Patient'**
  String get addPatient;

  /// Title for patient editing dialog
  ///
  /// In en, this message translates to:
  /// **'Edit Patient'**
  String get editPatient;

  /// Title for patient details view
  ///
  /// In en, this message translates to:
  /// **'Patient Details'**
  String get patientDetails;

  /// Hint text for patient search field
  ///
  /// In en, this message translates to:
  /// **'Search patients...'**
  String get searchPatients;

  /// Message displayed when no patients match search
  ///
  /// In en, this message translates to:
  /// **'No patients found'**
  String get noPatientsFound;

  /// Label for total patient count statistic
  ///
  /// In en, this message translates to:
  /// **'Total Patients'**
  String get totalPatients;

  /// Label for active patient count statistic
  ///
  /// In en, this message translates to:
  /// **'Active Patients'**
  String get activePatients;

  /// Label for inactive patient count statistic
  ///
  /// In en, this message translates to:
  /// **'Inactive Patients'**
  String get inactivePatients;

  /// Title for today's patient visits section
  ///
  /// In en, this message translates to:
  /// **'Today\'s Visits'**
  String get todayVisits;

  /// Label for national identification number field
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalId;

  /// Label for status field in patient lists
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Status value for active patients
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Status value for inactive patients
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// Column header for action buttons in tables
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// Button text to view details
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// Title for delete confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// Message in delete confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this patient?'**
  String get deletePatientMessage;

  /// Success message after deleting a patient
  ///
  /// In en, this message translates to:
  /// **'Patient deleted successfully'**
  String get patientDeleted;

  /// Success message after adding a patient
  ///
  /// In en, this message translates to:
  /// **'Patient added successfully'**
  String get patientAdded;

  /// Success message after updating a patient
  ///
  /// In en, this message translates to:
  /// **'Patient updated successfully'**
  String get patientUpdated;

  /// Button text for adding items
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Button text for updating items
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Button text for confirmation
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Hint text for gender dropdown
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get selectGender;

  /// Hint text for notes input field
  ///
  /// In en, this message translates to:
  /// **'Enter notes...'**
  String get enterNotes;

  /// Validation error for invalid national ID
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid National ID'**
  String get invalidNationalId;

  /// Validation error for invalid email
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// Title for statistics section
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// Title for recent patients section
  ///
  /// In en, this message translates to:
  /// **'Recent Patients'**
  String get recentPatients;

  /// Button text to view all patients
  ///
  /// In en, this message translates to:
  /// **'View All Patients'**
  String get viewAllPatients;

  /// Title for quick actions section
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// Button text for quick add patient action
  ///
  /// In en, this message translates to:
  /// **'Add New Patient'**
  String get addNewPatient;

  /// Button text to schedule appointment
  ///
  /// In en, this message translates to:
  /// **'Schedule Appointment'**
  String get scheduleAppointment;

  /// Button text to prescribe medication
  ///
  /// In en, this message translates to:
  /// **'Prescribe Medication'**
  String get prescribeMedication;

  /// Navigation item for dashboard
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// Navigation item for appointments
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appointments;

  /// Navigation item for medications
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get medications;

  /// Navigation item for reports
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// Navigation item for user profile
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Title for today's schedule section
  ///
  /// In en, this message translates to:
  /// **'Today\'s Schedule'**
  String get todaysSchedule;

  /// Title for upcoming appointments section
  ///
  /// In en, this message translates to:
  /// **'Upcoming Appointments'**
  String get upcomingAppointments;

  /// Status for completed appointments
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// Status for pending appointments
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// Status for cancelled appointments
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// Button text to clear search input
  ///
  /// In en, this message translates to:
  /// **'Clear Search'**
  String get clearSearch;

  /// Button text to refresh data
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// Button text to complete an action
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Hint text for date selection
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// Label for patient identification number
  ///
  /// In en, this message translates to:
  /// **'Patient ID'**
  String get patientId;

  /// Label for patient registration date
  ///
  /// In en, this message translates to:
  /// **'Registration Date'**
  String get registrationDate;

  /// Label for patient's last visit date
  ///
  /// In en, this message translates to:
  /// **'Last Visit'**
  String get lastVisit;

  /// Label for medical record section
  ///
  /// In en, this message translates to:
  /// **'Medical Record'**
  String get medicalRecord;

  /// Label for prescriptions section
  ///
  /// In en, this message translates to:
  /// **'Prescriptions'**
  String get prescriptions;

  /// Label for laboratory results section
  ///
  /// In en, this message translates to:
  /// **'Lab Results'**
  String get labResults;

  /// Label for insurance information section
  ///
  /// In en, this message translates to:
  /// **'Insurance Information'**
  String get insuranceInfo;

  /// Label for attachments section
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// Button text to export patient data
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// Button text to print documents
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// Button text to filter data
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// Button text to sort data
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// Sort option by name
  ///
  /// In en, this message translates to:
  /// **'By Name'**
  String get byName;

  /// Sort option by date
  ///
  /// In en, this message translates to:
  /// **'By Date'**
  String get byDate;

  /// Sort option by status
  ///
  /// In en, this message translates to:
  /// **'By Status'**
  String get byStatus;

  /// Sort order ascending
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get ascending;

  /// Sort order descending
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get descending;

  /// Filter option for all statuses
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get allStatus;

  /// Filter option for active patients only
  ///
  /// In en, this message translates to:
  /// **'Active Only'**
  String get activeOnly;

  /// Filter option for inactive patients only
  ///
  /// In en, this message translates to:
  /// **'Inactive Only'**
  String get inactiveOnly;

  /// Date filter option for today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Date filter option for this week
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// Date filter option for this month
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// Date filter option for custom date range
  ///
  /// In en, this message translates to:
  /// **'Custom Range'**
  String get customRange;

  /// Label for start date in date range
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// Label for end date in date range
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// Button text to apply filters
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Button text to reset filters
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
