import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class General with ChangeNotifier, DiagnosticableTreeMixin {
  General() {}

  // // PRIVATE VARS

  // AppTheme _selectedThemeData = lightTheme;

  // //GETTERS
  // AppTheme get activeThemeData => _selectedThemeData;

  // void changeTheme(AppTheme newThemeData) {
  //   _selectedThemeData = newThemeData;
  //   notifyListeners();
  // }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
