import 'package:flutter/material.dart';

import 'colors.dart';

const String defaultFontFamily = "SourceSansPro";

class FontSizes {
  const FontSizes();

  double get sectionText => 13.0;
  double get checkBoxTextSize => 14.0;
  double get defaultTextSize => 15.0;
  double get smallTextSize => 12.0;
  double get titleSize => 28.0;
  double get secondaryTitleSize => 22.0;
  double get buttonTextSize => 15.0;
  double get floatingLabelSize => 13.0;
  double get largeTextSize => 24.0;
  double get toastLabelSize => 14.0;
  double get inputTextSize => 14.0;
  double get inputHintTextSize => 13.0;
  double get inputErrorTextSize => 12.0;
  double get pickerLargeTextSize => 16.0;
  double get pickerRegularTextSize => 14.0;
  double get timePickerFontSize => 40.0;
}

class FontStylez {
  static FontSizes fontSizes = const FontSizes();

  static final TextStyle titleLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.titleSize,
  );
  static final TextStyle inputLabel = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.bold,
    fontSize: fontSizes.floatingLabelSize,
  );
  static final TextStyle inputLabelHint = TextStyle(
    color: AppColors.background,
    fontWeight: FontWeight.bold,
    fontSize: fontSizes.floatingLabelSize,
  );

  static final TextStyle secondaryTitleLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.secondaryTitleSize,
  );

  static final TextStyle bodyLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.normal,
    fontSize: fontSizes.defaultTextSize,
  );
  static final TextStyle cashText = TextStyle(
    color: AppColors.cashGreen,
    fontWeight: FontWeight.normal,
    fontSize: fontSizes.defaultTextSize,
  );

  static final TextStyle bodyLightSelected =
      bodyLight.copyWith(color: AppColors.primaryAccent);

  static final TextStyle smallBodyLight = bodyLight.copyWith(
    fontSize: fontSizes.smallTextSize,
  );
  static final TextStyle warningText = TextStyle(
    color: AppColors.error,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.sectionText,
  );
  static final TextStyle categoryTitleLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.sectionText,
  );

  static final TextStyle notificationNumberLight = TextStyle(
      color: AppColors.secondaryAccent,
      fontSize: fontSizes.smallTextSize,
      fontWeight: FontWeight.w600);

  static final TextStyle primaryButtonLight = TextStyle(
    color: AppColors.primaryButtonText,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.buttonTextSize,
  );

  static final TextStyle secondaryButtonLight = TextStyle(
    color: AppColors.secondaryButtonText,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.buttonTextSize,
  );

  static final TextStyle primaryClickableTextLight = TextStyle(
    color: AppColors.primaryAccent,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.buttonTextSize,
  );

  static final TextStyle secondaryClickableTextLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.buttonTextSize,
  );

  static final unselectedTabLabelLight = TextStyle(
    color: AppColors.textMain.withOpacity(0.4),
    fontWeight: FontWeight.w500,
    fontSize: fontSizes.smallTextSize,
  );

  static final selectedTabLabelLight = TextStyle(
    color: AppColors.primaryAccent,
    fontWeight: FontWeight.w500,
    fontSize: fontSizes.smallTextSize,
  );
}
