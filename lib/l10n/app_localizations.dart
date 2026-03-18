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

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// Column header for action buttons in tables
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// Status value for active patients
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Filter option for active patients only
  ///
  /// In en, this message translates to:
  /// **'Active Only'**
  String get activeOnly;

  /// Label for active patient count statistic
  ///
  /// In en, this message translates to:
  /// **'Active Patients'**
  String get activePatients;

  /// No description provided for @activePrescriptions.
  ///
  /// In en, this message translates to:
  /// **'active Prescriptions'**
  String get activePrescriptions;

  /// Button text for adding items
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Button text to add new medical condition
  ///
  /// In en, this message translates to:
  /// **'Add Condition'**
  String get addCondition;

  /// No description provided for @addHealthData.
  ///
  /// In en, this message translates to:
  /// **'Add Health Data'**
  String get addHealthData;

  /// Button text to add new hospitalization record
  ///
  /// In en, this message translates to:
  /// **'Add Hospitalization'**
  String get addHospitalization;

  /// No description provided for @addNewMedication.
  ///
  /// In en, this message translates to:
  /// **'Add New Medication'**
  String get addNewMedication;

  /// Button text for quick add patient action
  ///
  /// In en, this message translates to:
  /// **'Add New Patient'**
  String get addNewPatient;

  /// Button text to add new patient
  ///
  /// In en, this message translates to:
  /// **'Add Patient'**
  String get addPatient;

  /// No description provided for @addPrescription.
  ///
  /// In en, this message translates to:
  /// **'Add Prescription'**
  String get addPrescription;

  /// Button text to add new surgery record
  ///
  /// In en, this message translates to:
  /// **'Add Surgery'**
  String get addSurgery;

  /// No description provided for @addToList.
  ///
  /// In en, this message translates to:
  /// **'Add to List'**
  String get addToList;

  /// Button text to add new vaccination record
  ///
  /// In en, this message translates to:
  /// **'Add Vaccination'**
  String get addVaccination;

  /// Section title for additional information in forms
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get additionalInformation;

  /// Section title for extra notes
  ///
  /// In en, this message translates to:
  /// **'Additional Notes'**
  String get additionalNotes;

  /// Hint text for additional notes input
  ///
  /// In en, this message translates to:
  /// **'Any other relevant medical information'**
  String get additionalNotesHint;

  /// Label for residential address field
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// User type option for administrators
  ///
  /// In en, this message translates to:
  /// **'Administrator'**
  String get admin;

  /// Label for vaccine administering facility field
  ///
  /// In en, this message translates to:
  /// **'Administering Facility'**
  String get administeringFacility;

  /// Label for hospital admission date field
  ///
  /// In en, this message translates to:
  /// **'Admission Date'**
  String get admissionDate;

  /// Label for calculated age field
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// Label for alcohol consumption frequency field
  ///
  /// In en, this message translates to:
  /// **'Alcohol Frequency'**
  String get alcoholFrequency;

  /// Filter option for all statuses
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get allStatus;

  /// No description provided for @allergenName.
  ///
  /// In en, this message translates to:
  /// **'Allergen Name'**
  String get allergenName;

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

  /// No description provided for @allergySeverity.
  ///
  /// In en, this message translates to:
  /// **'Allergy Severity'**
  String get allergySeverity;

  /// Main application title displayed in app bar and splash screen
  ///
  /// In en, this message translates to:
  /// **'HealthCare Pro'**
  String get appTitle;

  /// Button text to apply filters
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Navigation item for appointments
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appointments;

  /// Sort order ascending
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get ascending;

  /// Label for attachments section
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// Title for biometric authentication section
  ///
  /// In en, this message translates to:
  /// **'Biometric Authentication'**
  String get biometricAuth;

  /// Label for blood type field
  ///
  /// In en, this message translates to:
  /// **'Blood Type'**
  String get bloodType;

  /// Blood type option A
  ///
  /// In en, this message translates to:
  /// **'A'**
  String get bloodTypeA;

  /// Blood type option AB
  ///
  /// In en, this message translates to:
  /// **'AB'**
  String get bloodTypeAB;

  /// Blood type option B
  ///
  /// In en, this message translates to:
  /// **'B'**
  String get bloodTypeB;

  /// Blood type option O
  ///
  /// In en, this message translates to:
  /// **'O'**
  String get bloodTypeO;

  /// Label for Body Mass Index field
  ///
  /// In en, this message translates to:
  /// **'BMI'**
  String get bmi;

  /// Sort option by date
  ///
  /// In en, this message translates to:
  /// **'By Date'**
  String get byDate;

  /// Sort option by name
  ///
  /// In en, this message translates to:
  /// **'By Name'**
  String get byName;

  /// Sort option by status
  ///
  /// In en, this message translates to:
  /// **'By Status'**
  String get byStatus;

  /// Button text to cancel an action
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @canceled.
  ///
  /// In en, this message translates to:
  /// **'canceled'**
  String get canceled;

  /// Status for cancelled appointments
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @changePasswordInstruction.
  ///
  /// In en, this message translates to:
  /// **'Please enter your current password and choose a new secure one.'**
  String get changePasswordInstruction;

  /// No description provided for @changesSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Changes saved successfully'**
  String get changesSavedSuccessfully;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

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

  /// Label for daily cigarette consumption field
  ///
  /// In en, this message translates to:
  /// **'Cigarettes per day'**
  String get cigarettesPerDay;

  /// Button text to clear search input
  ///
  /// In en, this message translates to:
  /// **'Clear Search'**
  String get clearSearch;

  /// No description provided for @collapseAll.
  ///
  /// In en, this message translates to:
  /// **'Collapse All'**
  String get collapseAll;

  /// Status for completed appointments
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// Label for surgery complications field
  ///
  /// In en, this message translates to:
  /// **'Complications'**
  String get complications;

  /// Button text to confirm an action
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Title for delete confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmPassword;

  /// Button text to confirm a doctor visit
  ///
  /// In en, this message translates to:
  /// **'Confirm Visit'**
  String get confirmVisit;

  /// No description provided for @connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting to secure server...'**
  String get connecting;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while connecting. Please check your internet.'**
  String get connectionError;

  /// Section title for contact details
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Title for account creation page
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get createAccount;

  /// Button text to create new medical history
  ///
  /// In en, this message translates to:
  /// **'Create Medical History'**
  String get createMedicalHistory;

  /// No description provided for @createMedicalRecordStep.
  ///
  /// In en, this message translates to:
  /// **'Create Medical Record - Step'**
  String get createMedicalRecordStep;

  /// No description provided for @createNewPrescription.
  ///
  /// In en, this message translates to:
  /// **'Create New Prescription'**
  String get createNewPrescription;

  /// No description provided for @createNewRecord.
  ///
  /// In en, this message translates to:
  /// **'Create New Record'**
  String get createNewRecord;

  /// No description provided for @createPrescription.
  ///
  /// In en, this message translates to:
  /// **'Create Prescription'**
  String get createPrescription;

  /// No description provided for @createProfile.
  ///
  /// In en, this message translates to:
  /// **'Create Profile'**
  String get createProfile;

  /// Label for creation timestamp
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get createdAt;

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

  /// Label for current therapist name field
  ///
  /// In en, this message translates to:
  /// **'Current Therapist'**
  String get currentTherapist;

  /// Date filter option for custom date range
  ///
  /// In en, this message translates to:
  /// **'Custom Range'**
  String get customRange;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Navigation item for dashboard
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @dataTooLargeQr.
  ///
  /// In en, this message translates to:
  /// **'Data too large for QR code'**
  String get dataTooLargeQr;

  /// Label for vaccine administration date field
  ///
  /// In en, this message translates to:
  /// **'Date Administered'**
  String get dateAdministered;

  /// Label for birth date field
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// Button text to delete an item
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Message in delete confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this patient?'**
  String get deletePatientMessage;

  /// Sort order descending
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get descending;

  /// No description provided for @diagnosis.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis'**
  String get diagnosis;

  /// No description provided for @diagnosisLabel.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis:'**
  String get diagnosisLabel;

  /// Label for dietary preferences field
  ///
  /// In en, this message translates to:
  /// **'Dietary Preferences'**
  String get dietaryPreferences;

  /// Label for hospital discharge date field
  ///
  /// In en, this message translates to:
  /// **'Discharge Date'**
  String get dischargeDate;

  /// No description provided for @dispense.
  ///
  /// In en, this message translates to:
  /// **'Dispense'**
  String get dispense;

  /// No description provided for @dispensed.
  ///
  /// In en, this message translates to:
  /// **'dispensed'**
  String get dispensed;

  /// User type option for doctors
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// No description provided for @doctors.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get doctors;

  /// Button text to complete an action
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @dosage.
  ///
  /// In en, this message translates to:
  /// **'Dosage'**
  String get dosage;

  /// No description provided for @dosageHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 500mg'**
  String get dosageHint;

  /// No description provided for @drugName.
  ///
  /// In en, this message translates to:
  /// **'Drug Name'**
  String get drugName;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @durationHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 7 days'**
  String get durationHint;

  /// Button text to edit information
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Button/text for editing medical history
  ///
  /// In en, this message translates to:
  /// **'Edit Medical History'**
  String get editMedicalHistory;

  /// Title for patient editing dialog
  ///
  /// In en, this message translates to:
  /// **'Edit Patient'**
  String get editPatient;

  /// No description provided for @editPrescription.
  ///
  /// In en, this message translates to:
  /// **'Edit Prescription'**
  String get editPrescription;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Label for email address field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Section title for emergency contact information
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get emergencyContact;

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

  /// No description provided for @emergencyInfo.
  ///
  /// In en, this message translates to:
  /// **'Emergency Info'**
  String get emergencyInfo;

  /// No description provided for @emergencyPage.
  ///
  /// In en, this message translates to:
  /// **'emergency'**
  String get emergencyPage;

  /// No description provided for @emptyTapToAdd.
  ///
  /// In en, this message translates to:
  /// **'Empty • Tap to add details'**
  String get emptyTapToAdd;

  /// No description provided for @enterDiagnosisHint.
  ///
  /// In en, this message translates to:
  /// **'Enter patient diagnosis...'**
  String get enterDiagnosisHint;

  /// Hint text for notes input field
  ///
  /// In en, this message translates to:
  /// **'Enter notes...'**
  String get enterNotes;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get enterPassword;

  /// No description provided for @enterSymptomsHint.
  ///
  /// In en, this message translates to:
  /// **'What symptoms is the patient showing?'**
  String get enterSymptomsHint;

  /// No description provided for @enterTreatmentHint.
  ///
  /// In en, this message translates to:
  /// **'Outline the recommended treatment plan...'**
  String get enterTreatmentHint;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get error;

  /// No description provided for @errorCreateRecord.
  ///
  /// In en, this message translates to:
  /// **'Error: {msg}'**
  String errorCreateRecord(String msg);

  /// No description provided for @errorPickingFile.
  ///
  /// In en, this message translates to:
  /// **'Error picking file'**
  String get errorPickingFile;

  /// Label for exercise frequency field
  ///
  /// In en, this message translates to:
  /// **'Exercise Frequency'**
  String get exerciseFrequency;

  /// No description provided for @expandAll.
  ///
  /// In en, this message translates to:
  /// **'Expand All'**
  String get expandAll;

  /// No description provided for @expandCollapseAll.
  ///
  /// In en, this message translates to:
  /// **'Expand/Collapse All'**
  String get expandCollapseAll;

  /// Label for vaccine expiration date field
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get expirationDate;

  /// Button text to export patient data
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// No description provided for @failedToLoadDashboard.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard'**
  String get failedToLoadDashboard;

  /// No description provided for @failedToLoadEmergencyData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load emergency data.'**
  String get failedToLoadEmergencyData;

  /// No description provided for @failedToLoadImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load image'**
  String get failedToLoadImage;

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

  /// Section title for family medical background
  ///
  /// In en, this message translates to:
  /// **'Family Medical History'**
  String get familyMedicalHistory;

  /// Gender option for female
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// Button text to filter data
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @findPatient.
  ///
  /// In en, this message translates to:
  /// **'Find Patient'**
  String get findPatient;

  /// Link text for password recovery
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @formInvalid.
  ///
  /// In en, this message translates to:
  /// **'Form is not valid'**
  String get formInvalid;

  /// No description provided for @frequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get frequency;

  /// No description provided for @frequencyHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Twice daily'**
  String get frequencyHint;

  /// Label for start date in date range
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// Label for gender selection field
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon,'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening,'**
  String get goodEvening;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning,'**
  String get goodMorning;

  /// No description provided for @healthSummary.
  ///
  /// In en, this message translates to:
  /// **'Health Summary'**
  String get healthSummary;

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

  /// Title for home page and navigation item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Label for hospital name field
  ///
  /// In en, this message translates to:
  /// **'Hospital Name'**
  String get hospitalName;

  /// Generic label for hospital stay
  ///
  /// In en, this message translates to:
  /// **'Hospitalization'**
  String get hospitalization;

  /// Label for hospitalization reason field
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get hospitalizationReason;

  /// Label for ID card number input field
  ///
  /// In en, this message translates to:
  /// **'ID Card Number'**
  String get idCardNumber;

  /// No description provided for @identifier.
  ///
  /// In en, this message translates to:
  /// **'Identifier'**
  String get identifier;

  /// No description provided for @inReview.
  ///
  /// In en, this message translates to:
  /// **'inReview'**
  String get inReview;

  /// Status value for inactive patients
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// Filter option for inactive patients only
  ///
  /// In en, this message translates to:
  /// **'Inactive Only'**
  String get inactiveOnly;

  /// Label for inactive patient count statistic
  ///
  /// In en, this message translates to:
  /// **'Inactive Patients'**
  String get inactivePatients;

  /// No description provided for @inactivePrescriptions.
  ///
  /// In en, this message translates to:
  /// **'inactive Prescriptions'**
  String get inactivePrescriptions;

  /// No description provided for @incompleteTapToEdit.
  ///
  /// In en, this message translates to:
  /// **'Incomplete • Tap to edit'**
  String get incompleteTapToEdit;

  /// Label for insurance information section
  ///
  /// In en, this message translates to:
  /// **'Insurance Information'**
  String get insuranceInfo;

  /// Error message for incorrect login credentials
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number or password'**
  String get invalidCredentials;

  /// No description provided for @invalidDate.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid date'**
  String get invalidDate;

  /// Validation error for invalid email
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// Validation error for invalid height input
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid height (1-300 cm)'**
  String get invalidHeight;

  /// No description provided for @invalidImageData.
  ///
  /// In en, this message translates to:
  /// **'Invalid image data'**
  String get invalidImageData;

  /// Validation error for invalid national ID
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid National ID'**
  String get invalidNationalId;

  /// Validation error for invalid phone number
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhone;

  /// Validation error for invalid weight input
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid weight (1-500 kg)'**
  String get invalidWeight;

  /// Label for alcohol consumption status toggle
  ///
  /// In en, this message translates to:
  /// **'Alcohol Consumer'**
  String get isAlcoholConsumer;

  /// Label for pregnancy status toggle
  ///
  /// In en, this message translates to:
  /// **'Pregnant'**
  String get isPregnant;

  /// Label for smoking status toggle
  ///
  /// In en, this message translates to:
  /// **'Smoker'**
  String get isSmoker;

  /// Shows progress of medication entries
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} completed'**
  String itemsCompleted(int completed, int total);

  /// No description provided for @itemsCompleted0.
  ///
  /// In en, this message translates to:
  /// **' of  completed'**
  String get itemsCompleted0;

  /// Label for laboratory results section
  ///
  /// In en, this message translates to:
  /// **'Lab Results'**
  String get labResults;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Label for last menstrual period date field
  ///
  /// In en, this message translates to:
  /// **'Last Menstrual Period'**
  String get lastMenstrualPeriod;

  /// Label for last update timestamp
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// Label for patient's last visit date
  ///
  /// In en, this message translates to:
  /// **'Last Visit'**
  String get lastVisit;

  /// No description provided for @latestDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Latest Diagnosis'**
  String get latestDiagnosis;

  /// No description provided for @licenseNumber.
  ///
  /// In en, this message translates to:
  /// **'License Number'**
  String get licenseNumber;

  /// Section title for lifestyle information
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get lifestyle;

  /// Label for number of live births field
  ///
  /// In en, this message translates to:
  /// **'Live Births'**
  String get liveBirths;

  /// Text shown during data loading
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Text for login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginAsPatient.
  ///
  /// In en, this message translates to:
  /// **'Login as Patient'**
  String get loginAsPatient;

  /// No description provided for @loginDescription.
  ///
  /// In en, this message translates to:
  /// **'Log in or create an account to sync your data across all your devices.'**
  String get loginDescription;

  /// Error message shown when login fails
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginFailed;

  /// Success message shown after successful login
  ///
  /// In en, this message translates to:
  /// **'Login successful!'**
  String get loginSuccess;

  /// Title displayed on the login screen
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginTitle;

  /// Button text to logout from the app
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// Label for vaccine lot number field
  ///
  /// In en, this message translates to:
  /// **'Lot Number'**
  String get lotNumber;

  /// Gender option for male
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// Title for medical history section and page
  ///
  /// In en, this message translates to:
  /// **'Medical History'**
  String get medicalHistory;

  /// Success message after saving medical history
  ///
  /// In en, this message translates to:
  /// **'Medical history saved successfully'**
  String get medicalHistorySaved;

  /// Section title for medical details
  ///
  /// In en, this message translates to:
  /// **'Medical Information'**
  String get medicalInformation;

  /// Label for medical record section
  ///
  /// In en, this message translates to:
  /// **'Medical Record'**
  String get medicalRecord;

  /// No description provided for @medicalRecords.
  ///
  /// In en, this message translates to:
  /// **'Medical Records'**
  String get medicalRecords;

  /// No description provided for @medicationPlan.
  ///
  /// In en, this message translates to:
  /// **'Medication Plan'**
  String get medicationPlan;

  /// Navigation item for medications
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get medications;

  /// Hint text for medications input
  ///
  /// In en, this message translates to:
  /// **'List current medications and dosages'**
  String get medicationsHint;

  /// No description provided for @medicationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Medications:'**
  String get medicationsLabel;

  /// No description provided for @medicineName.
  ///
  /// In en, this message translates to:
  /// **'Medicine Name'**
  String get medicineName;

  /// Confirmation message when medicine is taken
  ///
  /// In en, this message translates to:
  /// **'Medicine Taken'**
  String get medicineTaken;

  /// Section title for mental health information
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get mentalHealth;

  /// Label for mental health conditions field
  ///
  /// In en, this message translates to:
  /// **'Mental Health Conditions'**
  String get mentalHealthConditions;

  /// No description provided for @myPrescriptions.
  ///
  /// In en, this message translates to:
  /// **'My Prescriptions'**
  String get myPrescriptions;

  /// Label for name input field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Label for national identification number field
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalId;

  /// No description provided for @needConsultation.
  ///
  /// In en, this message translates to:
  /// **'need Consultation'**
  String get needConsultation;

  /// No description provided for @newMedication.
  ///
  /// In en, this message translates to:
  /// **'New Medication'**
  String get newMedication;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @newPrescription.
  ///
  /// In en, this message translates to:
  /// **'New Prescription'**
  String get newPrescription;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Negative response option
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noDashboardData.
  ///
  /// In en, this message translates to:
  /// **'No dashboard data available.'**
  String get noDashboardData;

  /// Message shown when no medical history exists
  ///
  /// In en, this message translates to:
  /// **'No medical history available'**
  String get noMedicalHistory;

  /// Message when no medical history record exists
  ///
  /// In en, this message translates to:
  /// **'No medical history found'**
  String get noMedicalHistoryFound;

  /// No description provided for @noMedicalRecords.
  ///
  /// In en, this message translates to:
  /// **'No Medical Records'**
  String get noMedicalRecords;

  /// No description provided for @noMedicalRecordsDescription.
  ///
  /// In en, this message translates to:
  /// **'No records found in the system. Search for a patient to start.'**
  String get noMedicalRecordsDescription;

  /// Message shown when no medication is scheduled
  ///
  /// In en, this message translates to:
  /// **'No medicine scheduled for today'**
  String get noMedicineScheduled;

  /// Message displayed when no patients match search
  ///
  /// In en, this message translates to:
  /// **'No patients found'**
  String get noPatientsFound;

  /// No description provided for @noPrescriptions.
  ///
  /// In en, this message translates to:
  /// **'No Prescriptions'**
  String get noPrescriptions;

  /// No description provided for @noPrescriptionsDescription.
  ///
  /// In en, this message translates to:
  /// **'It looks like you haven’t added any prescriptions yet. Start by creating your first prescription.'**
  String get noPrescriptionsDescription;

  /// Message shown when no appointments are scheduled
  ///
  /// In en, this message translates to:
  /// **'No upcoming doctor visits'**
  String get noUpcomingVisits;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not Specified'**
  String get notSpecified;

  /// Alternative label for additional notes
  ///
  /// In en, this message translates to:
  /// **'Additional Notes'**
  String get notes;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable notifications'**
  String get notificationsDescription;

  /// Button text for confirmation
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get oldPassword;

  /// Gender option for other/unspecified
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @partialDispensed.
  ///
  /// In en, this message translates to:
  /// **'partial Dispensed'**
  String get partialDispensed;

  /// Label for password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your password has been updated successfully.'**
  String get passwordChangedSuccessfully;

  /// Label for password confirmation input field during registration
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation'**
  String get passwordConfirmation;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

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

  /// User type option for patients
  ///
  /// In en, this message translates to:
  /// **'Patient'**
  String get patient;

  /// Success message after adding a patient
  ///
  /// In en, this message translates to:
  /// **'Patient added successfully'**
  String get patientAdded;

  /// No description provided for @patientCode.
  ///
  /// In en, this message translates to:
  /// **'Patient Code'**
  String get patientCode;

  /// Success message after deleting a patient
  ///
  /// In en, this message translates to:
  /// **'Patient deleted successfully'**
  String get patientDeleted;

  /// Title for patient details view
  ///
  /// In en, this message translates to:
  /// **'Patient Details'**
  String get patientDetails;

  /// No description provided for @patientDigitalId.
  ///
  /// In en, this message translates to:
  /// **'Patient Digital ID'**
  String get patientDigitalId;

  /// Label for patient identification number
  ///
  /// In en, this message translates to:
  /// **'Patient ID'**
  String get patientId;

  /// No description provided for @patientIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Patient ID: {id}'**
  String patientIdLabel(int id);

  /// Label for patient's full name field
  ///
  /// In en, this message translates to:
  /// **'Patient Name'**
  String get patientName;

  /// No description provided for @patientNotFound.
  ///
  /// In en, this message translates to:
  /// **'Patient not found: {error}'**
  String patientNotFound(String error);

  /// No description provided for @patientPrescriptions.
  ///
  /// In en, this message translates to:
  /// **'Patient Prescriptions'**
  String get patientPrescriptions;

  /// Success message after updating a patient
  ///
  /// In en, this message translates to:
  /// **'Patient updated successfully'**
  String get patientUpdated;

  /// Title for patients section and navigation item
  ///
  /// In en, this message translates to:
  /// **'Patients'**
  String get patients;

  /// Status for pending appointments
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @pendingPrescriptions.
  ///
  /// In en, this message translates to:
  /// **'pending Prescriptions'**
  String get pendingPrescriptions;

  /// Section title for personal details in medical history
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// User type option for pharmacists
  ///
  /// In en, this message translates to:
  /// **'Pharmacist'**
  String get pharmacist;

  /// No description provided for @pharmacyName.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy Name'**
  String get pharmacyName;

  /// Label for phone number input field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterEmail;

  /// No description provided for @pleaseEnterLicenseNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter license number'**
  String get pleaseEnterLicenseNumber;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterName;

  /// No description provided for @pleaseEnterPharmacyName.
  ///
  /// In en, this message translates to:
  /// **'Please enter pharmacy name'**
  String get pleaseEnterPharmacyName;

  /// No description provided for @pleaseEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get pleaseEnterPhoneNumber;

  /// No description provided for @pleaseEnterSpecialization.
  ///
  /// In en, this message translates to:
  /// **'Please enter specialization'**
  String get pleaseEnterSpecialization;

  /// No description provided for @pleaseSelectUserType.
  ///
  /// In en, this message translates to:
  /// **'Please select user type'**
  String get pleaseSelectUserType;

  /// Gender option for preferring not to disclose
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get preferNotToSay;

  /// Label for number of pregnancies field
  ///
  /// In en, this message translates to:
  /// **'Pregnancies'**
  String get pregnancies;

  /// Button text to prescribe medication
  ///
  /// In en, this message translates to:
  /// **'Prescribe Medication'**
  String get prescribeMedication;

  /// No description provided for @prescriptionCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Prescription created successfully'**
  String get prescriptionCreatedSuccess;

  /// Label for prescriptions section
  ///
  /// In en, this message translates to:
  /// **'Prescriptions'**
  String get prescriptions;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Alternative label for surgical history
  ///
  /// In en, this message translates to:
  /// **'Previous Surgeries'**
  String get previousSurgeries;

  /// Button text to print documents
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @privacyAndSecurity.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get privacyAndSecurity;

  /// Label for surgical procedure name field
  ///
  /// In en, this message translates to:
  /// **'Procedure Name'**
  String get procedureName;

  /// Navigation item for user profile
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @profilePage.
  ///
  /// In en, this message translates to:
  /// **'profile'**
  String get profilePage;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// Title for quick actions section
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @reaction.
  ///
  /// In en, this message translates to:
  /// **'Reaction'**
  String get reaction;

  /// No description provided for @readyToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Ready to get started?'**
  String get readyToGetStarted;

  /// No description provided for @recentActivities.
  ///
  /// In en, this message translates to:
  /// **'Recent Activities'**
  String get recentActivities;

  /// Title for recent patients section
  ///
  /// In en, this message translates to:
  /// **'Recent Patients'**
  String get recentPatients;

  /// No description provided for @recordsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No records} =1{1 record} other{{count} records}}'**
  String recordsCount(int count);

  /// Label for recreational drugs details field
  ///
  /// In en, this message translates to:
  /// **'Recreational Drugs Details'**
  String get recreationalDrugsDetails;

  /// Button text to refresh data
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// Button text for registration
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Label for patient registration date
  ///
  /// In en, this message translates to:
  /// **'Registration Date'**
  String get registrationDate;

  /// No description provided for @removePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove Photo'**
  String get removePhoto;

  /// Navigation item for reports
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// Validation error message for required fields
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// Button text to reset filters
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Button text to retry a failed operation
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @sameAsOldPassword.
  ///
  /// In en, this message translates to:
  /// **'New password cannot be the same as old password'**
  String get sameAsOldPassword;

  /// Button text to save changes
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// Button text to save medical history form
  ///
  /// In en, this message translates to:
  /// **'Save Medical History'**
  String get saveMedicalHistory;

  /// No description provided for @savePrescription.
  ///
  /// In en, this message translates to:
  /// **'Save Prescription'**
  String get savePrescription;

  /// No description provided for @scanForMedicalProfile.
  ///
  /// In en, this message translates to:
  /// **'Scan for Medical Profile'**
  String get scanForMedicalProfile;

  /// Button text to schedule appointment
  ///
  /// In en, this message translates to:
  /// **'Schedule Appointment'**
  String get scheduleAppointment;

  /// Text showing scheduled time for appointments
  ///
  /// In en, this message translates to:
  /// **'Scheduled for {time}'**
  String scheduledFor(String time);

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Hint text for patient search field
  ///
  /// In en, this message translates to:
  /// **'Search patients...'**
  String get searchPatients;

  /// No description provided for @seeHistory.
  ///
  /// In en, this message translates to:
  /// **'See History'**
  String get seeHistory;

  /// Hint text for blood type dropdown
  ///
  /// In en, this message translates to:
  /// **'Select Blood Type'**
  String get selectBloodType;

  /// Hint text for date selection
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// Hint text for gender dropdown
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get selectGender;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// Hint text for user type dropdown
  ///
  /// In en, this message translates to:
  /// **'Select User Type'**
  String get selectUserType;

  /// No description provided for @serverDownMessage.
  ///
  /// In en, this message translates to:
  /// **'The server is currently unreachable. Please check your connection or try again later.'**
  String get serverDownMessage;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error'**
  String get serverError;

  /// Title for settings page/menu
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get somethingWentWrong;

  /// Button text to sort data
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @specialInstructions.
  ///
  /// In en, this message translates to:
  /// **'Special Instructions (Optional)'**
  String get specialInstructions;

  /// No description provided for @specialization.
  ///
  /// In en, this message translates to:
  /// **'Specialization'**
  String get specialization;

  /// Title for statistics section
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// Label for status field in patient lists
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @stepProgress.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepProgress(int current, int total);

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @successCreateRecord.
  ///
  /// In en, this message translates to:
  /// **'Medical record created successfully'**
  String get successCreateRecord;

  /// Label for surgeon's name field
  ///
  /// In en, this message translates to:
  /// **'Surgeon Name'**
  String get surgeonName;

  /// Hint text for surgeries input
  ///
  /// In en, this message translates to:
  /// **'List previous surgical procedures'**
  String get surgeriesHint;

  /// Generic label for surgery
  ///
  /// In en, this message translates to:
  /// **'Surgery'**
  String get surgery;

  /// Label for surgery date field
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get surgeryDate;

  /// Section title for past surgeries
  ///
  /// In en, this message translates to:
  /// **'Surgical History'**
  String get surgicalHistory;

  /// No description provided for @symptoms.
  ///
  /// In en, this message translates to:
  /// **'Symptoms'**
  String get symptoms;

  /// Button text to mark medicine as taken
  ///
  /// In en, this message translates to:
  /// **'Take Medicine'**
  String get takeMedicine;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @themeDescription.
  ///
  /// In en, this message translates to:
  /// **'Switch between dark and light theme'**
  String get themeDescription;

  /// Date filter option for this month
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// Date filter option for this week
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// Label for end date in date range
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// Date filter option for today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Title for today's patient visits section
  ///
  /// In en, this message translates to:
  /// **'Today\'s Visits'**
  String get todayVisits;

  /// Title for today's medication schedule section
  ///
  /// In en, this message translates to:
  /// **'Today\'s Medicine'**
  String get todaysMedicine;

  /// Title for today's schedule section
  ///
  /// In en, this message translates to:
  /// **'Today\'s Schedule'**
  String get todaysSchedule;

  /// Label for total patient count statistic
  ///
  /// In en, this message translates to:
  /// **'Total Patients'**
  String get totalPatients;

  /// No description provided for @totalPrescriptions.
  ///
  /// In en, this message translates to:
  /// **'total Prescriptions'**
  String get totalPrescriptions;

  /// No description provided for @treatment.
  ///
  /// In en, this message translates to:
  /// **'Treatment'**
  String get treatment;

  /// Label for treatment details field
  ///
  /// In en, this message translates to:
  /// **'Treatment Details'**
  String get treatmentDetails;

  /// Title for upcoming appointments section
  ///
  /// In en, this message translates to:
  /// **'Upcoming Appointments'**
  String get upcomingAppointments;

  /// Title for upcoming appointments section
  ///
  /// In en, this message translates to:
  /// **'Upcoming Doctor Visits'**
  String get upcomingVisits;

  /// Button text for updating items
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @updatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get updatePassword;

  /// Label for fingerprint authentication toggle
  ///
  /// In en, this message translates to:
  /// **'Use Fingerprint'**
  String get useFingerprint;

  /// Label for user type dropdown field
  ///
  /// In en, this message translates to:
  /// **'User Type'**
  String get userType;

  /// Label for recreational drug use toggle
  ///
  /// In en, this message translates to:
  /// **'Uses Recreational Drugs'**
  String get usesRecreationalDrugs;

  /// Generic label for immunization
  ///
  /// In en, this message translates to:
  /// **'Vaccination'**
  String get vaccination;

  /// Section title for immunization records
  ///
  /// In en, this message translates to:
  /// **'Vaccination History'**
  String get vaccinationHistory;

  /// Label for vaccine name field
  ///
  /// In en, this message translates to:
  /// **'Vaccine Name'**
  String get vaccineName;

  /// Button text to view details
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// Button text to view all items in a list
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// Button text to view all patients
  ///
  /// In en, this message translates to:
  /// **'View All Patients'**
  String get viewAllPatients;

  /// No description provided for @viewDetailedReport.
  ///
  /// In en, this message translates to:
  /// **'View Detailed Report'**
  String get viewDetailedReport;

  /// Button/text for viewing medical history
  ///
  /// In en, this message translates to:
  /// **'View Medical History'**
  String get viewMedicalHistory;

  /// No description provided for @visits.
  ///
  /// In en, this message translates to:
  /// **'Visits'**
  String get visits;

  /// Section title for height, weight, BMI, etc.
  ///
  /// In en, this message translates to:
  /// **'Vital Statistics'**
  String get vitalStatistics;

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

  /// Welcome message on dashboard with user's name
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcome(String name);

  /// Section title for women's specific health information
  ///
  /// In en, this message translates to:
  /// **'Women\'s Health'**
  String get womensHealth;

  /// Affirmative response option
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @professionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Professional Details'**
  String get professionalInfo;
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
