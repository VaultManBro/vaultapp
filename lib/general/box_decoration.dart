import 'package:flutter/material.dart';

import 'dimension.dart';

class AppBoxDecoration {
  static final BoxDecoration primaryInput = BoxDecoration(
    borderRadius: new BorderRadius.circular(AppDimensions.inputBorderRadius),
  );

  static final BoxDecoration defaultCardWithShadowBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  );
}

class AppBoxDecorationDark {
  static final BoxDecoration primaryInput = BoxDecoration(
    borderRadius: new BorderRadius.circular(AppDimensions.inputBorderRadius),
  );

  static final BoxDecoration defaultCardWithShadowBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  );
}
