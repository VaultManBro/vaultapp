import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:ts_app/screens/home_screen.dart';
import 'package:ts_app/screens/info_screen.dart';
import 'package:ts_app/screens/login_screen.dart';
import 'package:ts_app/screens/main_screen.dart';
import 'package:ts_app/screens/orders_screen.dart';

class Routes {
  Routes._();
  // Login / Register
  static const String home = '/home_screen';
  static const String order = '/orders_screej';
  static const String main = '/main_screen';
  static const String login = '/login_screen';
  static const String info = '/info_Screen';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      main: (context) => MainScreen(),
      order: (context) => OrdersScreen(),
      home: (context) => HomeScreen(),
      info: (context) => InfoScreen(),
      login: (context) => LoginScreen(),
    };
  }

  static Future<T> pushRouteNamed<T extends Object>(
      BuildContext context, String routeName,
      {Object arguments, bool withNavBar = false}) {
    return pushNewScreenWithRouteSettings(
      context,
      settings: RouteSettings(name: routeName, arguments: arguments),
      screen: getRoutes()[routeName](context),
      withNavBar: withNavBar,
    );
  }
}
