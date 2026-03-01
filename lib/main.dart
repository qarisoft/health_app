import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart' show accountProvider, di;
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/features/auth/data/usecases/login_usecase.dart'
    show LoginUsecaseImpl;
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/auth/ui/pages/register_page.dart';
import 'package:health_app/features/doctor/ui/home.dart' as doctor_pages;
import 'package:health_app/features/home/ui/pages/p.dart' as patient;
import 'package:health_app/features/patients/ui/home.dart'
    show MedicalHistoryPage;
import 'package:health_app/features/pharmacist/ui/home/page.dart'
    as pharmacist_page;
import 'package:health_app/l10n/app_localizations.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/api/api_service.dart';
import 'package:health_app/shared/api/dio_factory.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/providers/local/local_provider.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/ui/pages/login_page.dart';
// import 'features/home/presentation/pages/p.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(ProviderScope(child: const HealthCareApp()));
}

class HealthCareApp extends StatelessWidget {
  const HealthCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final LocalState local = ref.watch(localProvider);
        return MaterialApp(
          navigatorKey: AppDialog.navigatorKey,
          // title: 'HealthCare Pro',
          theme: AppTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(local.code),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,

          // initialRoute: AppRoutes.doctor,
          routes: {
            // AppRoutes.splash: (context) =>  P.MainPatientPage(),
            AppRoutes.splash: (context) => const SplashPage(),
            AppRoutes.login: (context) => const LoginPage(),
            AppRoutes.register: (context) => const RegisterPage(),
            //
            AppRoutes.patientMHistory: (context) => const MedicalHistoryPage(),
            AppRoutes.patientHome: (context) => const patient.MainPatientPage(),
            AppRoutes.doctorHome: (context) => const doctor_pages.HomePage(),
            AppRoutes.pharmacistHome: (context) =>
                const pharmacist_page.HomePage(),
          },
        );
      },
    );
  }
}

// njfdhjs84367467323hn98sd9s9mdsm8d9s79
// "v=DMARC1; p=none; rua=mailto:dc1298f39eb34d1abd26d597b47c0a51@dmarc-reports.cloudflare.net"
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(accountProvider);
    xlog('auth ${auth.toString()}');

    // auth.log('auth ');
    return auth.when(
      initial: () => LoginPage(),
      acount: (a) => a.when(
        patient: (p) => patient.HomePage(),
        doctor: (p) => const doctor_pages.HomePage(),
        pharmacist: (p) => const pharmacist_page.HomePage(),
        admin: (p) => patient.HomePage(),
      ),
    );
  }
}

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('admin')));
  }
}

class PharmacistHomePage extends StatelessWidget {
  const PharmacistHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('pharmacist')));
  }
}

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('doctor')));
  }
}

// final GetIt di = GetIt.instance;
Future<void> init() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  di.registerLazySingleton<AppStorage>(() => AppStorage(sharedPreferences));

  di.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  di.registerFactory<DioFactory>(() => DioFactory(di()));

  di.registerFactory<ApiService>(() => ApiService(di()));
  di.registerFactory<AppRepositories>(
    () => AppRepositories(api: di(), storage: di()),
  );

  di.registerFactory<LoginUsecase>(() => LoginUsecaseImpl(di()));
  // di.registerFactory<RegisterUsecase>(
  //   () => RegisterUsecaseImpl(dio: di(), storage: di()),
  // );
}



