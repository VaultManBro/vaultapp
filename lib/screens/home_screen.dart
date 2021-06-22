import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/components/ui_components.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/dimension.dart';
import 'package:ts_app/general/font_styles.dart';
import 'package:ts_app/models/product_model.dart';
import 'package:ts_app/providers/cart_provider.dart';
import 'package:ts_app/screens/base_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<ProductModel> cart;
  final int sum;

  HomeScreen({this.cart, this.sum});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  List<ProductModel> products = [
    ProductModel(
        "x", 'Fishscale Cocaine', 1375, 25, 'assets/business_plan.jpg', 25, 1),
    ProductModel(
        "y", 'Fishscale Cocaine', 2750, 50, 'assets/business_plan.jpg', 50, 1),
    ProductModel("z", 'Fishscale Cocaine', 5500, 100,
        'assets/business_plan.jpg', 100, 1),
  ];

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
            child: Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(height: AppDimensions.headerSpacing),
                  buildHeader(
                      title: "Home", subtitle: "Add items to shopping cart"),
                  SizedBox(height: AppDimensions.headerSpacing),
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _buildCard(
                            products[index].id,
                            products[index].name,
                            products[index].price,
                            products[index].quantity,
                            products[index].picture,
                            index,
                            products[index].pieces,
                            products[index].myNum,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: products.length),
                  ),
                  SizedBox(height: AppDimensions.mediumSpacing),
                  SizedBox(height: AppDimensions.smallMargin),
                ])),
          ),
        ));
  }

  Widget _buildCard(String productId, String name, double price, int quantity,
      String imgPath, int index, int pieces, int myNum) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onDoubleTap: () {
              Provider.of<Cart>(context, listen: false)
                  .addItem(productId, price, name, quantity, pieces, myNum);
              showSuccessToast("Item added to cart.");
            },
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
                child: Column(children: [
                  Hero(
                      tag: price.toString() + quantity.toString(),
                      child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text("\€${price.toString()}", style: FontStylez.bodyLight),
                  Text(name, style: FontStylez.bodyLight),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(quantity.toString() + " g",
                                style: FontStylez.bodyLightSelected),
                            GestureDetector(
                                child: Icon(Icons.add_circle_outline,
                                    color: AppColors.primaryAccent, size: 12.0),
                                onTap: () {
                                  showSuccessToast("Item added to cart.");
                                  Provider.of<Cart>(context, listen: false)
                                      .addItem(productId, price, name, quantity,
                                          pieces, myNum);
                                }),
                          ])),
                ]))));
  }
}
