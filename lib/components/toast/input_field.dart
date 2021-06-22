import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/dimension.dart';
import 'package:ts_app/general/font_styles.dart';

import '../../providers/general.dart';

class InputField extends StatefulWidget {
  final String initialValue;
  final String hintText;
  final Widget prefixWidget;
  final Widget suffixWidget;
  final String label;
  final onChange;
  final onTap;
  final bool mandatory;
  final bool readOnly;
  final bool enabled;
  final TextInputType keyboardType;
  final maxLines;
  final bool isObscured;
  final bool canToggleObscure;
  final List<TextFieldValidator> validators;
  final TextEditingController fieldController;
  final bool autocorrect;
  final String errorText;
  final FocusNode focusNode;

  InputField({
    Key key,
    this.initialValue,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.label,
    this.onChange,
    this.onTap,
    this.mandatory,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.isObscured = false,
    this.canToggleObscure = false,
    this.validators = const [],
    this.fieldController,
    this.autocorrect = false,
    this.errorText,
    this.focusNode,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController _fieldController;
  bool isObscured;
  String fieldValue;
  String errorText;

  var fieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    if (widget.fieldController == null) {
      _fieldController = new TextEditingController(text: widget.initialValue);
    } else {
      _fieldController = widget.fieldController;
      _fieldController?.text = widget.initialValue ?? "";
    }

    fieldValue = _fieldController.text;
    isObscured = widget.isObscured;

    _fieldController.addListener(() {
      // fieldKey.currentState.validate(); // validate the field while typing
      if (widget.onChange != null) widget.onChange(_fieldController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<General>(builder: (_, store, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildChildren(),
      );
    });
  }

  List<Widget> _buildChildren() {
    List<Widget> builder = [];

    TextStyle labelStyle = FontStylez.inputLabel;
    String labelText;
    if (widget.label != null) {
      labelText = '${widget.label}';
    }
    String errorText = widget.errorText;

    if (labelText != null) {
      var labelWidget = Padding(
        padding:
            const EdgeInsets.only(bottom: AppDimensions.inputLabelBottomMargin),
        child: Text(
          labelText,
          style: labelStyle,
        ),
      );

      builder.add(labelWidget);
    }

    var inputContainer = Container(
      // decoration: store.activeThemeData.inputTextDecoration(),
      child: TextFormField(
        controller: _fieldController,
        key: fieldKey,
        autovalidateMode: AutovalidateMode.disabled,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        autocorrect: widget.autocorrect,
        validator: MultiValidator(widget.validators),
        enabled: widget.enabled,
        decoration: InputDecoration(
          fillColor: _inputFillColor(),
          filled: true,
          // focusedErrorBorder: store.activeThemeData.errorOutlineInputBorder(),
          // errorBorder: store.activeThemeData.errorOutlineInputBorder(),
          // enabledBorder: store.activeThemeData.enabledOutlineInputBorder(),
          // disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          // focusedBorder: widget.readOnly
          //     ? store.activeThemeData.enabledOutlineInputBorder()
          //     : store.activeThemeData.focusedOutlineInputBorder(),
          contentPadding: const EdgeInsets.all(20.0),
          hintText: widget.hintText,
          hintStyle: FontStylez.inputLabelHint,
          errorStyle: FontStylez.warningText,
          errorMaxLines: 2,
          errorText: errorText,

          focusColor: Color.fromRGBO(
              0, 0, 0, 0), // store.activeThemeData.primaryAccentColor(),
        ),
        obscureText: isObscured,
        readOnly: widget.readOnly,
        // style: _inputLabelStyle(store),
        focusNode: widget.focusNode,
        onChanged: _updateValue,
        onTap: widget.onTap,
      ),
    );
    builder.add(inputContainer);

    var spacing = SizedBox(height: AppDimensions.smallSpacing);
    builder.add(spacing);

    return builder;
  }

  void _toggleObscureText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  void _updateValue(value) {
    setState(() {
      fieldValue = value;
    });
  }

  _inputFillColor() => widget.enabled
      ? AppColors.secondaryAccent
      : AppColors.secondaryAccent.withOpacity(0.5);

  _inputLabelStyle(General store) => widget.enabled
      ? FontStylez.inputLabel
      : FontStylez.inputLabel
          .copyWith(color: FontStylez.inputLabel.color.withOpacity(0.5));
}
