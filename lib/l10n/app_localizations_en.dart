// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get failedToLoadFromServer => 'Failed to connect to the server.';

  @override
  String get unexpectedError => 'An unexpected error occurred.';

  @override
  String get medicalProfile => 'Medical Profile';

  @override
  String get vitalsAndPhysical => 'Vitals & Physical';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get addAllergy => 'Add Allergy';

  @override
  String get addDisease => 'Add Disease';

  @override
  String get addMedication => 'Add Medication';

  @override
  String get description => 'Description';

  @override
  String get instructions => 'Instructions';

  @override
  String get severity => 'Severity';

  @override
  String get fullName => 'Full Name';

  @override
  String get failedToLoadRecords => 'Failed to load records';

  @override
  String get noMedicalRecordsFound => 'No medical records found.';

  @override
  String get recordsWillAppearHere =>
      'When you visit a doctor, records will appear here.';

  @override
  String get generalConsultation => 'General Consultation';

  @override
  String get noDiagnosisListed => 'No Diagnosis Listed';

  @override
  String get dr => 'Dr.';

  @override
  String get doctorNotes => 'Doctor Notes';

  @override
  String get recordId => 'Record ID';

  @override
  String get created => 'Created';

  @override
  String get na => 'N/A';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get pleaseEnterValue => 'Please enter a value';

  @override
  String get updateSuccessful => 'Profile updated successfully!';

  @override
  String get genderOther => 'Other';

  @override
  String dob(String date, String gender) {
    return 'DOB: $date ($gender)';
  }

  @override
  String lastUpdated2(String date) {
    return 'Last updated: $date';
  }

  @override
  String get notProvided => 'Not provided';

  @override
  String patientId2(int id, int userId) {
    return 'Patient ID: $id • User ID: $userId';
  }

  @override
  String profileCreated(String date) {
    return 'Profile created: $date';
  }

  @override
  String get unknown => 'Unknown';

  @override
  String get blood => 'Blood';

  @override
  String weightValue(int weight) {
    return '$weight kg';
  }

  @override
  String heightValue(int height) {
    return '$height cm';
  }

  @override
  String get notApplicable => 'N/A';

  @override
  String get noAllergiesRecorded => 'No allergies recorded';

  @override
  String reaction2(Object reaction) {
    return 'Reaction: $reaction';
  }

  @override
  String get noChronicDiseasesRecorded => 'No chronic diseases recorded';

  @override
  String diagnosed(String date) {
    return 'Diagnosed: $date';
  }

  @override
  String get noSurgeriesRecorded => 'No surgeries recorded';

  @override
  String hospital(String hospital) {
    return 'Hospital: $hospital';
  }

  @override
  String surgeon(String surgeon) {
    return 'Surgeon: $surgeon';
  }

  @override
  String get noCurrentMedications => 'No current medications';

  @override
  String medicationDosage(String dosage, String frequency) {
    return '$dosage - $frequency';
  }

  @override
  String get loadingProfileData => 'Loading profile data...';

  @override
  String get oopsSomethingWentWrong => 'Oops! Something went wrong.';

  @override
  String get surgeries => 'surgeries';

  @override
  String get aboutApp => 'About App';

  @override
  String get actions => 'Actions';

  @override
  String get active => 'Active';

  @override
  String get activeOnly => 'Active Only';

  @override
  String get activePatients => 'Active Patients';

  @override
  String get activePrescriptions => 'active Prescriptions';

  @override
  String get add => 'Add';

  @override
  String get addCondition => 'Add Condition';

  @override
  String get addHealthData => 'Add Health Data';

  @override
  String get addHospitalization => 'Add Hospitalization';

  @override
  String get addNewMedication => 'Add New Medication';

  @override
  String get addNewPatient => 'Add New Patient';

  @override
  String get addPatient => 'Add Patient';

  @override
  String get addPrescription => 'Add Prescription';

  @override
  String get addSurgery => 'Add Surgery';

  @override
  String get addToList => 'Add to List';

  @override
  String get addVaccination => 'Add Vaccination';

  @override
  String get additionalInformation => 'Additional Information';

  @override
  String get additionalNotes => 'Additional Notes';

  @override
  String get additionalNotesHint => 'Any other relevant medical information';

  @override
  String get address => 'Address';

  @override
  String get admin => 'Administrator';

  @override
  String get administeringFacility => 'Administering Facility';

  @override
  String get admissionDate => 'Admission Date';

  @override
  String get age => 'Age';

  @override
  String get alcoholFrequency => 'Alcohol Frequency';

  @override
  String get allStatus => 'All Status';

  @override
  String get allergenName => 'Allergen Name';

  @override
  String get allergies => 'Allergies';

  @override
  String get allergiesHint => 'Enter allergies (comma separated)';

  @override
  String get allergySeverity => 'Allergy Severity';

  @override
  String get appTitle => 'HealthCare Pro';

  @override
  String get apply => 'Apply';

  @override
  String get appointments => 'Appointments';

  @override
  String get ascending => 'Ascending';

  @override
  String get attachments => 'Attachments';

  @override
  String get biometricAuth => 'Biometric Authentication';

  @override
  String get bloodType => 'Blood Type';

  @override
  String get bloodTypeA => 'A';

  @override
  String get bloodTypeAB => 'AB';

  @override
  String get bloodTypeB => 'B';

  @override
  String get bloodTypeO => 'O';

  @override
  String get bmi => 'BMI';

  @override
  String get byDate => 'By Date';

  @override
  String get byName => 'By Name';

  @override
  String get byStatus => 'By Status';

  @override
  String get cancel => 'Cancel';

  @override
  String get canceled => 'canceled';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get changePassword => 'Change Password';

  @override
  String get changePasswordInstruction =>
      'Please enter your current password and choose a new secure one.';

  @override
  String get changesSavedSuccessfully => 'Changes saved successfully';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String get chronicConditions => 'Chronic Conditions';

  @override
  String get chronicConditionsHint =>
      'Enter chronic conditions (comma separated)';

  @override
  String get chronicDiseases => 'Chronic Diseases';

  @override
  String get chronicDiseasesHint =>
      'List chronic conditions (e.g., Diabetes, Hypertension)';

  @override
  String get cigarettesPerDay => 'Cigarettes per day';

  @override
  String get clearSearch => 'Clear Search';

  @override
  String get collapseAll => 'Collapse All';

  @override
  String get completed => 'Completed';

  @override
  String get complications => 'Complications';

  @override
  String get confirm => 'Confirm';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String get confirmPassword => 'Confirm New Password';

  @override
  String get confirmVisit => 'Confirm Visit';

  @override
  String get connecting => 'Connecting to secure server...';

  @override
  String get connectionError =>
      'An error occurred while connecting. Please check your internet.';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get create => 'Create';

  @override
  String get createAccount => 'Create New Account';

  @override
  String get createMedicalHistory => 'Create Medical History';

  @override
  String get createMedicalRecordStep => 'Create Medical Record - Step';

  @override
  String get createNewPrescription => 'Create New Prescription';

  @override
  String get createNewRecord => 'Create New Record';

  @override
  String get createPrescription => 'Create Prescription';

  @override
  String get createProfile => 'Create Profile';

  @override
  String get createdAt => 'Created At';

  @override
  String get currentMedications => 'Current Medications';

  @override
  String get currentMedicationsHint =>
      'Enter current medications (comma separated)';

  @override
  String get currentTherapist => 'Current Therapist';

  @override
  String get customRange => 'Custom Range';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get dataTooLargeQr => 'Data too large for QR code';

  @override
  String get dateAdministered => 'Date Administered';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get delete => 'Delete';

  @override
  String get deletePatientMessage =>
      'Are you sure you want to delete this patient?';

  @override
  String get descending => 'Descending';

  @override
  String get diagnosis => 'Diagnosis';

  @override
  String get diagnosisLabel => 'Diagnosis:';

  @override
  String get dietaryPreferences => 'Dietary Preferences';

  @override
  String get dischargeDate => 'Discharge Date';

  @override
  String get dispense => 'Dispense';

  @override
  String get dispensed => 'dispensed';

  @override
  String get doctor => 'Doctor';

  @override
  String get doctors => 'Doctors';

  @override
  String get done => 'Done';

  @override
  String get dosage => 'Dosage';

  @override
  String get dosageHint => 'e.g., 500mg';

  @override
  String get drugName => 'Drug Name';

  @override
  String get duration => 'Duration';

  @override
  String get durationHint => 'e.g., 7 days';

  @override
  String get edit => 'Edit';

  @override
  String get editMedicalHistory => 'Edit Medical History';

  @override
  String get editPatient => 'Edit Patient';

  @override
  String get editPrescription => 'Edit Prescription';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get email => 'Email';

  @override
  String get emergencyContact => 'Emergency Contact';

  @override
  String get emergencyContactName => 'Emergency Contact Name';

  @override
  String get emergencyContactPhone => 'Emergency Contact Phone';

  @override
  String get emergencyContactRelationship => 'Relationship';

  @override
  String get emergencyInfo => 'Emergency Info';

  @override
  String get emergencyPage => 'emergency';

  @override
  String get emptyTapToAdd => 'Empty • Tap to add details';

  @override
  String get enterDiagnosisHint => 'Enter patient diagnosis...';

  @override
  String get enterNotes => 'Enter notes...';

  @override
  String get enterPassword => 'Please enter password';

  @override
  String get enterSymptomsHint => 'What symptoms is the patient showing?';

  @override
  String get enterTreatmentHint => 'Outline the recommended treatment plan...';

  @override
  String get error => 'An error occurred';

  @override
  String errorCreateRecord(String msg) {
    return 'Error: $msg';
  }

  @override
  String get errorPickingFile => 'Error picking file';

  @override
  String get exerciseFrequency => 'Exercise Frequency';

  @override
  String get expandAll => 'Expand All';

  @override
  String get expandCollapseAll => 'Expand/Collapse All';

  @override
  String get expirationDate => 'Expiration Date';

  @override
  String get exportData => 'Export Data';

  @override
  String get failedToLoadDashboard => 'Failed to load dashboard';

  @override
  String get failedToLoadEmergencyData => 'Failed to load emergency data.';

  @override
  String get failedToLoadImage => 'Failed to load image';

  @override
  String get familyHistory => 'Family History';

  @override
  String get familyHistoryHint => 'Notable family medical history';

  @override
  String get familyMedicalHistory => 'Family Medical History';

  @override
  String get female => 'Female';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get filter => 'Filter';

  @override
  String get findPatient => 'Find Patient';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get formInvalid => 'Form is not valid';

  @override
  String get frequency => 'Frequency';

  @override
  String get frequencyHint => 'e.g., Twice daily';

  @override
  String get from => 'From';

  @override
  String get gender => 'Gender';

  @override
  String get goodAfternoon => 'Good Afternoon,';

  @override
  String get goodEvening => 'Good Evening,';

  @override
  String get goodMorning => 'Good Morning,';

  @override
  String get healthSummary => 'Health Summary';

  @override
  String get height => 'Height';

  @override
  String get heightUnit => 'cm';

  @override
  String get home => 'Home';

  @override
  String get hospitalName => 'Hospital Name';

  @override
  String get hospitalization => 'Hospitalization';

  @override
  String get hospitalizationReason => 'Reason';

  @override
  String get idCardNumber => 'ID Card Number';

  @override
  String get identifier => 'Identifier';

  @override
  String get inReview => 'inReview';

  @override
  String get inactive => 'Inactive';

  @override
  String get inactiveOnly => 'Inactive Only';

  @override
  String get inactivePatients => 'Inactive Patients';

  @override
  String get inactivePrescriptions => 'inactive Prescriptions';

  @override
  String get incompleteTapToEdit => 'Incomplete • Tap to edit';

  @override
  String get insuranceInfo => 'Insurance Information';

  @override
  String get invalidCredentials => 'Invalid phone number or password';

  @override
  String get invalidDate => 'You must enter a valid date';

  @override
  String get invalidEmail => 'Please enter a valid email address';

  @override
  String get invalidHeight => 'Please enter a valid height (1-300 cm)';

  @override
  String get invalidImageData => 'Invalid image data';

  @override
  String get invalidNationalId => 'Please enter a valid National ID';

  @override
  String get invalidPhone => 'Please enter a valid phone number';

  @override
  String get invalidWeight => 'Please enter a valid weight (1-500 kg)';

  @override
  String get isAlcoholConsumer => 'Alcohol Consumer';

  @override
  String get isPregnant => 'Pregnant';

  @override
  String get isSmoker => 'Smoker';

  @override
  String itemsCompleted(int completed, int total) {
    return '$completed of $total completed';
  }

  @override
  String get itemsCompleted0 => ' of  completed';

  @override
  String get labResults => 'Lab Results';

  @override
  String get language => 'Language';

  @override
  String get lastMenstrualPeriod => 'Last Menstrual Period';

  @override
  String get lastUpdated => 'Last Updated';

  @override
  String get lastVisit => 'Last Visit';

  @override
  String get latestDiagnosis => 'Latest Diagnosis';

  @override
  String get licenseNumber => 'License Number';

  @override
  String get lifestyle => 'Lifestyle';

  @override
  String get liveBirths => 'Live Births';

  @override
  String get loading => 'Loading...';

  @override
  String get login => 'Login';

  @override
  String get loginAsPatient => 'Login as Patient';

  @override
  String get loginDescription =>
      'Log in or create an account to sync your data across all your devices.';

  @override
  String get loginFailed => 'Login failed. Please try again.';

  @override
  String get loginSuccess => 'Login successful!';

  @override
  String get loginTitle => 'Welcome Back';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';

  @override
  String get lotNumber => 'Lot Number';

  @override
  String get male => 'Male';

  @override
  String get medicalHistory => 'Medical History';

  @override
  String get medicalHistorySaved => 'Medical history saved successfully';

  @override
  String get medicalInformation => 'Medical Information';

  @override
  String get medicalRecord => 'Medical Record';

  @override
  String get medicalRecords => 'Medical Records';

  @override
  String get medicationPlan => 'Medication Plan';

  @override
  String get medications => 'Medications';

  @override
  String get medicationsHint => 'List current medications and dosages';

  @override
  String get medicationsLabel => 'Medications:';

  @override
  String get medicineName => 'Medicine Name';

  @override
  String get medicineTaken => 'Medicine Taken';

  @override
  String get mentalHealth => 'Mental Health';

  @override
  String get mentalHealthConditions => 'Mental Health Conditions';

  @override
  String get myPrescriptions => 'My Prescriptions';

  @override
  String get name => 'Name';

  @override
  String get nationalId => 'National ID';

  @override
  String get needConsultation => 'need Consultation';

  @override
  String get newMedication => 'New Medication';

  @override
  String get newPassword => 'New Password';

  @override
  String get newPrescription => 'New Prescription';

  @override
  String get next => 'Next';

  @override
  String get no => 'No';

  @override
  String get noDashboardData => 'No dashboard data available.';

  @override
  String get noMedicalHistory => 'No medical history available';

  @override
  String get noMedicalHistoryFound => 'No medical history found';

  @override
  String get noMedicalRecords => 'No Medical Records';

  @override
  String get noMedicalRecordsDescription =>
      'No records found in the system. Search for a patient to start.';

  @override
  String get noMedicineScheduled => 'No medicine scheduled for today';

  @override
  String get noPatientsFound => 'No patients found';

  @override
  String get noPrescriptions => 'No Prescriptions';

  @override
  String get noPrescriptionsDescription =>
      'It looks like you haven’t added any prescriptions yet. Start by creating your first prescription.';

  @override
  String get noUpcomingVisits => 'No upcoming doctor visits';

  @override
  String get notSpecified => 'Not Specified';

  @override
  String get notes => 'Additional Notes';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsDescription => 'Enable or disable notifications';

  @override
  String get ok => 'OK';

  @override
  String get oldPassword => 'Current Password';

  @override
  String get other => 'Other';

  @override
  String get overview => 'Overview';

  @override
  String get partialDispensed => 'partial Dispensed';

  @override
  String get password => 'Password';

  @override
  String get passwordChangedSuccessfully =>
      'Your password has been updated successfully.';

  @override
  String get passwordConfirmation => 'Password Confirmation';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get pastMedications => 'Past Medications';

  @override
  String get pastMedicationsHint => 'Enter past medications (comma separated)';

  @override
  String get patient => 'Patient';

  @override
  String get patientAdded => 'Patient added successfully';

  @override
  String get patientCode => 'Patient Code';

  @override
  String get patientDeleted => 'Patient deleted successfully';

  @override
  String get patientDetails => 'Patient Details';

  @override
  String get patientDigitalId => 'Patient Digital ID';

  @override
  String get patientId => 'Patient ID';

  @override
  String patientIdLabel(int id) {
    return 'Patient ID: $id';
  }

  @override
  String get patientName => 'Patient Name';

  @override
  String patientNotFound(String error) {
    return 'Patient not found: $error';
  }

  @override
  String get patientPrescriptions => 'Patient Prescriptions';

  @override
  String get patientUpdated => 'Patient updated successfully';

  @override
  String get patients => 'Patients';

  @override
  String get pending => 'Pending';

  @override
  String get pendingPrescriptions => 'pending Prescriptions';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get pharmacist => 'Pharmacist';

  @override
  String get pharmacyName => 'Pharmacy Name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get pleaseEnterEmail => 'Please enter your email';

  @override
  String get pleaseEnterLicenseNumber => 'Please enter license number';

  @override
  String get pleaseEnterName => 'Please enter your name';

  @override
  String get pleaseEnterPharmacyName => 'Please enter pharmacy name';

  @override
  String get pleaseEnterPhoneNumber => 'Please enter phone number';

  @override
  String get pleaseEnterSpecialization => 'Please enter specialization';

  @override
  String get pleaseSelectUserType => 'Please select user type';

  @override
  String get preferNotToSay => 'Prefer not to say';

  @override
  String get pregnancies => 'Pregnancies';

  @override
  String get prescribeMedication => 'Prescribe Medication';

  @override
  String get prescriptionCreatedSuccess => 'Prescription created successfully';

  @override
  String get prescriptions => 'Prescriptions';

  @override
  String get previous => 'Previous';

  @override
  String get previousSurgeries => 'Previous Surgeries';

  @override
  String get print => 'Print';

  @override
  String get privacyAndSecurity => 'Privacy & Security';

  @override
  String get procedureName => 'Procedure Name';

  @override
  String get profile => 'Profile';

  @override
  String get profilePage => 'profile';

  @override
  String get quantity => 'Quantity';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String reaction(String reaction) {
    return 'Reaction';
  }

  @override
  String get readyToGetStarted => 'Ready to get started?';

  @override
  String get recentActivities => 'Recent Activities';

  @override
  String get recentPatients => 'Recent Patients';

  @override
  String recordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records',
      one: '1 record',
      zero: 'No records',
    );
    return '$_temp0';
  }

  @override
  String get recreationalDrugsDetails => 'Recreational Drugs Details';

  @override
  String get refresh => 'Refresh';

  @override
  String get register => 'Register';

  @override
  String get registrationDate => 'Registration Date';

  @override
  String get removePhoto => 'Remove Photo';

  @override
  String get reports => 'Reports';

  @override
  String get requiredField => 'This field is required';

  @override
  String get reset => 'Reset';

  @override
  String get retry => 'Retry';

  @override
  String get sameAsOldPassword =>
      'New password cannot be the same as old password';

  @override
  String get save => 'Save';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get saveMedicalHistory => 'Save Medical History';

  @override
  String get savePrescription => 'Save Prescription';

  @override
  String get scanForMedicalProfile => 'Scan for Medical Profile';

  @override
  String get scheduleAppointment => 'Schedule Appointment';

  @override
  String scheduledFor(String time) {
    return 'Scheduled for $time';
  }

  @override
  String get search => 'Search';

  @override
  String get searchPatients => 'Search patients...';

  @override
  String get seeHistory => 'See History';

  @override
  String get selectBloodType => 'Select Blood Type';

  @override
  String get selectDate => 'Select Date';

  @override
  String get selectGender => 'Select Gender';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get selectUserType => 'Select User Type';

  @override
  String get serverDownMessage =>
      'The server is currently unreachable. Please check your connection or try again later.';

  @override
  String get serverError => 'Server error';

  @override
  String get settings => 'Settings';

  @override
  String get somethingWentWrong =>
      'An unexpected error occurred. Please try again.';

  @override
  String get sort => 'Sort';

  @override
  String get specialInstructions => 'Special Instructions (Optional)';

  @override
  String get specialization => 'Specialization';

  @override
  String get statistics => 'Statistics';

  @override
  String get status => 'Status';

  @override
  String stepProgress(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get submit => 'Submit';

  @override
  String get success => 'Success';

  @override
  String get successCreateRecord => 'Medical record created successfully';

  @override
  String get surgeonName => 'Surgeon Name';

  @override
  String get surgeriesHint => 'List previous surgical procedures';

  @override
  String get surgery => 'Surgery';

  @override
  String get surgeryDate => 'Date';

  @override
  String get surgicalHistory => 'Surgical History';

  @override
  String get symptoms => 'Symptoms';

  @override
  String get takeMedicine => 'Take Medicine';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get themeDescription => 'Switch between dark and light theme';

  @override
  String get thisMonth => 'This Month';

  @override
  String get thisWeek => 'This Week';

  @override
  String get to => 'To';

  @override
  String get today => 'Today';

  @override
  String get todayVisits => 'Today\'s Visits';

  @override
  String get todaysMedicine => 'Today\'s Medicine';

  @override
  String get todaysSchedule => 'Today\'s Schedule';

  @override
  String get totalPatients => 'Total Patients';

  @override
  String get totalPrescriptions => 'total Prescriptions';

  @override
  String get treatment => 'Treatment';

  @override
  String get treatmentDetails => 'Treatment Details';

  @override
  String get upcomingAppointments => 'Upcoming Appointments';

  @override
  String get upcomingVisits => 'Upcoming Doctor Visits';

  @override
  String get update => 'Update';

  @override
  String get updatePassword => 'Update Password';

  @override
  String get useFingerprint => 'Use Fingerprint';

  @override
  String get userType => 'User Type';

  @override
  String get usesRecreationalDrugs => 'Uses Recreational Drugs';

  @override
  String get vaccination => 'Vaccination';

  @override
  String get vaccinationHistory => 'Vaccination History';

  @override
  String get vaccineName => 'Vaccine Name';

  @override
  String get view => 'View';

  @override
  String get viewAll => 'View All';

  @override
  String get viewAllPatients => 'View All Patients';

  @override
  String get viewDetailedReport => 'View Detailed Report';

  @override
  String get viewMedicalHistory => 'View Medical History';

  @override
  String get visits => 'Visits';

  @override
  String get vitalStatistics => 'Vital Statistics';

  @override
  String get weight => 'Weight';

  @override
  String get weightUnit => 'kg';

  @override
  String welcome(String name) {
    return 'Welcome, $name';
  }

  @override
  String get womensHealth => 'Women\'s Health';

  @override
  String get yes => 'Yes';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get professionalInfo => 'Professional Details';

  @override
  String get checkInteraction => 'Check Interactions';
}
