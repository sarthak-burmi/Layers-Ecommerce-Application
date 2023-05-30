import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/s21%20FE.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/s21%20ultra.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/s22%20ultra.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/s22.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/s22plus.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/s23%20plus.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/s23%20ultra.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Samsung_Skins/s23.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Smartphone.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/xiaomi/note10promax.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/xiaomi/note11proplus.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/xiaomi/note8pro.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/xiaomi/note9pro.dart';
import 'package:flutter_application_2/Screens/drawer.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/login_page.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/Screens/create_account.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone_%2014_pro_max_skin.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone_13_pro_max_skin.dart';
import 'package:flutter_application_2/Screens/Smartphone Pages/iPhone_Skins/iPhone_13_pro_skin.dart';
import 'package:flutter_application_2/Screens/Smartphone Pages/iPhone_Skins/iPhone_14_pro_skin.dart';
import 'package:flutter_application_2/Screens/Smartphone Pages/iPhone_Skins/iPhone_14_plus_skin.dart';
import 'package:flutter_application_2/Screens/Smartphone Pages/iPhone_Skins/iPhone_13_skin.dart';

import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone_14_Skins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_2/Screens/Laptop skins/laptop_category.dart';

class miphns extends StatelessWidget {
  miphns({super.key});

  final List<Map> iphonemodels =
      List.generate(100, (index) => {"name": "Product $index"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mydrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text("XIAOMI", style: GoogleFonts.roboto()),
        iconTheme: IconThemeData.fallback(),
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
                builder: (context) => smartphonecategory(),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Select Yo',
                style: GoogleFonts.lato(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
                children: [
                  TextSpan(
                    text: 'ur Model',
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            //Row 1////////////////////////////////////////////////////////

            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(width: 30),
                      Container(
                        width: 175,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 15,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: InkWell(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => note8pro(),
                              ));
                            },
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                  "assets/images/redmi/8pro.png",
                                ),
                                width: 600,
                                height: 600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Redmi Note 8 Pro",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 175,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 15,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: InkWell(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => note9pro(),
                              ));
                            },
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                  "assets/images/redmi/9pro.png",
                                ),
                                width: 600,
                                height: 600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Redmi Note 9 Pro",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),

            ////////////////////Row 2////////////////////////

            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 175,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 15,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: InkWell(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => note10promax(),
                              ));
                            },
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                  "assets/images/redmi/10promax.png",
                                ),
                                width: 600,
                                height: 600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Redmi Note 10 Pro Max",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 175,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 15,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: InkWell(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => note11proplus(),
                              ));
                            },
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                  "assets/images/redmi/11proplus.png",
                                ),
                                width: 600,
                                height: 600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Redmi Note 11 Pro Plus",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
