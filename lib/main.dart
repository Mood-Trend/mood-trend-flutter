import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mood_trend_flutter/firebase_options_dev.dart' as dev;
import 'package:mood_trend_flutter/firebase_options_prod.dart' as prod;
import 'package:mood_trend_flutter/presentation/app.dart';
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

  final firebaseUser = await FirebaseAuth.instance.userChanges().first;
  print('uid = ${firebaseUser?.uid}');
  if (firebaseUser == null) {
    final credential = await FirebaseAuth.instance.signInAnonymously();
    final uid = credential.user!.uid;
    print('Signed in: uid = $uid');
  }

  runApp(
    const ProviderScope(
      overrides: [
        // 各 Repository の上書き
      ],
      child: App(),
    ),
  );

  // runApp(const MyApp());
}