//   {
//          "success": true,
//          "message": "تم العثور على المريض بنجاح",
//          "patient": {
//              "id": 103,
//              "fullName": " سليم سرحان الطبيب",
//              "dateOfBirth": "2006-01-30T21:49:57.575",
//              "gender": 1,
//              "bloodType": 5,
//              "weight": 65.0,
//              "height": 165.0,
//              "emergencyContact": "Labeeb",
//              "emergencyPhone": "771878132",
//              "patientCode": null,
//              "allergies": [
//                 {
//                      "id": 1008,
//                      "patientId": 103,
//                      "allergenName": "البيض",
//                      "reaction": "طفح",
//                      "severity": "متوصط",
//                      "createdAt": "2026-01-30T21:54:58.1979489"
//                 }
//              ],
//              "chronicDiseases": [
//                 {
//                      "id": 1008,
//                      "patientId": 103,
//                      "diseaseName": "القلب",
//                      "description": "تضيق في الشرايين ",
//                      "diagnosisDate": "2023-05-30T21:49:57.575",
//                      "createdAt": "2026-01-30T21:54:58.2365139"
//                 }
//              ],
//              "surgeries": [
//                 {
//                      "id": 1005,
//                      "patientId": 103,
//                      "surgeryName": "الزائده الدودية",
//                      "description": "ملتهبة",
//                      "surgeryDate": "2024-08-30T21:49:57.576",
//                      "hospital": "الثورة",
//                      "surgeon": "د احمد علي",
//                      "createdAt": "2026-01-30T21:54:58.2651969"
//                 }
//              ],
//              "medicalRecords": [
//                 {
//                      "id": 1004,
//                      "patientId": 103,
//                      "doctorId": null,
//                      "diagnosis": "Initial Medical Profile",
//                      "notes": "تجربة اضافة ملف طبي كمريض للطبيب",
//                      "symptoms": null,
//                      "treatment": null,
//                      "recordDate": "2026-01-30T21:54:58.3191053",
//                      "createdAt": "2026-01-30T21:54:58.3191709",
//                      "doctorName": "string",
//                      "patientName": " سليم سرحان الطبيب"
//                 }
//              ],
//              "prescriptions": [
//                 {
//                      "id": 1015,
//                      "patientId": 103,
//                      "doctorId": 103,
//                      "diagnosis": "Current Medications (Patient Provided)",
//                      "notes": "Initialized from patient self profile",
//                      "status": 2,
//                      "prescriptionDate": "2026-01-30T21:54:58.6117588",
//                      "createdAt": "2026-01-30T21:54:58.6118218",
//                      "doctorName": "string",
//                      "patientName": " سليم سرحان الطبيب",
//                      "items": [
//                         {
//                              "id": 1011,
//                              "prescriptionId": 1015,
//                              "drugId": 0,
//                              "medicationName": "باندول",
//                              "dosage": "حبه",
//                              "frequency": "كل يومين",
//                              "duration": "شهرين",
//                              "instructions": "بعد الاكل",
//                              "quantity": 0,
//                              "isDispensed": true,
//                              "createdAt": "2026-01-30T21:54:58.7002171"
//                         }
//                      ]
//                 },
//                 {
//                      "id": 1017,
//                      "patientId": 103,
//                      "doctorId": 103,
//                      "diagnosis": "اضافة وصفه من قبل الصيدلي مباشرة ",
//                      "notes": null,
//                      "status": 1,
//                      "prescriptionDate": "2026-02-01T20:00:37.7233731",
//                      "createdAt": "2026-02-01T20:00:37.7234979",
//                      "doctorName": "string",
//                      "patientName": " سليم سرحان الطبيب",
//                      "items": [
//                         {
//                              "id": 1013,
//                              "prescriptionId": 1017,
//                              "drugId": 0,
//                              "medicationName": "",
//                              "dosage": "حبه",
//                              "frequency": "يوميا",
//                              "duration": "شهرين",
//                              "instructions": "بعد الاكل",
//                              "quantity": 20,
//                              "isDispensed": false,
//                              "createdAt": "2026-02-01T20:00:38.0432657"
//                         }
//                      ]
//                 },
//                 {
//                      "id": 1018,
//                      "patientId": 103,
//                      "doctorId": 103,
//                      "diagnosis": "اضافة وصفه من قبل الصيدلي مباشرة ",
//                      "notes": null,
//                      "status": 3,
//                      "prescriptionDate": "2026-02-01T20:06:27.9063624",
//                      "createdAt": "2026-02-01T20:06:27.9063625",
//                      "doctorName": "string",
//                      "patientName": " سليم سرحان الطبيب",
//                      "items": [
//                         {
//                              "id": 1014,
//                              "prescriptionId": 1018,
//                              "drugId": 0,
//                              "medicationName": "",
//                              "dosage": "حبه",
//                              "frequency": "يوميا",
//                              "duration": "شهرين",
//                              "instructions": "بعد الاكل",
//                              "quantity": 10,
//                              "isDispensed": true,
//                              "createdAt": "2026-02-01T20:06:27.9311626"
//                         },
//                         {
//                              "id": 1015,
//                              "prescriptionId": 1018,
//                              "drugId": 0,
//                              "medicationName": "",
//                              "dosage": "حبه",
//                              "frequency": "يوميا",
//                              "duration": "شهرين",
//                              "instructions": "بعد الاكل",
//                              "quantity": 20,
//                              "isDispensed": true,
//                              "createdAt": "2026-02-01T20:06:27.937526"
//                         },
//                         {
//                              "id": 1016,
//                              "prescriptionId": 1018,
//                              "drugId": 0,
//                              "medicationName": "",
//                              "dosage": "حبه",
//                              "frequency": "يوميا",
//                              "duration": "شهرين",
//                              "instructions": "بعد الاكل",
//                              "quantity": 30,
//                              "isDispensed": true,
//                              "createdAt": "2026-02-01T20:06:27.9417081"
//                         },
//                         {
//                              "id": 1017,
//                              "prescriptionId": 1018,
//                              "drugId": 0,
//                              "medicationName": "",
//                              "dosage": "حبه",
//                              "frequency": "يوميا",
//                              "duration": "شهرين",
//                              "instructions": "بعد الاكل",
//                              "quantity": 40,
//                              "isDispensed": true,
//                              "createdAt": "2026-02-01T20:06:27.9470507"
//                         },
//                         {
//                              "id": 1018,
//                              "prescriptionId": 1018,
//                              "drugId": 0,
//                              "medicationName": "",
//                              "dosage": "حبه",
//                              "frequency": "يوميا",
//                              "duration": "شهرين",
//                              "instructions": "بعد الاكل",
//                              "quantity": 50,
//                              "isDispensed": false,
//                              "createdAt": "2026-02-01T20:06:27.9506532"
//                         }
//                      ]
//                 }
//              ]
//         }
//     }