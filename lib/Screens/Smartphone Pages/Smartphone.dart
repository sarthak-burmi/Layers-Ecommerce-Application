import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Oneplus/OnePlus_Phones.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Realme/Realme.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/Samsung_phones.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/oppo/oppo.dart';
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

import '../../theme/theme.dart';
import 'Nothing/nothing.dart';
import 'iqoo/iqoo.dart';

class smartphonecategory extends StatelessWidget {
  const smartphonecategory({super.key});

  @override
  Widget build(BuildContext context) {
    String? _selectedbrand;
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
        title: Text("Mobile Skins", style: GoogleFonts.roboto()),
        iconTheme: IconThemeData.fallback(),
      ),
      body: Column(
        children: [
          SizedBox(height: 5.0),
          Container(
            //color: TAppTheme.containerColor(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: 'Select Your\n',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                  //TextStyle(
                  //     color: Colors.orange,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 30),
                  children: [
                    TextSpan(
                      text: 'Smartphone Brand',
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.black,
                    ),
                    height: 100,
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          _selectedbrand = 'iphone';
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => iphonepage(),
                          ));
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/apple logo.png",
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => samsungpage(),
                          ));
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/Samsung logo.png",
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => onepluspage(),
                          ));
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/oneplus_logo.png",
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => nothingphone(),
                          ));
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/Nothing_Logo.png",
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => iqoophonelist(),
                          ));
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/iqoo_logo.png",
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => oppophns(),
                          ));
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/Oppo-Logo.wine.png",
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => realmephns(),
                          ));
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/realme logo.png",
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => vivophns(),
                          ));
                        },
                        child: Image(
                          color: Colors.white,
                          image: AssetImage(
                            "assets/images/vivo.png",
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => miphns(),
                          ));
                        },
                        child: Image(
                          //color: Colors.white,
                          image: AssetImage(
                            "assets/images/mi logo.png",
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
