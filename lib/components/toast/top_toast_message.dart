import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/dimension.dart';
import 'package:ts_app/general/font_styles.dart';
import 'package:ts_app/general/image_res.dart';
import 'package:ts_app/providers/general.dart';

import 'toast_type.dart';

class TopToastMessage extends StatelessWidget {
  final String message;
  final ToastType toastType;
  final void Function() onDismiss;

  TopToastMessage({this.message, this.toastType, this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Consumer<General>(builder: (context, store, child) {
      return Container(
        padding: const EdgeInsets.all(AppDimensions.toastContentPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.toastCornerRadius),
          color: _mainColor(),
        ),
        child: Row(
          children: [
            SizedBox(
              width: AppDimensions.toastIconSize,
              height: AppDimensions.toastIconSize,
              child: _icon(),
            ),
            SizedBox(
              width: AppDimensions.smallSpacing,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                message,
                maxLines: 10,
                style: FontStylez.bodyLight,
              ),
            ),
            Visibility(
              visible: _isManuallyDismissable(),
              child: SizedBox(
                width: AppDimensions.toastButtonSize,
                height: AppDimensions.toastButtonSize,
                child: IconButton(
                  icon:  _icon(),
                  onPressed: onDismiss,
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  bool _isManuallyDismissable() => onDismiss != null;

  _icon() {
    switch (toastType) {
      case ToastType.info:
        return Container();
      case ToastType.success:
        return Container();
      case ToastType.error:
        return Container();
    }
  }

  _mainColor() {
    switch (toastType) {
      case ToastType.info:
        return AppColors.primaryAccent;
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
    }
  }
}
