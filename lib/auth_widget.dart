import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/login_page.dart';
import 'package:provider/provider.dart';
import 'auth.dart';

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        if (auth.isAuthenticated) {
          return HomePage();
        } else {
          return loginPage();
        }
      },
    );
  }
}
