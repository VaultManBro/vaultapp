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
  await AppCenter.start(appSecret, 
                 [AppCenterAnalytics.id, AppCenterCrashes.id]);
}

@override
void initState() {
  initAppCenter();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: getProviders(),
      child: MyApp(),
    ));
  });
}
