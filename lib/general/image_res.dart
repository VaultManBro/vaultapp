import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images {
  static const ImagesAssetsPath = 'assets';

  static Widget toastInfoIcon = _fromFile('toast_icon_info.svg');
  static Widget toastSuccessIcon = _fromFile('toast_icon_success.svg');
  static Widget toastErrorIcon = _fromFile('toast_icon_error.svg');
  static Widget toastCloseIcon = _fromFile('toast_icon_close.svg');

  static Widget _fromFile(String fileName, {Color color}) {
    return SvgPicture.asset(
      _fullPath(fileName),
      color: color,
    );
  }

  static String _fullPath(String fileName) => ImagesAssetsPath + '/' + fileName;
}
