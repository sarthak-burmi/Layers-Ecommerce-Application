import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Oneplus/OnePlus_Phones.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Realme/Realme.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/Samsung_phones.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iqoo/iqoo.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/oppo/oppo.dart';
//import 'package:flutter_application_2/Screens/Smartphone%20Pages/snack_bar.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/vivo/vivo.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/xiaomi/mi.dart';
import 'package:flutter_application_2/Screens/drawer.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/login_page.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/Screens/create_account.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone_%2014_pro_max_skin.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_2/Screens/Laptop skins/laptop_category.dart';

import '../Smartphone Pages/Nothing/nothing.dart';
import '../snackbar.dart';

class winlist extends StatelessWidget {
  const winlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mydrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey),
                child: IconButton(
                  icon: const Icon(Icons.more_horiz,
                      color: Colors.black // Change Custom Drawer Icon Color
                      ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text("Windows", style: GoogleFonts.roboto()),
        iconTheme: IconThemeData.fallback(),
      ),
      body: Column(
        children: [
          SizedBox(height: 5.0),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: 'Select Your\n',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  children: [
                    TextSpan(
                      text: 'Smartphone Brand',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.black),
                    height: 100,
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          SnackBarHelper.showMessage(context, 'Coming Soon');
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/mac/AsusLOGO.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero, color: Colors.black),
                    height: 100,
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          SnackBarHelper.showMessage(context, 'Coming Soon');
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/mac/Dell-Logo.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.black),
                    height: 100,
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          SnackBarHelper.showMessage(context, 'Coming Soon');
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/mac/Lenovo-Logo.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.black),
                    height: 100,
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          SnackBarHelper.showMessage(context, 'Coming Soon');
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/mac/mircosoft.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.black),
                    height: 100,
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          SnackBarHelper.showMessage(context, 'Coming Soon');
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/mac/hp_logo.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
