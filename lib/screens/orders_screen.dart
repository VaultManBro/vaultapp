import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/components/primary_button.dart';
import 'package:ts_app/components/ui_components.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/dimension.dart';
import 'package:ts_app/general/font_styles.dart';
import 'package:ts_app/general/routes.dart';
import 'package:ts_app/providers/cart_provider.dart';
import 'package:ts_app/screens/base_screen.dart';

class OrdersScreen extends StatefulWidget {
  final cart;
  final sum;
  OrdersScreen({this.cart, this.sum});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends BaseScreenState<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
              top: AppDimensions.defaultPadding,
              left: AppDimensions.defaultPadding,
              right: AppDimensions.defaultPadding),
          child: Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(height: AppDimensions.headerSpacing),
                buildHeader(title: "Orders in cart"),
                SizedBox(height: AppDimensions.headerSpacing),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (context, i) => _buildCard(
                        cart.items.values.toList()[i].id,
                        cart.items.values.toList()[i].title,
                        cart.items.values.toList()[i].price,
                        cart.items.values.toList()[i].quantity,
                        cart.items.values.toList()[i].pieces,
                        i),
                  ),
                ),
                SizedBox(height: AppDimensions.smallSpacing),
                PrimaryButton(
                    color: AppColors.secondaryAccent,
                    title: "Clear Cart",
                    onPressed: () {
                      cart.clear();
                      showInfoToast("Cart cleared.");
                    }),
                SizedBox(height: AppDimensions.smallMargin),
                Divider(),
                Text(
                  '\€${cart.totalAmount.toStringAsFixed(2)}',
                ),
                SizedBox(height: AppDimensions.smallSpacing),
                PrimaryButton(
                    title: "Checkout",
                    onPressed: () {
                      Routes.pushRouteNamed(context, Routes.info);
                    }),
                SizedBox(height: AppDimensions.mediumMargin),
              ])),
        ),
      ),
    );
  }

  isCartEmpty(double amount) {
    if (amount == 0)
      return true;
    else
      return false;
  }

  Widget _buildCard(
    String id,
    String name,
    double price,
    int quantity,
    int pieces,
    int index,
  ) {
    return Container(
      height: 50,
      child: Padding(
          padding:
              EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          child: InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          (AppDimensions.buttonCornerRadius)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text("${pieces.toString()} x",
                            style: FontStylez.bodyLight),
                        Text(name, style: FontStylez.bodyLight),
                        Text("="),
                        Text("\€${price.toString()}",
                            style: FontStylez.bodyLight),
                        // Text("---"),
                        // Text(getText(price, pieces),
                        //     style: FontStylez.bodyLight),
                      ])))),
    );
  }

  String getText(double price, int pieces) {
    var calculated = (price / pieces);
    return " \( ≈  \€ ${calculated.toString()}\/piece \) ";
  }
}
