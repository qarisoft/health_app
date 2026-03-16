import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart' show accountProvider;
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/di.dart' show initDi;
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/ui/pages/register_page.dart';
import 'package:health_app/features/doctor/ui/home.dart' as doctor_app;
import 'package:health_app/features/home/ui/pages/p.dart' as patient_app;
import 'package:health_app/features/patients/ui/home.dart'
    show MedicalHistoryPage;
import 'package:health_app/features/pharmacist/ui/home/page.dart'
    as pharmacist_page;
import 'package:health_app/l10n/app_localizations.dart';
import 'package:health_app/shared/providers/local/local_provider.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/ui/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();

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
            AppRoutes.patientHome: (context) =>
                const patient_app.MainPatientPage(),
            AppRoutes.doctorHome: (context) => const doctor_app.HomePage(),
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
    // xlog('auth ${auth.toString()}');

    // auth.log('auth ');
    return auth.when(
      initial: () => LoginPage(),
      acount: (a) => a.when(
        patient: (p) => patient_app.MainPatientPage(),
        doctor: (p) => const doctor_app.HomePage(),
        pharmacist: (p) => const pharmacist_page.HomePage(),
        admin: (p) => patient_app.HomePage(),
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
