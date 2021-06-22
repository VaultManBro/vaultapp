import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'toast_type.dart';
import 'top_toast_message.dart';

class ToastHandler {
  String message;
  BuildContext context;
  Duration duration;
  ToastType toastType;
  bool manuallyDismissable;
  FToast _toastMessage;

  ToastHandler(
      {this.context,
      this.message,
      this.duration,
      this.toastType = ToastType.info,
      this.manuallyDismissable}) {
    _toastMessage = FToast();
    _toastMessage.init(context);
  }

  showToast() {
    dismissToast();
    _toastMessage.showToast(
      child: TopToastMessage(
        message: message,
        toastType: toastType,
        onDismiss: _manualDismissableByType() ? dismissToast : null,
      ),
      gravity: ToastGravity.TOP,
      toastDuration: duration == null ? _durationByType() : duration,
    );
  }

  Duration _durationByType() {
    switch (toastType) {
      case ToastType.error:
        return ToastDuration.indefinite;
      default:
        return ToastDuration.long;
    }
  }

  bool _manualDismissableByType() {
    if (manuallyDismissable != null) return manuallyDismissable;

    switch (toastType) {
      case ToastType.error:
        return true;
      default:
        return false;
    }
  }

  dismissToast() {
    _toastMessage.removeCustomToast();
  }
}

class ToastDuration {
  static const Duration short = Duration(seconds: 2);
  static const Duration long = Duration(seconds: 5);
  static const Duration indefinite = Duration(minutes: 1);
}
