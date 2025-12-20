import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_it/get_it.dart';
import 'package:health_app/auth_state.dart' show appAuthProvider, di;
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/core/user/user.dart';
import 'package:health_app/features/auth/data/usecases/login_usecase.dart'
    show LoginUsecaseImpl;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/features/auth/ui/pages/register_page.dart';
import 'package:health_app/features/doctor/ui/home.dart';
import 'package:health_app/features/home/ui/pages/p.dart' as P;
// import 'package:health_app/features/home/presentation/pages/home_page.dart' as Home;
import 'package:health_app/features/patients/ui/home.dart'
    show MedicalHistoryPage;
import 'package:health_app/l10n/app_localizations.dart';
import 'package:health_app/shared/providers/local/local_provider.dart';
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
          // title: 'HealthCare Pro',
          theme: AppTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(local.code),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.login,

          // initialRoute: AppRoutes.doctor,
          routes: {
            AppRoutes.splash: (context) => const SplashPage(),
            AppRoutes.login: (context) => const LoginPage(),
            AppRoutes.register: (context) => const RegisterPage(),
            //
            AppRoutes.patientMHistory: (context) => const MedicalHistoryPage(),
            AppRoutes.patientHome: (context) => const P.HomePage(),
            AppRoutes.doctorHome: (context) => const DoctorHome(),
          },
        );
      },
    );
  }
}

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(appAuthProvider);
    return auth.when(
      initial: (_) => LoginPage(),
      patient: (_) => P.HomePage(),
      doctor: (_) => DoctorHomePage(),
      pharmacisit: (_) => PharmacistHomePage(),
      admin: (_) => AdminHomePage(),
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
  di.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  di.registerFactory<LoginUsecase>(() => LoginUsecaseImpl());
}
