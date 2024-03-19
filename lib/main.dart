import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mood_trend_flutter/firebase_options_dev.dart' as dev;
import 'package:mood_trend_flutter/firebase_options_prod.dart' as prod;
import 'package:mood_trend_flutter/utils/l10n/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/components/dialog.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/common/components/snackbars.dart';
import 'package:mood_trend_flutter/presentation/auth/root_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/constants.dart';
import 'package:package_info/package_info.dart';

import 'application/common/states/overlay_loading_provider.dart';
import 'domain/app_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: isProd
        ? prod.DefaultFirebaseOptions.currentPlatform
        : dev.DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
    return MaterialApp(
      title: 'Mood Trend',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
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
          onPopPage: (route, dynamic _) => false,
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
                  if (ref.watch(overlayLoadingProvider)) const OverlayLoading(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
