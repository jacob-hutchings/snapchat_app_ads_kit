import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snapchat_app_ads_kit/snapchat_app_ads_kit.dart';

void main() {
  const MethodChannel channel = MethodChannel('snapchat_app_ads_kit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SnapchatAppAdsKit.platformVersion, '42');
  });
}
