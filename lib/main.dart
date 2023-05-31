import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/cart_provider.dart';

import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/login_page.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_application_2/Screens/openslide.dart';
import 'package:flutter_application_2/Screens/cart.dart';

import 'firebase_options.dart';
import 'package:provider/provider.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.black,
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.white,
);
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
    //final User user;
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.light(),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
          ),
        ),
        //theme: TAppTheme.lightTheme,
        // theme: ThemeData(
        //   useMaterial3: true,
        // ),
        //darkTheme: TAppTheme.darkTheme,
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          drawerTheme: DrawerThemeData().copyWith(
            backgroundColor: kDarkColorScheme.background,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
                titleSmall: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kDarkColorScheme.onSecondaryContainer,
                ),
              ),
        ),
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
