import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone_%2014_pro_max_skin.dart';
import 'package:flutter_application_2/Screens/cart_provider.dart';

import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/login_page.dart';
import 'package:flutter_application_2/Screens/signIn.dart';
import 'package:flutter_application_2/Screens/create_account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_application_2/auth_widget.dart';
import 'package:flutter_application_2/theme/theme.dart';
import 'package:flutter_application_2/Screens/openslide.dart';
import 'package:flutter_application_2/Screens/cart.dart';
import 'Screens/Smartphone Pages/Samsung_Skins/Samsung_phones.dart';
import 'auth.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/Screens/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Spotify());
}

class Spotify extends StatefulWidget {
  const Spotify({super.key});

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  User? user; // variable to hold user information

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    user = await auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    final User user;
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TAppTheme.lightTheme,
        // theme: ThemeData(
        //   useMaterial3: true,
        // ),
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,

        //fontFamily: GoogleFonts.lato().fontFamily,

        //darkTheme: ThemeData(
        //brightness: Brightness.dark,
        //),

        //initialRoute: "/login",

        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return IntroPage();
            } else if (snapshot.hasData && snapshot.data != null) {
              final User user = snapshot.data!;
              return HomePage();
            } else {
              return PageView(
                children: [
                  IntroPage(),
                  loginPage(),
                ],
              );
            }
          },
        ),
        routes: {
          "intropage": (context) => IntroPage(),
          "/login": (context) => loginPage(),
          "/home": (context) => HomePage(),
          '/cart': (context) => cartpage(),
          // "/intro": (context) => IntroPage(),
        },
      ),
    );
  }
}

// enum paymentoption { SelectOption, GooglePay, Paytm, Paypal }
