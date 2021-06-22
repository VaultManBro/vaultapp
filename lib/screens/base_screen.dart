import 'package:flutter/widgets.dart';
import 'package:ts_app/components/toast/toast_handler.dart';
import 'package:ts_app/components/toast/toast_type.dart';

abstract class BaseScreenState<T extends StatefulWidget> extends State<T> {
  ToastHandler _toastHandler;

  bool _isLoading = false;

  void startLoading({String resId = 'it_may_take_few_seconds'}) {
    if (_isLoading) {
      stopLoading();
    }

    _isLoading = true;
  }

  void stopLoading() {
    if (!_isLoading) {
      return;
    }

    Navigator.of(context, rootNavigator: true).pop();

    _isLoading = false;
  }

  @override
  void dispose() {
    _toastHandler?.dismissToast();
    super.dispose();
  }

  void _showToast(String message, ToastType type) {
    if (_toastHandler != null) {
      _toastHandler.dismissToast();
    }

    _toastHandler = ToastHandler(
      context: context,
      message: message,
      toastType: type,
    );

    _toastHandler.showToast();
  }

  void showSuccessToast(String message) {
    _showToast(message, ToastType.success);
  }

  void showInfoToast(String message) {
    _showToast(message, ToastType.info);
  }

  void showErrorToast(String message) {
    _showToast(message, ToastType.error);
  }

  void dismissToast() {
    if (_toastHandler != null) {
      _toastHandler.dismissToast();
    }
  }
}
