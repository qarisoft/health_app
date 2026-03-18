import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart' show accountProvider;
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/di.dart' show initDi;
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/ui/pages/register_page.dart';
import 'package:health_app/features/doctor/ui/home.dart' as doctor_app;
import 'package:health_app/features/home/ui/pages/p.dart' as patient_app;
import 'package:health_app/features/pharmacist/ui/home/page.dart'
    as pharmacist_page;
import 'package:health_app/l10n/app_localizations.dart';
import 'package:health_app/shared/ex.dart' show AppEx, xlog;
import 'package:health_app/shared/providers/local/local_provider.dart';
import 'package:health_app/shared/providers/theme/theme_provider.dart';
import 'package:health_app/shared/server_health_provider.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog2.dart';
import 'package:lottie/lottie.dart';

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
        final isDark = ref.watch(isDarkThemeProvider);
        return MaterialApp(
          navigatorKey: AppDialog.navigatorKey,
          // title: 'HealthCare Pro',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.lightTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
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
            // AppRoutes.patientMHistory: (context) => const MedicalHistoryPage(),
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

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAliveAsync = ref.watch(serverHealthProvider);

    return isAliveAsync.when(
      data: (isAlive) {
        if (isAlive) {
          return const SplashInnerPage();
        }
        return _buildStateScreen(
          context: context,
          lottieAsset: AppAssets.serverIsDown,
          message: context.tr.serverDownMessage,
          // Invalidate forces Riverpod to re-run the build() method of the provider
          // onRetry: () => ref.invalidate(serverHealthProvider),
          onRetry: () => ref.read(serverHealthProvider.notifier).checkHealth(),
        );
      },
      error: (e, _) {
        return _buildStateScreen(
          context: context,
          lottieAsset: AppAssets.error,
          message: context.tr.connectionError,
          // onRetry: () => ref.invalidate(serverHealthProvider),
          onRetry: () => ref.read(serverHealthProvider.notifier).checkHealth(),
        );
      },
      loading: () => _buildStateScreen(
        context: context,
        lottieAsset: AppAssets.loading2,
        message: context.tr.connecting,
      ),
    );
  }

  /// Helper method to keep the code DRY and visually consistent
  Widget _buildStateScreen({
    required BuildContext context,
    required String lottieAsset,
    required String message,
    VoidCallback? onRetry,
  }) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Or Theme.of(context).scaffoldBackgroundColor
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  lottieAsset,
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),

                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Only show the retry button if a callback is provided
                if (onRetry != null) ...[
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: Text(context.tr.retry),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SplashInnerPage extends ConsumerWidget {
  const SplashInnerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(accountProvider);
    // return const pharmacist_page.HomePage();
    // return const doctor_app.HomePage();
    // return const patient_app.MainPatientPage();
    xlog('auth from splash $auth');
    return auth.when(
      initial: () => LoginPage(),
      account: (a, _) => a.when(
        patient: (p) => patient_app.MainPatientPage(),
        doctor: (p) => const doctor_app.HomePage(),
        pharmacist: (p) => const pharmacist_page.HomePage(),
        admin: (p) => patient_app.HomePage(),
      ),
    );
  }
}

// final GetIt di = GetIt.instance;
class NetworkAwareWrapper extends ConsumerWidget {
  final Widget child;

  const NetworkAwareWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the server health state
    final healthState = ref.watch(serverHealthProvider);

    // Extract the boolean value (defaulting to true so we don't flash offline unnecessarily)
    final isAlive = healthState.value ?? true;

    return Column(
      children: [
        // The actual screen content
        Expanded(child: child),

        // The Offline Banner
        // This will seamlessly slide up/down based on the server status
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isAlive ? 0 : 40,
          color: Colors.red,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              const Text(
                'Server is unreachable. Check your connection.',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(width: 16),
              // Give users a way to manually retry
              TextButton(
                onPressed: () {
                  // ref.read(serverHealthProvider.notifier).checkHealth();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(40, 20),
                ),
                child: const Text(
                  'RETRY',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
