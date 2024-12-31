import 'dart:io';

import 'package:flutter/foundation.dart';

String getAdRewardUnitId() {
  String bannerUnitId = "";
  if (Platform.isAndroid) {
    // Android のとき
    bannerUnitId = kDebugMode
        ? "ca-app-pub-3940256099942544/5224354917" // Androidのデモ用リワード広告ID
        : "YOUR_ADMOB_ANDROID_UNIT_ID";
  } else if (Platform.isIOS) {
    // iOSのとき
    bannerUnitId = kDebugMode
        ? "ca-app-pub-3940256099942544/1712485313" // iOSのデモ用リワード広告ID
        : "YOUR_ADMOB_IOS_UNIT_ID";
  }
  return bannerUnitId;
}
