import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;
  //double get totalamt => _totalamt;

  double get totalcartamt {
    double totalamt = 0.0;
    _cartItems.forEach((item) {
      totalamt = totalamt + item.amount * item.quantity;
    });
    return totalamt;
  }

  Future<void> addToCart(CartItem item) async {
    //_cartItems.add(item);
    int index = _cartItems.indexWhere((cartItem) => cartItem.name == item.name);

    if (index != -1) {
      // Item already exists in the cart, increase the quantity
      _cartItems[index].quantity++;
    } else {
      // Item is not in the cart, add it as a new item
      _cartItems.add(item);
    }

    //_totalamt = _totalamt + item.amount;
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    //_totalamt = _totalamt - item.amount;
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void increaseQuantity(CartItem cartItem) {
    cartItem.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      notifyListeners();
    }
  }
}
