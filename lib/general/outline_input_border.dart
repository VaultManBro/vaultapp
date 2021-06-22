import 'package:flutter/material.dart';
import 'package:ts_app/general/colors.dart';
import 'dimension.dart';

class AppOutlineInputBorder {
  static final OutlineInputBorder clearBorder =
      OutlineInputBorder(borderSide: BorderSide.none);
  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.defaultTextFieldBorder,
          width: AppDimensions.inputBorderSize));
  static final OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.error, width: AppDimensions.inputBorderSize));
  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.primaryAccent,
          width: AppDimensions.inputBorderSize));
}
