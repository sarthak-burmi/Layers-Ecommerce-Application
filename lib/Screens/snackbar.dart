import 'package:flutter/material.dart';

class SnackBarHelper {
  SnackBarHelper(String s);

  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
