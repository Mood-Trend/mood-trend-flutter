import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_trend_flutter/firebase_options_dev.dart' as dev;
import 'package:mood_trend_flutter/firebase_options_prod.dart' as prod;
import 'package:mood_trend_flutter/presentation/components/dialog.dart';
import 'package:mood_trend_flutter/presentation/components/loading.dart';
import 'package:mood_trend_flutter/presentation/components/snackbars.dart';
import 'package:mood_trend_flutter/presentation/root_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/constants.dart';
import 'package:package_info/package_info.dart';

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
    const ProviderScope(
      overrides: [],
      child: App(),
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
        colorSchemeSeed: AppColors.green,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.grey),
          bodyMedium: TextStyle(color: AppColors.grey),
          bodySmall: TextStyle(color: AppColors.grey),
        ),
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
        ),
        fontFamily: 'Noto Sans JP',
        fontFamilyFallback: const ['Noto Sans JP'],
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
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
