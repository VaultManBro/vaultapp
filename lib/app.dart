import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/routes.dart';
import 'package:ts_app/providers/cart_provider.dart';
import 'package:ts_app/providers/general.dart';
import 'package:ts_app/screens/main_screen.dart';
import 'package:ts_app/screens/splash_screen.dart';

import 'general/font_styles.dart';

BuildContext appContext() {
  return _appContext;
}

BuildContext _appContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _appContext = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: defaultFontFamily,
        canvasColor: AppColors.secondarySwatch,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: Routes.getRoutes(),
      title: 'Title stuff',
      home: SplashScreen(),
    );
  }
}

getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => AuthenticatedAppNavigationProvider()),
    ChangeNotifierProvider(create: (_) => General()),
    ChangeNotifierProvider.value(
      value: Cart(),
    ),
  ];
}
