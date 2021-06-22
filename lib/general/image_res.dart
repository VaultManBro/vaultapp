import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images {
  static const ImagesAssetsPath = 'assets';


  static Widget _fromFile(String fileName, {Color color}) {
    return SvgPicture.asset(
      _fullPath(fileName),
      color: color,
    );
  }

  static String _fullPath(String fileName) => ImagesAssetsPath + '/' + fileName;
}
