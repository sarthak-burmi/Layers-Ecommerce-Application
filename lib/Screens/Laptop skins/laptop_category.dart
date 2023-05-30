import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/Screens/Laptop%20skins/win_list.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone.dart';
import 'package:flutter_application_2/Screens/drawer.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/login_page.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/Screens/create_account.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone_%2014_pro_max_skin.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mac_list.dart';

class laptopcategory extends StatelessWidget {
  const laptopcategory({super.key});

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
        title: Text("Laptop Skins", style: GoogleFonts.roboto()),
        iconTheme: IconThemeData.fallback(),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                "Select Your Brand",
                style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            //color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.white70),
                    height: 80,
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => maclist(),
                          ));
                        },
                        child: Image(
                          image: AssetImage(
                            "assets/images/macbook_logo.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            //color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.white70),
                    height: 80,
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => winlist(),
                          ));
                        },
                        child: Image(
                          color: Color.fromARGB(255, 0, 0, 0),
                          image: AssetImage(
                            "assets/images/windows-logo.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         boxShadow: [
                //           BoxShadow(
                //             blurRadius: 4.0,
                //             //color: Colors.grey,
                //           ),
                //         ],
                //         borderRadius: BorderRadius.circular(100),
                //         color: Colors.white70),
                //     height: 80,
                //     child: const Center(
                //       child: Image(
                //         color: Color.fromARGB(255, 0, 0, 0),
                //         image: AssetImage("assets/images/windows-logo.png"),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
