import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info/package_info.dart';

import 'firebase_options_dev.dart' as dev;
import 'firebase_options_prod.dart' as prod;
import 'generated/l10n.dart';
import 'infrastructure/firebase/analytics_repository.dart';
import 'infrastructure/services/notification_service.dart';
import 'presentation/common/components/dialog.dart';
import 'presentation/common/components/loading.dart';
import 'presentation/common/components/snackbars.dart';
import 'presentation/auth/root_page.dart';
import 'utils/app_colors.dart';
import 'utils/constants.dart';
import 'application/common/states/overlay_loading_notifier.dart';
import 'domain/app_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: isProd
        ? prod.DefaultFirebaseOptions.currentPlatform
        : dev.DefaultFirebaseOptions.currentPlatform,
  );

  // 通知サービスの初期化
  final notificationService = NotificationService();
  await notificationService.initialize();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ],
  );

  final packageInfo = await PackageInfo.fromPlatform();

  runApp(
    ProviderScope(
      overrides: [
        appInfoProvider.overrideWith(
          (ref) => AppInfo(
            appName: packageInfo.appName,
            packageName: packageInfo.packageName,
            version: 'v${packageInfo.version}',
            buildNumber: packageInfo.buildNumber,
            copyRight: '(C)2024 Mood Trend',
            iconImagePath: 'assets/icon.png',
            privacyPolicyUrl: isProd
                ? Uri.parse(
                    'https://mood-trend-prod.web.app/privacy-policy.html',
                  )
                : Uri.parse(
                    'https://mood-trend-dev.web.app/privacy-policy.html',
                  ),
            termsOfServiceUrl: isProd
                ? Uri.parse(
                    'https://mood-trend-prod.web.app/term-of-service.html',
                  )
                : Uri.parse(
                    'https://mood-trend-dev.web.app/term-of-service.html',
                  ),
            contactUrl: Uri.parse(
              'https://docs.google.com/forms/d/e/1FAIpQLScJx5NC4RWnZaAbTld5_0lE1y6gjAx5_KkkjeWbFFFRLGsq3g/viewform?usp=sf_link',
            ),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var analytics = ref.watch(analyticsRepository);
    var analyticsObserver = ref.watch(analyticsObserverRepository);

    analytics.logAppOpen();
    return MaterialApp(
      navigatorObservers: [analyticsObserver],
      title: 'Mood Trend',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
        ),
        dialogTheme: DialogTheme(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
        ),
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
          activeTrackColor: AppColors.green,
          activeTickMarkColor: AppColors.green,
          thumbColor: AppColors.green,
          valueIndicatorTextStyle:
              TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          valueIndicatorColor: AppColors.green,
          inactiveTrackColor: AppColors.grey,
          inactiveTickMarkColor: AppColors.grey,
        ),
        fontFamily: 'Noto Sans JP',
        fontFamilyFallback: const ['Noto Sans JP'],
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      builder: (context, child) {
        return Navigator(
          key: ref.watch(navigatorKeyProvider),
          pages: [
            MaterialPage<Widget>(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: ScaffoldMessenger(
                      key: ref.watch(scaffoldMessengerKeyProvider),
                      child: child!,
                    ),
                  ),
                  if (ref.watch(overlayLoadingNotifierProvider))
                    const OverlayLoading(),
                ],
              ),
            ),
          ],
          onDidRemovePage: (_) {},
        );
      },
    );
  }
}
