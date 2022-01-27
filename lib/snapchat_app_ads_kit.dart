import 'dart:async';

import 'package:flutter/services.dart';

class SnapchatAppAdsKit {
  static const MethodChannel _channel = MethodChannel('snapchat_app_ads_kit');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> init(String appId) async {
    return await _channel.invokeMethod('init', {'appId': appId});
  }

  static Future<bool> trackEvent() async {
    return await _channel.invokeMethod('trackEvent', {});
  }
}
