import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_it/get_it.dart';
import 'package:health_app/auth_state.dart'
    show accountProvider, di;
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/features/auth/data/usecases/login_usecase.dart'
    show LoginUsecaseImpl;
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/auth/ui/pages/register_page.dart';
import 'package:health_app/features/doctor/ui/home.dart' as doctor_pages;
// import 'package:health_app/features/home/ui/pages/initialize_profile/page.dart';
import 'package:health_app/features/home/ui/pages/p.dart' as P;
import 'package:health_app/features/patients/ui/home.dart'
    show MedicalHistoryPage;
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
            AppRoutes.patientHome: (context) => const P.MainPatientPage(),
            AppRoutes.doctorHome: (context) => const doctor_pages.HomePage(),
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

    auth.log('auth ');
    return auth.when(
      initial: () => LoginPage(),
      acount: (a) => a.when(
        patient: (p) => P.HomePage(),
        doctor: (p) => P.HomePage(),
        pharmacist: (p) => P.HomePage(),
        admin: (p) => P.HomePage(),
      ),
    );
    // .when(
    // initial: (_) => LoginPage(),
    // patient: (_) => P.HomePage(),
    // doctor: (_) => DoctorHomePage(),
    // pharmacisit: (_) => PharmacistHomePage(),
    // admin: (_) => AdminHomePage(),
    // );
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

  di.registerFactory<Dio>(() => DioFactory(di()).getDio());

  di.registerLazySingleton<ApiService>(() => ApiService(dio: di()));
  di.registerLazySingleton<AppRepositories>(
    () => AppRepositories(api: di(), storage: di()),
  );

  di.registerFactory<LoginUsecase>(() => LoginUsecaseImpl(di()));
  // di.registerFactory<RegisterUsecase>(
  //   () => RegisterUsecaseImpl(dio: di(), storage: di()),
  // );
}
