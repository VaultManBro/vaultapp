import 'package:flutter/material.dart';

class NonAnimatedMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NonAnimatedMaterialPageRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
