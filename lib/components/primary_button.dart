import 'package:flutter/material.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/dimension.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onPressed;
  final Color color;

  PrimaryButton(
      {Key key, @required this.title, @required this.onPressed, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.buttonHeight,
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonCornerRadius),
        ),
        color: color == null ? AppColors.primaryAccent : color,
        disabledColor: AppColors.primaryAccent.withAlpha(80),
        key: UniqueKey(),
        child: Text(title),
        onPressed: onPressed,
      ),
    );
  }
}
