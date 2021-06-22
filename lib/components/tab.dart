import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ts_app/general/routes.dart';

enum TabItem { home, cart, info }

extension TabItemExtension on TabItem {
  static List<TabItem> get allTabs =>
      [TabItem.home, TabItem.cart, TabItem.info];

  int index() {
    return TabItemExtension.allTabs.indexOf(this);
  }

  static TabItem fromRawValue(int rawValue) {
    switch (rawValue) {
      case 0:
        return TabItem.home;
      case 1:
        return TabItem.cart;
      case 2:
        return TabItem.info;

      default:
        return null;
    }
  }

  String label(BuildContext context) {
    var textRes = '';

    switch (this) {
      case TabItem.home:
        textRes = 'home';
        break;
      case TabItem.cart:
        textRes = 'cart';
        break;
      case TabItem.info:
        textRes = 'info';
        break;
      default:
        break;
    }

    return textRes;
  }

  Widget icon(BuildContext context, {Color color}) {
    switch (this) {
      case TabItem.home:
        return Icon(Icons.home, color: color);
      case TabItem.cart:
        return Icon(Icons.menu_book, color: color);
      case TabItem.info:
        return Icon(Icons.info, color: color);
      default:
        return null;
    }
  }

  String rootRouteName() {
    switch (this) {
      case TabItem.home:
        return Routes.home;
      case TabItem.cart:
        return Routes.order;
      case TabItem.info:
        return Routes.info;
      default:
        return null;
    }
  }
}
