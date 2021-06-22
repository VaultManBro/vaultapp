import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/general/dimension.dart';
import 'package:ts_app/providers/general.dart';
import 'package:ts_app/general/font_styles.dart';

class _Constant {
  static const Color bottomSheetCornerColor = Color(0xff737373);
}

Widget buildHeader({
  String title,
  String subtitle = '',
  String subtitleActionText,
  VoidCallback onSubtitleActionTextPressed,
}) {
  _buildSubtitle(String text, String actionText, VoidCallback onActionPressed) {
    if (actionText != null) {
      final splittedTextSpans = text
          .split(actionText)
          .map(
            (e) => TextSpan(
              text: e,
              style: FontStylez.bodyLight,
            ),
          )
          .toList();
      final actionTextSpan = TextSpan(
        text: actionText,
        style: FontStylez.primaryClickableTextLight.copyWith(
            decoration: TextDecoration.underline,
            fontSize: FontStylez.fontSizes.checkBoxTextSize),
        recognizer: TapGestureRecognizer()..onTap = onActionPressed,
      );

      var textSpans = List<TextSpan>();

      for (final item in splittedTextSpans) {
        textSpans.add(item);
        textSpans.add(actionTextSpan);
      }

      textSpans.removeLast();

      return RichText(
        text: TextSpan(
          style: FontStylez.bodyLight,
          children: textSpans,
        ),
      );
    }
    return Text(
      subtitle,
      style: FontStylez.bodyLight,
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        title,
        style: FontStylez.titleLight,
      ),
      SizedBox(height: AppDimensions.mediumSpacing),
      Visibility(
        visible: subtitle.isNotEmpty,
        child: _buildSubtitle(
            subtitle, subtitleActionText, onSubtitleActionTextPressed),
      )
    ],
  );
}

Consumer buildMiniHeader(
  BuildContext context, {
  String title,
  String subtitle = '',
  String subtitleActionText,
  VoidCallback onSubtitleActionTextPressed,
}) {
  return Consumer<General>(builder: (context, store, child) {
    _buildSubtitle(
        String text, String actionText, VoidCallback onActionPressed) {
      if (actionText != null) {
        final splittedTextSpans = text
            .split(actionText)
            .map(
              (e) => TextSpan(
                text: e,
                style: FontStylez.bodyLight,
              ),
            )
            .toList();
        final actionTextSpan = TextSpan(
          text: actionText,
          style: FontStylez.primaryClickableTextLight.copyWith(
              decoration: TextDecoration.underline,
              fontSize: FontStylez.fontSizes.checkBoxTextSize),
          recognizer: TapGestureRecognizer()..onTap = onActionPressed,
        );

        var textSpans = List<TextSpan>();

        for (final item in splittedTextSpans) {
          textSpans.add(item);
          textSpans.add(actionTextSpan);
        }

        textSpans.removeLast();

        return RichText(
          text: TextSpan(
            style: FontStylez.bodyLight,
            children: textSpans,
          ),
        );
      }
      return Text(
        subtitle ?? "",
        style: FontStylez.bodyLight,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          style: FontStylez.secondaryButtonLight,
        ),
        SizedBox(height: AppDimensions.mediumSpacing),
        Visibility(
          visible: (subtitle ?? "").isNotEmpty,
          child: _buildSubtitle(
              subtitle, subtitleActionText, onSubtitleActionTextPressed),
        )
      ],
    );
  });
}
