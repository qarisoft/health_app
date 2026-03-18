import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart' show accountProvider;
import 'package:health_app/change_url.dart';
import 'package:health_app/core/constants/_all.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/di.dart' show initDi, appStorage;
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/auth/ui/pages/register_page.dart';
import 'package:health_app/features/doctor/ui/home.dart' as doctor_app;
import 'package:health_app/features/home/ui/pages/p.dart' as patient_app;
import 'package:health_app/features/pharmacist/ui/home/page.dart'
    as pharmacist_page;
import 'package:health_app/l10n/app_localizations.dart';
import 'package:health_app/shared/api/dio_factory.dart';
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
    xlog('isAlive is $isAliveAsync');

    return isAliveAsync.when(
      error: (e) {
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
      alive: () => const SplashInnerPage(),
      noApiUrl: () {
        return _buildStateScreen(
          context: context,
          lottieAsset: AppAssets.error,
          message: 'please enter the api url',
          // onRetryText: 'enter api url',
          onRetry: () => onChangeTheUrl(context),
        );
      },
    );
  }

  void onChangeTheUrl(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return EnterApiUrlDialog();
      },
    );
  }

  /// Helper method to keep the code DRY and visually consistent
  Widget _buildStateScreen({
    required BuildContext context,
    required String lottieAsset,
    required String message,
    String? onRetryText,
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
                    label: Text(onRetryText ?? context.tr.retry),
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
                SizedBox(height: 10),
                TextButton(
                  onPressed: () => onChangeTheUrl(context),
                  child: Text('change api url'),
                ),
                Text(appStorage.getString(apiUrlKey) ?? ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class EnterApiUrlDialog extends StatefulWidget {
//   const EnterApiUrlDialog({super.key});
//
//   @override
//   State<EnterApiUrlDialog> createState() => _EnterApiUrlDialogState();
// }
//
// class _EnterApiUrlDialogState extends State<EnterApiUrlDialog> {
//   final _controller = TextEditingController();
//   final _key = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Form(
//         key: _key,
//         child: Localizations.override(
//           context: context,
//           locale: Locale('en'),
//
//           child: CustomTextField(
//             labelText: 'api url',
//             validator: (String? s) {
//               if (s == null || s.isEmpty) {
//                 return 'please enter the api url';
//               }
//               if (!s.startsWith('http')) {
//                 return 'https://xxx || http://xxx';
//               }
//               if (s.endsWith('/')) {
//                 return 'https://xxx no / at the end';
//               }
//               return null;
//             },
//             controller: _controller,
//           ),
//         ),
//       ),
//       actions: [
//         Consumer(
//           builder: (context, ref, _) {
//             return ElevatedButton(
//               onPressed: () async {
//                 if (_key.currentState!.validate()) {
//                   await appStorage.setString(
//                     apiUrlKey,
//                     '${_controller.text}/api',
//                   );
//                   ref.invalidate(serverHealthProvider);
//                   context.mayPop();
//                 }
//               },
//               child: const Text('save'),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

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
