import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final int pieces;
  final int myNum;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    @required this.pieces,
    @required this.myNum,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get pieces {}

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.pieces + cartItem.price * cartItem.quantity;
    });
    return total;
  }

  String get orderNumber {
    String total = "";
    _items.forEach((key, cartItem) {
      total += cartItem.myNum.toString() + cartItem.id;
    });
    return total + totalAmount.toInt().toString();
  }

  void addItem(String productId, double price, String title, int quantity,
      int pieces, int myNum) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingValue) => CartItem(
          id: productId,
          title: existingValue.title,
          price: existingValue.price,
          quantity: existingValue.quantity + 1,
          pieces: pieces,
          myNum: existingValue.myNum + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: productId,
            price: price,
            title: title,
            quantity: 1,
            pieces: pieces,
            myNum: 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
          pieces: pieces,
          myNum: existingCartItem.myNum - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
