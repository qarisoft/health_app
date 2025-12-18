// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'الرعاية الصحية';

  @override
  String get loginTitle => 'مرحبًا بعودتك';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordConfirmation => 'تاكيد كلمة المرور';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get biometricAuth => 'المصادقة البيومترية';

  @override
  String get useFingerprint => 'استخدام بصمة الإصبع';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح!';

  @override
  String get loginFailed => 'فشل تسجيل الدخول. يرجى المحاولة مرة أخرى.';

  @override
  String get invalidCredentials => 'رقم الهاتف أو كلمة المرور غير صحيحة';

  @override
  String welcome(String name) {
    return 'مرحبًا، $name';
  }

  @override
  String get medicalHistory => 'السجل الطبي';

  @override
  String get todaysMedicine => 'أدوية اليوم';

  @override
  String get upcomingVisits => 'زيارات الطبيب القادمة';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get takeMedicine => 'تناول الدواء';

  @override
  String get medicineTaken => 'تم تناول الدواء';

  @override
  String get confirmVisit => 'تأكيد الزيارة';

  @override
  String scheduledFor(String time) {
    return 'مجدولة لـ $time';
  }

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get save => 'حفظ';

  @override
  String get edit => 'تعديل';

  @override
  String get delete => 'حذف';

  @override
  String get settings => 'الإعدادات';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get noMedicalHistory => 'لا يوجد سجل طبي متاح';

  @override
  String get noMedicineScheduled => 'لا توجد أدوية مجدولة لهذا اليوم';

  @override
  String get noUpcomingVisits => 'لا توجد زيارات طبيب قادمة';

  @override
  String get name => 'الاسم';

  @override
  String get register => 'تسجيل';

  @override
  String get createAccount => 'انشاء حساب';

  @override
  String get userType => 'نوع المستخدم';

  @override
  String get selectUserType => 'اختر نوع المستخدم';

  @override
  String get patient => 'مريض';

  @override
  String get pharmacist => 'صيدلي';

  @override
  String get doctor => 'طبيب';

  @override
  String get admin => 'مدير';

  @override
  String get idCardNumber => 'رقم الهويه';

  @override
  String get personalInformation => 'المعلومات الشخصية';

  @override
  String get medicalInformation => 'المعلومات الطبية';

  @override
  String get additionalNotes => 'ملاحظات إضافية';

  @override
  String get contactInformation => 'معلومات الاتصال';

  @override
  String get emergencyContact => 'جهة الاتصال في حالات الطوارئ';

  @override
  String get vitalStatistics => 'الإحصائيات الحيوية';

  @override
  String get lifestyle => 'نمط الحياة';

  @override
  String get familyMedicalHistory => 'التاريخ الطبي العائلي';

  @override
  String get surgicalHistory => 'التاريخ الجراحي';

  @override
  String get vaccinationHistory => 'تاريخ التطعيم';

  @override
  String get mentalHealth => 'الصحة النفسية';

  @override
  String get womensHealth => 'صحة المرأة';

  @override
  String get patientName => 'اسم المريض';

  @override
  String get dateOfBirth => 'تاريخ الميلاد';

  @override
  String get gender => 'الجنس';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get other => 'آخر';

  @override
  String get preferNotToSay => 'أفضل عدم الإفصاح';

  @override
  String get age => 'العمر';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get address => 'العنوان';

  @override
  String get emergencyContactName => 'اسم جهة الاتصال في حالات الطوارئ';

  @override
  String get emergencyContactPhone => 'هاتف جهة الاتصال في حالات الطوارئ';

  @override
  String get emergencyContactRelationship => 'العلاقة';

  @override
  String get height => 'الطول';

  @override
  String get heightUnit => 'سم';

  @override
  String get weight => 'الوزن';

  @override
  String get weightUnit => 'كجم';

  @override
  String get bloodType => 'فصيلة الدم';

  @override
  String get bmi => 'مؤشر كتلة الجسم';

  @override
  String get isSmoker => 'مدخن';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get cigarettesPerDay => 'عدد السجائر يومياً';

  @override
  String get isAlcoholConsumer => 'يتناول الكحول';

  @override
  String get alcoholFrequency => 'تكرار تناول الكحول';

  @override
  String get usesRecreationalDrugs => 'يتناول مخدرات ترفيهية';

  @override
  String get recreationalDrugsDetails => 'تفاصيل المخدرات الترفيهية';

  @override
  String get exerciseFrequency => 'تكرار التمرين';

  @override
  String get dietaryPreferences => 'التفضيلات الغذائية';

  @override
  String get chronicConditions => 'الأمراض المزمنة';

  @override
  String get chronicConditionsHint => 'أدخل الأمراض المزمنة (مفصولة بفاصلة)';

  @override
  String get allergies => 'الحساسيات';

  @override
  String get allergiesHint => 'اذكر أي حساسيات (مثل البنسلين، الفول السوداني)';

  @override
  String get currentMedications => 'الأدوية الحالية';

  @override
  String get currentMedicationsHint => 'أدخل الأدوية الحالية (مفصولة بفاصلة)';

  @override
  String get pastMedications => 'الأدوية السابقة';

  @override
  String get pastMedicationsHint => 'أدخل الأدوية السابقة (مفصولة بفاصلة)';

  @override
  String get procedureName => 'اسم الإجراء';

  @override
  String get surgeryDate => 'التاريخ';

  @override
  String get hospitalName => 'اسم المستشفى';

  @override
  String get surgeonName => 'اسم الجراح';

  @override
  String get complications => 'المضاعفات';

  @override
  String get admissionDate => 'تاريخ الدخول';

  @override
  String get dischargeDate => 'تاريخ الخروج';

  @override
  String get hospitalizationReason => 'السبب';

  @override
  String get treatmentDetails => 'تفاصيل العلاج';

  @override
  String get vaccineName => 'اسم اللقاح';

  @override
  String get dateAdministered => 'تاريخ التطعيم';

  @override
  String get expirationDate => 'تاريخ الانتهاء';

  @override
  String get administeringFacility => 'المنشأة المقدمة';

  @override
  String get lotNumber => 'رقم الدفعة';

  @override
  String get lastMenstrualPeriod => 'آخر دورة شهرية';

  @override
  String get isPregnant => 'حامل';

  @override
  String get pregnancies => 'عدد مرات الحمل';

  @override
  String get liveBirths => 'الولادات الحية';

  @override
  String get mentalHealthConditions => 'حالات الصحة النفسية';

  @override
  String get currentTherapist => 'المعالج الحالي';

  @override
  String get lastUpdated => 'آخر تحديث';

  @override
  String get createdAt => 'تم الإنشاء في';

  @override
  String get saveMedicalHistory => 'حفظ السجل الطبي';

  @override
  String get editMedicalHistory => 'تعديل التاريخ الطبي';

  @override
  String get createMedicalHistory => 'إنشاء سجل طبي';

  @override
  String get medicalHistorySaved => 'تم حفظ السجل الطبي بنجاح';

  @override
  String get noMedicalHistoryFound => 'لم يتم العثور على سجل طبي';

  @override
  String get requiredField => 'هذا الحقل مطلوب';

  @override
  String get invalidHeight => 'الرجاء إدخال طول صحيح (1-300 سم)';

  @override
  String get invalidWeight => 'الرجاء إدخال وزن صحيح (1-500 كجم)';

  @override
  String get invalidPhone => 'الرجاء إدخال رقم هاتف صحيح';

  @override
  String get surgery => 'عملية جراحية';

  @override
  String get hospitalization => 'الإقامة في المستشفى';

  @override
  String get vaccination => 'تطعيم';

  @override
  String get addSurgery => 'إضافة عملية جراحية';

  @override
  String get addHospitalization => 'إضافة إقامة في المستشفى';

  @override
  String get addVaccination => 'إضافة تطعيم';

  @override
  String get addCondition => 'إضافة حالة';

  @override
  String get viewMedicalHistory => 'عرض التاريخ الطبي';

  @override
  String get chronicDiseases => 'الأمراض المزمنة';

  @override
  String get chronicDiseasesHint =>
      'اذكر الأمراض المزمنة (مثل السكري، ارتفاع الضغط)';

  @override
  String get previousSurgeries => 'العمليات الجراحية السابقة';

  @override
  String get surgeriesHint => 'اذكر العمليات الجراحية السابقة';

  @override
  String get familyHistory => 'التاريخ العائلي';

  @override
  String get familyHistoryHint => 'التاريخ الطبي العائلي المهم';

  @override
  String get notes => 'ملاحظات إضافية';

  @override
  String get additionalNotesHint => 'أي معلومات طبية أخرى ذات صلة';

  @override
  String get medicationsHint => 'اذكر الأدوية الحالية والجرعات';

  @override
  String get bloodTypeA => 'A';

  @override
  String get bloodTypeB => 'B';

  @override
  String get bloodTypeAB => 'AB';

  @override
  String get bloodTypeO => 'O';

  @override
  String get selectBloodType => 'اختر فصيلة الدم';

  @override
  String get additionalInformation => 'معلومات إضافية';

  @override
  String get home => 'الرئيسية';

  @override
  String get patients => 'المرضى';

  @override
  String get addPatient => 'إضافة مريض';

  @override
  String get editPatient => 'تعديل بيانات المريض';

  @override
  String get patientDetails => 'تفاصيل المريض';

  @override
  String get searchPatients => 'ابحث عن المرضى...';

  @override
  String get noPatientsFound => 'لم يتم العثور على مرضى';

  @override
  String get totalPatients => 'إجمالي المرضى';

  @override
  String get activePatients => 'المرضى النشطين';

  @override
  String get inactivePatients => 'المرضى غير النشطين';

  @override
  String get todayVisits => 'زيارات اليوم';

  @override
  String get nationalId => 'رقم الهوية';

  @override
  String get status => 'الحالة';

  @override
  String get active => 'نشط';

  @override
  String get inactive => 'غير نشط';

  @override
  String get actions => 'الإجراءات';

  @override
  String get view => 'عرض';

  @override
  String get confirmDelete => 'تأكيد الحذف';

  @override
  String get deletePatientMessage => 'هل أنت متأكد من حذف هذا المريض؟';

  @override
  String get patientDeleted => 'تم حذف المريض بنجاح';

  @override
  String get patientAdded => 'تم إضافة المريض بنجاح';

  @override
  String get patientUpdated => 'تم تحديث بيانات المريض بنجاح';

  @override
  String get add => 'إضافة';

  @override
  String get update => 'تحديث';

  @override
  String get ok => 'موافق';

  @override
  String get selectGender => 'اختر الجنس';

  @override
  String get enterNotes => 'أدخل الملاحظات...';

  @override
  String get invalidNationalId => 'الرجاء إدخال رقم هوية صحيح';

  @override
  String get invalidEmail => 'الرجاء إدخال بريد إلكتروني صحيح';

  @override
  String get statistics => 'الإحصائيات';

  @override
  String get recentPatients => 'المرضى الحديثين';

  @override
  String get viewAllPatients => 'عرض جميع المرضى';

  @override
  String get quickActions => 'إجراءات سريعة';

  @override
  String get addNewPatient => 'إضافة مريض جديد';

  @override
  String get scheduleAppointment => 'جدولة موعد';

  @override
  String get prescribeMedication => 'وصف دواء';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get appointments => 'المواعيد';

  @override
  String get medications => 'الأدوية';

  @override
  String get reports => 'التقارير';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get todaysSchedule => 'جدول اليوم';

  @override
  String get upcomingAppointments => 'المواعيد القادمة';

  @override
  String get completed => 'مكتمل';

  @override
  String get pending => 'قيد الانتظار';

  @override
  String get cancelled => 'ملغى';

  @override
  String get clearSearch => 'مسح البحث';

  @override
  String get refresh => 'تحديث';

  @override
  String get done => 'تم';

  @override
  String get selectDate => 'اختر تاريخ';

  @override
  String get patientId => 'رقم المريض';

  @override
  String get registrationDate => 'تاريخ التسجيل';

  @override
  String get lastVisit => 'آخر زيارة';

  @override
  String get medicalRecord => 'السجل الطبي';

  @override
  String get prescriptions => 'الوصفات';

  @override
  String get labResults => 'نتائج المختبر';

  @override
  String get insuranceInfo => 'معلومات التأمين';

  @override
  String get attachments => 'المرفقات';

  @override
  String get exportData => 'تصدير البيانات';

  @override
  String get print => 'طباعة';

  @override
  String get filter => 'تصفية';

  @override
  String get sort => 'ترتيب';

  @override
  String get byName => 'حسب الاسم';

  @override
  String get byDate => 'حسب التاريخ';

  @override
  String get byStatus => 'حسب الحالة';

  @override
  String get ascending => 'تصاعدي';

  @override
  String get descending => 'تنازلي';

  @override
  String get allStatus => 'جميع الحالات';

  @override
  String get activeOnly => 'النشطين فقط';

  @override
  String get inactiveOnly => 'غير النشطين فقط';

  @override
  String get today => 'اليوم';

  @override
  String get thisWeek => 'هذا الأسبوع';

  @override
  String get thisMonth => 'هذا الشهر';

  @override
  String get customRange => 'مدى مخصص';

  @override
  String get from => 'من';

  @override
  String get to => 'إلى';

  @override
  String get apply => 'تطبيق';

  @override
  String get reset => 'إعادة تعيين';
}
