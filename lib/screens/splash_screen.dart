import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => redirectPage(context));
  }

  void redirectPage(context) async {
    var userId;

    Timer(Duration(seconds: 1), () async {
      //Navigator.of(context).pushReplacementNamed(Routes.main);

      if (userId == null) {
        Navigator.of(context).pushReplacementNamed(Routes.login);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.main);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primarySwatch,
      child: Center(
        child: Icon(Icons.animation),
      ),
    );
  }
}
