// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get failedToLoadFromServer => 'فشل الاتصال بالسرفر';

  @override
  String get unexpectedError => 'حدث خطأ غير متوقع.';

  @override
  String get medicalProfile => 'الملف الطبي';

  @override
  String get vitalsAndPhysical => 'العلامات الحيوية والبدنية';

  @override
  String get genderMale => 'ذكر';

  @override
  String get genderFemale => 'أنثى';

  @override
  String get addAllergy => 'إضافة حساسية';

  @override
  String get addDisease => 'إضافة مرض';

  @override
  String get addMedication => 'إضافة دواء';

  @override
  String get description => 'الوصف';

  @override
  String get instructions => 'التعليمات';

  @override
  String get severity => 'الخطورة';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get failedToLoadRecords => 'فشل في تحميل السجلات';

  @override
  String get noMedicalRecordsFound => 'لم يتم العثور على سجلات طبية.';

  @override
  String get recordsWillAppearHere => 'عند زيارتك للطبيب، ستظهر السجلات هنا.';

  @override
  String get generalConsultation => 'استشارة عامة';

  @override
  String get noDiagnosisListed => 'لا يوجد تشخيص مدرج';

  @override
  String get dr => 'د.';

  @override
  String get doctorNotes => 'ملاحظات الطبيب';

  @override
  String get recordId => 'رقم السجل';

  @override
  String get created => 'تاريخ الإنشاء';

  @override
  String get steps => 'خطوات';

  @override
  String get water => 'ماء';

  @override
  String get sleep => 'نوم';

  @override
  String get step => 'خطوة';

  @override
  String get l => 'لتر';

  @override
  String get hours => 'ساعات';

  @override
  String get na => 'غير متوفر';

  @override
  String get emailAddress => 'البريد الإلكتروني';

  @override
  String get pleaseEnterValue => 'الرجاء إدخال قيمة';

  @override
  String get updateSuccessful => 'تم تحديث الملف الشخصي بنجاح!';

  @override
  String get genderOther => 'أخرى';

  @override
  String dob(String date, String gender) {
    return 'تاريخ الميلاد: $date ($gender)';
  }

  @override
  String lastUpdated2(String date) {
    return 'آخر تحديث: $date';
  }

  @override
  String get notProvided => 'غير متوفر';

  @override
  String patientId2(int id, int userId) {
    return 'رقم المريض: $id • رقم المستخدم: $userId';
  }

  @override
  String profileCreated(String date) {
    return 'تم إنشاء الملف: $date';
  }

  @override
  String get unknown => 'غير معروف';

  @override
  String get blood => 'الدم';

  @override
  String weightValue(int weight) {
    return '$weight كجم';
  }

  @override
  String heightValue(int height) {
    return '$height سم';
  }

  @override
  String get notApplicable => 'غير متاح';

  @override
  String get noAllergiesRecorded => 'لا توجد حساسية مسجلة';

  @override
  String reaction2(Object reaction) {
    return 'التفاعل: $reaction';
  }

  @override
  String get noChronicDiseasesRecorded => 'لا توجد أمراض مزمنة مسجلة';

  @override
  String diagnosed(String date) {
    return 'تاريخ التشخيص: $date';
  }

  @override
  String get noSurgeriesRecorded => 'لا توجد عمليات جراحية مسجلة';

  @override
  String hospital(String hospital) {
    return 'المستشفى: $hospital';
  }

  @override
  String surgeon(String surgeon) {
    return 'الجراح: $surgeon';
  }

  @override
  String get noCurrentMedications => 'لا توجد أدوية حالية';

  @override
  String medicationDosage(String dosage, String frequency) {
    return '$dosage - $frequency';
  }

  @override
  String get loadingProfileData => 'جاري تحميل بيانات الملف...';

  @override
  String get oopsSomethingWentWrong => 'عفواً! حدث خطأ ما.';

  @override
  String get surgeries => 'العمليات الجراحية';

  @override
  String get aboutApp => 'عن التطبيق';

  @override
  String get actions => 'الإجراءات';

  @override
  String get active => 'نشط';

  @override
  String get activeOnly => 'النشطين فقط';

  @override
  String get activePatients => 'المرضى النشطين';

  @override
  String get activePrescriptions => 'احدث الوصفات';

  @override
  String get add => 'إضافة';

  @override
  String get addCondition => 'إضافة حالة';

  @override
  String get addHealthData => 'إضافة بيانات صحية';

  @override
  String get addHospitalization => 'إضافة إقامة في المستشفى';

  @override
  String get addNewMedication => 'إضافة دواء جديد';

  @override
  String get addNewPatient => 'إضافة مريض جديد';

  @override
  String get addPatient => 'إضافة مريض';

  @override
  String get addPrescription => 'إضافة وصفة طبية';

  @override
  String get addSurgery => 'إضافة عملية جراحية';

  @override
  String get addToList => 'إضافة إلى القائمة';

  @override
  String get addVaccination => 'إضافة تطعيم';

  @override
  String get additionalInformation => 'معلومات إضافية';

  @override
  String get additionalNotes => 'ملاحظات إضافية';

  @override
  String get additionalNotesHint => 'أي معلومات طبية أخرى ذات صلة';

  @override
  String get address => 'العنوان';

  @override
  String get admin => 'مدير';

  @override
  String get administeringFacility => 'المنشأة المقدمة';

  @override
  String get admissionDate => 'تاريخ الدخول';

  @override
  String get age => 'العمر';

  @override
  String get alcoholFrequency => 'تكرار تناول الكحول';

  @override
  String get allStatus => 'جميع الحالات';

  @override
  String get allergenName => 'اسم المادة المسببة للحساسية';

  @override
  String get allergies => 'الحساسيات';

  @override
  String get allergiesHint => 'اذكر أي حساسيات ( البنسلين، الفول السوداني)';

  @override
  String get allergySeverity => 'شدة الحساسية';

  @override
  String get appTitle => 'الرعاية الصحية';

  @override
  String get apply => 'تطبيق';

  @override
  String get appointments => 'المواعيد';

  @override
  String get ascending => 'تصاعدي';

  @override
  String get attachments => 'المرفقات';

  @override
  String get biometricAuth => 'المصادقة البيومترية';

  @override
  String get bloodType => 'فصيلة الدم';

  @override
  String get bloodTypeA => 'A';

  @override
  String get bloodTypeAB => 'AB';

  @override
  String get bloodTypeB => 'B';

  @override
  String get bloodTypeO => 'O';

  @override
  String get bmi => 'مؤشر كتلة الجسم';

  @override
  String get byDate => 'حسب التاريخ';

  @override
  String get byName => 'حسب الاسم';

  @override
  String get byStatus => 'حسب الحالة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get canceled => 'ملغية';

  @override
  String get cancelled => 'ملغى';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get changePasswordInstruction =>
      'يرجى إدخال كلمة المرور الحالية واختيار كلمة مرور جديدة قوية.';

  @override
  String get changesSavedSuccessfully => 'تم حفظ التغييرات بنجاح';

  @override
  String get chooseFromGallery => 'اختر من المعرض';

  @override
  String get chronicConditions => 'الأمراض المزمنة';

  @override
  String get chronicConditionsHint => 'أدخل الأمراض المزمنة (مفصولة بفاصلة)';

  @override
  String get chronicDiseases => 'الأمراض المزمنة';

  @override
  String get chronicDiseasesHint =>
      'اذكر الأمراض المزمنة ( السكري، ارتفاع الضغط)';

  @override
  String get cigarettesPerDay => 'عدد السجائر يومياً';

  @override
  String get clearSearch => 'مسح البحث';

  @override
  String get collapseAll => 'طي الكل';

  @override
  String get completed => 'مكتمل';

  @override
  String get complications => 'المضاعفات';

  @override
  String get confirm => 'تأكيد';

  @override
  String get confirmDelete => 'تأكيد الحذف';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get confirmVisit => 'تأكيد الزيارة';

  @override
  String get connecting => 'جاري الاتصال بالخادم الآمن...';

  @override
  String get connectionError =>
      'حدث خطأ أثناء الاتصال. يرجى التحقق من الإنترنت.';

  @override
  String get contactInformation => 'معلومات الاتصال';

  @override
  String get create => 'إنشاء';

  @override
  String get createAccount => 'انشاء حساب';

  @override
  String get createMedicalHistory => 'إنشاء سجل طبي';

  @override
  String get createMedicalRecordStep => 'إنشاء سجل طبي - خطوة';

  @override
  String get createNewPrescription => 'إنشاء وصفة طبية جديدة';

  @override
  String get createNewRecord => 'إنشاء سجل جديد';

  @override
  String get createPrescription => 'إنشاء وصفة طبية';

  @override
  String get createProfile => 'إنشاء الملف الشخصي';

  @override
  String get createdAt => 'تم الإنشاء في';

  @override
  String get currentMedications => 'الأدوية الحالية';

  @override
  String get currentMedicationsHint => 'أدخل الأدوية الحالية (مفصولة بفاصلة)';

  @override
  String get currentTherapist => 'المعالج الحالي';

  @override
  String get customRange => 'مدى مخصص';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get dataTooLargeQr => 'البيانات كبيرة جداً لرمز QR';

  @override
  String get dateAdministered => 'تاريخ التطعيم';

  @override
  String get dateOfBirth => 'تاريخ الميلاد';

  @override
  String get delete => 'حذف';

  @override
  String get deletePatientMessage => 'هل أنت متأكد من حذف هذا المريض؟';

  @override
  String get descending => 'تنازلي';

  @override
  String get diagnosis => 'التشخيص';

  @override
  String get diagnosisLabel => 'التشخيص:';

  @override
  String get dietaryPreferences => 'التفضيلات الغذائية';

  @override
  String get dischargeDate => 'تاريخ الخروج';

  @override
  String get dispense => 'صرف';

  @override
  String get dispensed => 'مصروفة';

  @override
  String get doctor => 'طبيب';

  @override
  String get doctors => 'الأطباء';

  @override
  String get done => 'تم';

  @override
  String get dosage => 'الجرعة';

  @override
  String get dosageHint => ' ٥٠٠ ملجم';

  @override
  String get drugName => 'اسم الدواء';

  @override
  String get duration => 'المدة';

  @override
  String get durationHint => ' ٧ أيام';

  @override
  String get edit => 'تعديل';

  @override
  String get editMedicalHistory => 'تعديل التاريخ الطبي';

  @override
  String get editPatient => 'تعديل بيانات المريض';

  @override
  String get editPrescription => 'تعديل الوصفة';

  @override
  String get editProfile => 'تعديل البروفايل';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emergencyContact => 'جهة الاتصال في حالات الطوارئ';

  @override
  String get emergencyContactName => 'اسم جهة الاتصال في حالات الطوارئ';

  @override
  String get emergencyContactPhone => 'هاتف جهة الاتصال في حالات الطوارئ';

  @override
  String get emergencyContactRelationship => 'العلاقة';

  @override
  String get emergencyInfo => 'معلومات الطوارئ';

  @override
  String get emergencyPage => 'الطوارئ';

  @override
  String get emptyTapToAdd => 'فارغ • اضغط لإضافة تفاصيل';

  @override
  String get enterDiagnosisHint => 'صف حالة المريض...';

  @override
  String get enterNotes => 'أدخل الملاحظات...';

  @override
  String get enterPassword => 'Please enter password';

  @override
  String get enterSymptomsHint => 'ما هي الأعراض التي تظهر على المريض؟';

  @override
  String get enterTreatmentHint => 'حدد خطة العلاج الموصى بها...';

  @override
  String get error => 'حدث خطأ';

  @override
  String errorCreateRecord(String msg) {
    return 'خطأ: $msg';
  }

  @override
  String get errorPickingFile => 'Error picking file';

  @override
  String get exerciseFrequency => 'تكرار التمرين';

  @override
  String get expandAll => 'توسيع الكل';

  @override
  String get expandCollapseAll => 'توسيع/طي الكل';

  @override
  String get expirationDate => 'تاريخ الانتهاء';

  @override
  String get exportData => 'تصدير البيانات';

  @override
  String get failedToLoadDashboard => 'فشل تحميل لوحة التحكم';

  @override
  String get failedToLoadEmergencyData => 'فشل تحميل بيانات الطوارئ.';

  @override
  String get failedToLoadImage => 'فشل تحميل الصورة';

  @override
  String get familyHistory => 'التاريخ العائلي';

  @override
  String get familyHistoryHint => 'التاريخ الطبي العائلي المهم';

  @override
  String get familyMedicalHistory => 'التاريخ الطبي العائلي';

  @override
  String get female => 'أنثى';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String get filter => 'تصفية';

  @override
  String get findPatient => 'البحث عن مريض';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get formInvalid => 'النموذج غير صالح';

  @override
  String get frequency => 'التكرار';

  @override
  String get frequencyHint => ' مرتين يومياً';

  @override
  String get from => 'من';

  @override
  String get gender => 'الجنس';

  @override
  String get goodAfternoon => 'طاب مساؤك،';

  @override
  String get goodEvening => 'مساء الخير،';

  @override
  String get goodMorning => 'صباح الخير،';

  @override
  String get healthSummary => 'ملخص الصحة';

  @override
  String get height => 'الطول';

  @override
  String get heightUnit => 'سم';

  @override
  String get home => 'الرئيسية';

  @override
  String get hospitalName => 'اسم المستشفى';

  @override
  String get hospitalization => 'الإقامة في المستشفى';

  @override
  String get hospitalizationReason => 'السبب';

  @override
  String get idCardNumber => 'رقم الهويه';

  @override
  String get identifier => 'المعرف';

  @override
  String get inReview => 'تحت المراجعة';

  @override
  String get inactive => 'غير نشط';

  @override
  String get inactiveOnly => 'غير النشطين فقط';

  @override
  String get inactivePatients => 'المرضى غير النشطين';

  @override
  String get inactivePrescriptions => 'inactive Prescriptions';

  @override
  String get incompleteTapToEdit => 'غير مكتمل • اضغط للتعديل';

  @override
  String get insuranceInfo => 'معلومات التأمين';

  @override
  String get invalidCredentials => 'رقم الهاتف أو كلمة المرور غير صحيحة';

  @override
  String get invalidDate => 'You must enter a valid date';

  @override
  String get invalidEmail => 'الرجاء إدخال بريد إلكتروني صحيح';

  @override
  String get invalidHeight => 'الرجاء إدخال طول صحيح (1-300 سم)';

  @override
  String get invalidImageData => 'بيانات صورة غير صالحة';

  @override
  String get invalidNationalId => 'الرجاء إدخال رقم هوية صحيح';

  @override
  String get invalidPhone => 'الرجاء إدخال رقم هاتف صحيح';

  @override
  String get invalidWeight => 'الرجاء إدخال وزن صحيح (1-500 كجم)';

  @override
  String get isAlcoholConsumer => 'يتناول الكحول';

  @override
  String get isPregnant => 'حامل';

  @override
  String get isSmoker => 'مدخن';

  @override
  String itemsCompleted(int completed, int total) {
    return 'تم إكمال $completed من $total';
  }

  @override
  String get itemsCompleted0 => 'تم إكمال  من ';

  @override
  String get labResults => 'نتائج المختبر';

  @override
  String get language => 'اللغة';

  @override
  String get lastMenstrualPeriod => 'آخر دورة شهرية';

  @override
  String get lastUpdated => 'آخر تحديث';

  @override
  String get lastVisit => 'آخر زيارة';

  @override
  String get latestDiagnosis => 'أحدث تشخيص';

  @override
  String get licenseNumber => 'رقم الترخيص';

  @override
  String get lifestyle => 'نمط الحياة';

  @override
  String get liveBirths => 'الولادات الحية';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get loginAsPatient => 'تسجيل الدخول كمريض';

  @override
  String get loginDescription =>
      'سجل الدخول أو أنشئ حسابًا لمزامنة بياناتك عبر جميع أجهزتك.';

  @override
  String get loginFailed => 'فشل تسجيل الدخول. يرجى المحاولة مرة أخرى.';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح!';

  @override
  String get loginTitle => 'مرحبًا بعودتك';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logoutConfirmation => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get lotNumber => 'رقم الدفعة';

  @override
  String get male => 'ذكر';

  @override
  String get medicalHistory => 'السجل الطبي';

  @override
  String get medicalHistorySaved => 'تم حفظ السجل الطبي بنجاح';

  @override
  String get medicalInformation => 'المعلومات الطبية';

  @override
  String get medicalRecord => 'السجل الطبي';

  @override
  String get medicalRecords => 'السجلات الطبية';

  @override
  String get medicationPlan => 'خطة العلاج';

  @override
  String get medications => 'الأدوية';

  @override
  String get medicationsHint => 'اذكر الأدوية الحالية والجرعات';

  @override
  String get medicationsLabel => 'الأدوية:';

  @override
  String get medicineName => 'اسم الدواء';

  @override
  String get medicineTaken => 'تم تناول الدواء';

  @override
  String get mentalHealth => 'الصحة النفسية';

  @override
  String get mentalHealthConditions => 'حالات الصحة النفسية';

  @override
  String get myPrescriptions => 'وصفاتي الطبية';

  @override
  String get name => 'الاسم';

  @override
  String get nationalId => 'رقم الهوية';

  @override
  String get needConsultation => 'تحتاج الى استشارة';

  @override
  String get newMedication => 'دواء جديد';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get newPrescription => 'وصفة جديدة';

  @override
  String get next => 'التالي';

  @override
  String get no => 'لا';

  @override
  String get noDashboardData => 'لا توجد بيانات لوحة تحكم متاحة.';

  @override
  String get noMedicalHistory => 'لا يوجد سجل طبي متاح';

  @override
  String get noMedicalHistoryFound => 'لم يتم العثور على سجل طبي';

  @override
  String get noMedicalRecords => 'لا توجد سجلات طبية';

  @override
  String get noMedicalRecordsDescription =>
      'لا توجد سجلات في النظام. ابحث عن مريض للبدء.';

  @override
  String get noMedicineScheduled => 'لا توجد أدوية مجدولة لهذا اليوم';

  @override
  String get noPatientsFound => 'لم يتم العثور على مرضى';

  @override
  String get noPrescriptions => 'لا توجد وصفات طبية';

  @override
  String get noPrescriptionsDescription =>
      'يبدو أنك لم تقم بإضافة أي وصفات طبية بعد. ابدأ بإنشاء وصفتك الأولى.';

  @override
  String get noUpcomingVisits => 'لا توجد زيارات طبيب قادمة';

  @override
  String get notSpecified => 'غير محدد';

  @override
  String get notes => 'ملاحظات';

  @override
  String get notifications => 'اشعارات';

  @override
  String get notificationsDescription => 'تفعيل أو تعطيل التنبيهات';

  @override
  String get ok => 'موافق';

  @override
  String get oldPassword => 'كلمة المرور الحالية';

  @override
  String get other => 'آخر';

  @override
  String get overview => 'نظرة عامة';

  @override
  String get partialDispensed => 'صرفت جزئيا';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordChangedSuccessfully =>
      'تم تحديث كلمة المرور الخاصة بك بنجاح.';

  @override
  String get passwordConfirmation => 'تاكيد كلمة المرور';

  @override
  String get passwordTooShort => 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get pastMedications => 'الأدوية السابقة';

  @override
  String get pastMedicationsHint => 'أدخل الأدوية السابقة (مفصولة بفاصلة)';

  @override
  String get patient => 'مريض';

  @override
  String get patientAdded => 'تم إضافة المريض بنجاح';

  @override
  String get patientCode => 'الكود';

  @override
  String get patientDeleted => 'تم حذف المريض بنجاح';

  @override
  String get patientDetails => 'تفاصيل المريض';

  @override
  String get patientDigitalId => 'الهوية الرقمية للمريض';

  @override
  String get patientId => 'رقم المريض';

  @override
  String patientIdLabel(int id) {
    return 'رقم المريض: $id';
  }

  @override
  String get patientName => 'اسم المريض';

  @override
  String patientNotFound(String error) {
    return 'لم يتم العثور على المريض: $error';
  }

  @override
  String get patientPrescriptions => 'وصفات المريض';

  @override
  String get patientUpdated => 'تم تحديث بيانات المريض بنجاح';

  @override
  String get patients => 'المرضى';

  @override
  String get pending => 'قيد الانتظار';

  @override
  String get pendingPrescriptions => 'الوصفات (غير مصروفه)';

  @override
  String get personalInformation => 'المعلومات الشخصية';

  @override
  String get pharmacist => 'صيدلي';

  @override
  String get pharmacyName => 'اسم الصيدلية';

  @override
  String get phoneNumber => 'رقم الهاتف';

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
  String get preferNotToSay => 'أفضل عدم الإفصاح';

  @override
  String get pregnancies => 'عدد مرات الحمل';

  @override
  String get prescribeMedication => 'وصف دواء';

  @override
  String get prescriptionCreatedSuccess => 'تم إنشاء الوصفة بنجاح';

  @override
  String get prescriptions => 'الوصفات';

  @override
  String get previous => 'السابق';

  @override
  String get previousSurgeries => 'العمليات الجراحية السابقة';

  @override
  String get print => 'طباعة';

  @override
  String get privacyAndSecurity => 'الخصوصية والأمان';

  @override
  String get procedureName => 'اسم الإجراء';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get profilePage => 'البروفايل';

  @override
  String get quantity => 'الكمية';

  @override
  String get quickActions => 'إجراءات سريعة';

  @override
  String reaction(String reaction) {
    return 'رد الفعل';
  }

  @override
  String get readyToGetStarted => 'هل أنت مستعد للبدء؟';

  @override
  String get recentActivities => 'الأنشطة الأخيرة';

  @override
  String get recentPatients => 'المرضى الحديثين';

  @override
  String recordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سجل',
      many: '$count سجلاً',
      few: '$count سجلات',
      two: 'سجلان',
      one: 'سجل واحد',
      zero: 'لا توجد سجلات',
    );
    return '$_temp0';
  }

  @override
  String get recreationalDrugsDetails => 'تفاصيل المخدرات الترفيهية';

  @override
  String get refresh => 'تحديث';

  @override
  String get register => 'تسجيل';

  @override
  String get registrationDate => 'تاريخ التسجيل';

  @override
  String get removePhoto => 'إزالة الصورة';

  @override
  String get reports => 'التقارير';

  @override
  String get requiredField => 'هذا الحقل مطلوب';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get sameAsOldPassword =>
      'لا يمكن أن تكون كلمة المرور الجديدة مطابقة للقديمة';

  @override
  String get save => 'حفظ';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get saveMedicalHistory => 'حفظ السجل الطبي';

  @override
  String get savePrescription => 'حفظ الوصفة الطبية';

  @override
  String get scanForMedicalProfile => 'مسح للملف الطبي';

  @override
  String get scheduleAppointment => 'جدولة موعد';

  @override
  String scheduledFor(String time) {
    return 'مجدولة لـ $time';
  }

  @override
  String get search => 'بحث';

  @override
  String get searchPatients => 'ابحث عن المرضى...';

  @override
  String get seeHistory => 'عرض السجل';

  @override
  String get selectBloodType => 'اختر فصيلة الدم';

  @override
  String get selectDate => 'اختر تاريخ';

  @override
  String get selectGender => 'اختر الجنس';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get selectUserType => 'اختر نوع المستخدم';

  @override
  String get serverDownMessage =>
      'الخادم غير متوفر حالياً. يرجى التحقق من اتصالك أو المحاولة لاحقاً.';

  @override
  String get serverError => 'خطأ في الخادم';

  @override
  String get settings => 'الإعدادات';

  @override
  String get somethingWentWrong => 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';

  @override
  String get sort => 'ترتيب';

  @override
  String get specialInstructions => 'تعليمات خاصة (اختياري)';

  @override
  String get specialization => 'التخصص';

  @override
  String get statistics => 'الإحصائيات';

  @override
  String get status => 'الحالة';

  @override
  String stepProgress(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get submit => 'إرسال';

  @override
  String get success => 'تم بنجاح';

  @override
  String get successCreateRecord => 'تم إنشاء السجل الطبي بنجاح';

  @override
  String get surgeonName => 'اسم الجراح';

  @override
  String get surgeriesHint => 'اذكر العمليات الجراحية السابقة';

  @override
  String get surgery => 'عملية جراحية';

  @override
  String get surgeryDate => 'التاريخ';

  @override
  String get surgicalHistory => 'التاريخ الجراحي';

  @override
  String get symptoms => 'الأعراض';

  @override
  String get takeMedicine => 'تناول الدواء';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get themeDescription => 'التبديل بين المظهر الداكن والفاتح';

  @override
  String get thisMonth => 'هذا الشهر';

  @override
  String get thisWeek => 'هذا الأسبوع';

  @override
  String get to => 'إلى';

  @override
  String get today => 'اليوم';

  @override
  String get todayVisits => 'زيارات اليوم';

  @override
  String get todaysMedicine => 'أدوية اليوم';

  @override
  String get todaysSchedule => 'جدول اليوم';

  @override
  String get totalPatients => 'إجمالي المرضى';

  @override
  String get totalPrescriptions => 'الوصفات (الكل)';

  @override
  String get treatment => 'العلاج';

  @override
  String get treatmentDetails => 'تفاصيل العلاج';

  @override
  String get upcomingAppointments => 'المواعيد القادمة';

  @override
  String get upcomingVisits => 'زيارات الطبيب القادمة';

  @override
  String get update => 'تحديث';

  @override
  String get updatePassword => 'تحديث كلمة المرور';

  @override
  String get useFingerprint => 'استخدام بصمة الإصبع';

  @override
  String get userType => 'نوع المستخدم';

  @override
  String get usesRecreationalDrugs => 'يتناول مخدرات ترفيهية';

  @override
  String get vaccination => 'تطعيم';

  @override
  String get vaccinationHistory => 'تاريخ التطعيم';

  @override
  String get vaccineName => 'اسم اللقاح';

  @override
  String get view => 'عرض';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get viewAllPatients => 'عرض جميع المرضى';

  @override
  String get viewDetailedReport => 'عرض تقرير مفصل';

  @override
  String get viewMedicalHistory => 'عرض التاريخ الطبي';

  @override
  String get visits => 'الزيارات';

  @override
  String get vitalStatistics => 'الإحصائيات الحيوية';

  @override
  String get weight => 'الوزن';

  @override
  String get weightUnit => 'كجم';

  @override
  String welcome(String name) {
    return 'مرحبًا، $name';
  }

  @override
  String get womensHealth => 'صحة المرأة';

  @override
  String get yes => 'نعم';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get professionalInfo => 'التفاصيل المهنية';

  @override
  String get checkInteraction => 'فحص التفاعلات الدوائية';
}
