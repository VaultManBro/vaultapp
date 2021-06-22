import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_appcenter_bundle/flutter_appcenter_bundle.dart';
import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';
import 'package:flutter/foundation.dart';

import 'app.dart';

void initAppCenter() async {
  final ios = defaultTargetPlatform == TargetPlatform.iOS;
  var appSecret = ios ? "iOSGuid" : "AndroidGuid";
  await AppCenter.start(
      appSecret, [AppCenterAnalytics.id, AppCenterCrashes.id]);
}

@override
void initState() {
  initAppCenter();
}

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await AppCenter.startAsync(
  //   appSecretAndroid: '49361c2e-b788-4bc2-a33d-838b04b3e06b',
  //   appSecretIOS: '2da3d93f-6b3f-48f9-920f-2d63ae3cd25a',
  //   enableDistribute: true,
  // );
  // await AppCenter.configureDistributeDebugAsync(enabled: false);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: getProviders(),
      child: MyApp(),
    ));
  });
}
