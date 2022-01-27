import 'package:flutter/material.dart';
import 'package:snapchat_app_ads_kit/snapchat_app_ads_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var result = await SnapchatAppAdsKit.init('your_app_id');
                print('init result: $result');
              },
              child: Text('init'),
            ),
            ElevatedButton(
              onPressed: () async {
                var result = await SnapchatAppAdsKit.trackEvent();
                print('track result: $result');
              },
              child: Text('Track'),
            ),
          ],
        ),
      ),
    );
  }
}
