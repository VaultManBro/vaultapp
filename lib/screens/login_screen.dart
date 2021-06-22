import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ts_app/components/primary_button.dart';
import 'package:ts_app/components/toast/input_field.dart';
import 'package:ts_app/components/ui_components.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/dimension.dart';
import 'package:ts_app/general/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameFieldController = TextEditingController();
  TextEditingController _passwordFieldController = TextEditingController();
  bool _isRegisterButtonEnabled = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _usernameFieldController.addListener(_onFormChanged);
    _passwordFieldController.addListener(_onFormChanged);
  }

  _onFormChanged() {
    setState(() {
      _isRegisterButtonEnabled = _canSubmitForm();
    });
  }

  bool _canSubmitForm() {
    bool isFormSubmitable = false;
    isFormSubmitable = _usernameFieldController.text.isNotEmpty &&
        _passwordFieldController.text.isNotEmpty;

    return isFormSubmitable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          top: false,
          child: Container(
            margin: const EdgeInsets.only(
                top: AppDimensions.defaultPadding,
                left: AppDimensions.defaultPadding,
                right: AppDimensions.defaultPadding),
            child: Column(children: <Widget>[
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                    SizedBox(height: AppDimensions.headerSpacing),
                    buildHeader(
                        title: "Create account/Login",
                        subtitle:
                            "         Careful, accounts cannot be recovered!\n\n   This account can only be used on this device."),
                    SizedBox(height: AppDimensions.headerSpacing),
                    _buildForm(context),
                  ])))
            ]),
          ),
        ));
  }

  _onCreateAccountPressed() async {
    _usernameFieldController.text = _usernameFieldController.text.trim();
    _passwordFieldController.text = _passwordFieldController.text.trim();

    bool formIsValid = _formKey.currentState.validate();

    if (formIsValid) {
      Navigator.of(context).pushNamed(Routes.main);
      print("Form is valid");
    } else {
      print("Form is invalid");
    }
  }

  Widget _buildForm(BuildContext context) {
    return Wrap(
      runSpacing: AppDimensions.formSpacing,
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: [
              InputField(
                keyboardType: TextInputType.name,
                label: "Username",
                hintText: "Not your name",
                mandatory: true,
                validators: [
                  RequiredValidator(errorText: "Username required"),
                ],
                fieldController: _usernameFieldController,
              ),
              InputField(
                keyboardType: TextInputType.name,
                label: "Password",
                hintText: "Save it on a piece of paper",
                mandatory: true,
                isObscured: true,
                canToggleObscure: true,
                validators: [
                  RequiredValidator(errorText: "Password required"),
                ],
                fieldController: _passwordFieldController,
              ),
              PrimaryButton(
                  title: "Create account",
                  onPressed: _isRegisterButtonEnabled
                      ? _onCreateAccountPressed
                      : null),
            ],
          ),
        ),
      ],
    );
  }
}
