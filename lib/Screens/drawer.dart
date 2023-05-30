import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Smartphone.dart';
import 'package:flutter_application_2/Screens/cart.dart';
import 'package:flutter_application_2/Screens/cart_provider.dart';
import 'package:flutter_application_2/Screens/custom%20skin/brand.dart';
import 'package:flutter_application_2/Screens/custom_skin.dart';

import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/profile_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_application_2/Screens/create_account.dart';
import 'package:flutter_application_2/Screens/Laptop skins/laptop_category.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../auth.dart';

//import 'openslide.dart';

class mydrawer extends StatefulWidget {
  const mydrawer({super.key});

  @override
  State<mydrawer> createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/logo 3 removed.png",
                  ),
                  fit: BoxFit.cover),
            ),
            padding: EdgeInsets.all(0),
            child: Container(
              //color: Colors.black,
              child: Column(
                children: [
                  Text(
                    "",
                    style: TextStyle(
                        //color: Colors.white,
                        ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    _isHovering = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    _isHovering = false;
                  });
                },
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.orange,
                  ),
                  title: Text("Home", style: GoogleFonts.alef()),
                  tileColor: _isHovering ? Colors.orange : Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          if (user == null) SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person_add,
                  color: Colors.orange,
                ),
                title: Text("Create Account"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateAccountPage(),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person_2,
                  color: Colors.orange,
                ),
                title: Text("User Details"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => profilepage(),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.shopping_bag,
                  color: Colors.orange,
                ),
                title: Text("Cart"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => cartpage()),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                title: Text("Get Custom Skin"),
                leading: Icon(
                  Icons.upload_file,
                  color: Colors.orange,
                ),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => SkinCustomizationForm(
                  //     modelimage: '',
                  //     modelname: '',
                  //   ),
                  // ));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CustomSkinPage()));
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                  leading: Icon(
                    Icons.collections_outlined,
                    color: Colors.orange,
                  ),
                  title: Text("Skin Collection")),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                title: Text("Mobile Skins"),
                leading: Icon(
                  Icons.smartphone_sharp,
                  color: Colors.orange,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => smartphonecategory(),
                  ));
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                title: Text("Laptop Skins"),
                leading: Icon(
                  Icons.laptop,
                  color: Colors.orange,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => laptopcategory(),
                  ));
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          if (user != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  //border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // final auth =
                    //     Provider.of<AuthProvider>(context, listen: false);
                    // auth.logout();
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    _auth.signOut().then(
                      (_) {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        margin:
                            EdgeInsets.only(bottom: 720, left: 10, right: 10),
                        content: Row(
                          children: [
                            Text("Successfully Logged Out"),
                            SizedBox(width: 5),
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Icon(
                                  Icons.logout_rounded,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                ),
              ),
            ),
          SizedBox(height: 189.5),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Text(
                '© Layers Shop 2023',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
