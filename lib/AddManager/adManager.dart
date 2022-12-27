import 'package:flutter/foundation.dart';

class AdManager {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '5092495';
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return '5092495';
    }
    return '';
  }

  static String get bannerAdPlacementId {
    return 'Banner_Android';
  }

  static String get interstitialVideoAdPlacementId {
    return 'Interstitial_Android';
  }


  static String get rewardedVideoAdPlacementId {
    return 'Rewarded_Android';
  }
}
