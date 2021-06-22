import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:ts_app/components/primary_button.dart';
import 'package:ts_app/components/ui_components.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/dimension.dart';
import 'package:ts_app/general/font_styles.dart';
import 'package:ts_app/providers/cart_provider.dart';
import 'package:ts_app/screens/base_screen.dart';

class InfoScreen extends StatefulWidget {
  final cart;
  final sum;
  InfoScreen({this.cart, this.sum});

  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends BaseScreenState<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final key = new GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          top: false,
          child: Container(
              margin: const EdgeInsets.only(
                  top: AppDimensions.defaultPadding,
                  left: AppDimensions.defaultPadding,
                  right: AppDimensions.defaultPadding),
              child: SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: AppDimensions.headerSpacing),
                          buildHeader(title: "Order Instructions"),
                          Text(
                            "First, download Wickr from the store. \n Then create an account with the following username:",
                            style: FontStylez.bodyLight,
                            textAlign: TextAlign.center,
                          ),
                          SelectableText(
                            createUsername(),
                            style: FontStylez.bodyLightSelected,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: AppDimensions.mediumMargin,
                          ),
                          Text(
                            "Then, add the following contact:",
                            style: FontStylez.bodyLight,
                            textAlign: TextAlign.center,
                          ),
                          SelectableText(
                            giveUsername(),
                            style: FontStylez.bodyLightSelected,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: AppDimensions.mediumMargin,
                          ),
                          Text(
                            "Then send ONLY AND ONLY the following text:",
                            style: FontStylez.bodyLight,
                            textAlign: TextAlign.center,
                          ),
                          SelectableText(
                            cart.orderNumber,
                            style: FontStylez.bodyLightSelected,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: AppDimensions.mediumMargin,
                          ),
                          Text(
                            "(You will be given dead-drop location on Wickr)",
                            style: FontStylez.bodyLight,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: AppDimensions.mediumMargin,
                          ),
                          Text(
                            "Order total:",
                            style: FontStylez.bodyLight,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '\€${cart.totalAmount.toStringAsFixed(2)}',
                            style: FontStylez.bodyLightSelected,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: AppDimensions.mediumMargin,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.largeSpacing,
                      ),
                      PrimaryButton(
                        title: "Copy texts",
                        onPressed: () {
                          Clipboard.setData(new ClipboardData(
                            text: wholeText(cart.orderNumber.toString(),
                                cart.totalAmount.toStringAsFixed(2)),
                          ));
                          showSuccessToast("Items copied");
                        },
                      ),
                      SizedBox(
                        height: AppDimensions.largeSpacing,
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }

  String wholeText(String orderNumber, String amountToPay) {
    return "Username to create - " +
        createUsername() +
        "\n" +
        "Username to send to - " +
        giveUsername() +
        "\n" +
        "Message to send - " +
        orderNumber +
        "\n" +
        "Amount to pay in € (CALCULATE IN MONERO!)- " +
        amountToPay +
        "\n" +
        "Monero address to pay to ";
  }

  String createUsername() {
    var text = randomAlpha(1) +
        "t" +
        randomAlpha(2) +
        "7" +
        randomNumeric(3).toString();
    return text.toUpperCase();
  }

  String giveUsername() {
    var list = [
      'chien7355',
      'guerre7344',
      'voiture8851',
      'blanco3353',
      'urgent7890',
      'mauve5537',
      'hivers5799',
      'cintre7735',
      'agir6633',
      'loin1122'
    ];
    final _random = new Random();
    var element = list[_random.nextInt(list.length)];
    return element;
  }

  // String giveOrderNumber() {
  //   final cart = Provider.of<Cart>(context);
  //   var orderNumber = "00";

  //   for (var i = 0; i < cart.itemCount; i++) {
  //     orderNumber += cart.items.values.toList()[i].title.toString();
  //   }

  //   return orderNumber;
  // }
}
