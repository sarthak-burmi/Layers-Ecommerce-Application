import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone_%2014_pro_max_skin.dart';
import 'package:flutter_application_2/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];
  bool _cartIsEmpty = false;

  List<CartItem> get cartItems => _cartItems;
  //double get totalamt => _totalamt;

  double get totalcartamt {
    double totalamt = 0.0;
    _cartItems.forEach((item) {
      totalamt = totalamt + item.amount;
    });
    return totalamt;
  }

  Future<void> addToCart(CartItem item) async {
    _cartItems.add(item);
    _cartIsEmpty = false;
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
}
