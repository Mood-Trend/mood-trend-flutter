import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../utils/get_ad_mob_unit_id.dart';

// インタースティシャル広告をロード
void loadInterstitialAd() {
  InterstitialAd.load(
    adUnitId: getAdMobUnitId(),
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (ad) {
        ad.show();
      },
      onAdFailedToLoad: (error) {},
    ),
  );
}
