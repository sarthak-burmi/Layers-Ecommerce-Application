import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/cart_model.dart';
import 'package:flutter_application_2/Screens/drawer.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/login_page.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/Screens/create_account.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/iPhone_Skins/iPhone_%2014_pro_max_skin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_2/Screens/Laptop skins/laptop_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../cart.dart';
import '../../cart_provider.dart';

class Skin {
  final String name;
  final String image;
  final double amount;

  Skin({
    required this.name,
    required this.image,
    required this.amount,
  });
  String getFormattedPrice() {
    var rupeeFormat = NumberFormat.currency(symbol: '₹');
    return rupeeFormat.format(amount);
  }
}

NumberFormat priceFormat = NumberFormat.currency(symbol: '₹');

class iphone12promaxskinpage extends StatefulWidget {
  @override
  _iphone12promaxskinpageState createState() => _iphone12promaxskinpageState();
}

class _iphone12promaxskinpageState extends State<iphone12promaxskinpage>
    with TickerProviderStateMixin {
  late Skin selectedSkin;
  final List<Skin> _skins = [
    Skin(
        name: 'iPhone 12 Pro Max',
        image: 'assets/images/14 pro max.png',
        amount: 000),
    Skin(
        name: 'iPhone 14 Pro Max Astro Rainbow',
        image: 'assets/images/14 pro max skin1.png',
        amount: 999),
    Skin(
        name: 'iPhone 14 Pro Max Empowher',
        image: 'assets/images/14 pro max skin2.png',
        amount: 1499),
    Skin(
        name: 'iPhone 14 Pro Max Florescence',
        image: 'assets/images/14 pro max skin3.png',
        amount: 1999),
    Skin(
        name: 'iPhone 14 Pro Max Spaceboy',
        image: 'assets/images/14 pro max skin4.png',
        amount: 1999),
    Skin(
        name: 'iPhone 14 Pro Max Iron Man For Duty',
        image: 'assets/images/14 pro max skin5.png',
        amount: 599),
  ];

  @override
  void initState() {
    super.initState();
    selectedSkin = _skins[0];
  }

  void _onSkinSelected(Skin skin) {
    setState(() {
      selectedSkin = skin;
    });
  }

  bool get isDefault => selectedSkin == (_skins[0]);
  @override
  Widget build(BuildContext context) {
    final _animationController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    return Scaffold(
      drawer: mydrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(000000).withOpacity(0.3),
        title: Text("Apple", style: GoogleFonts.roboto()),
        iconTheme: IconThemeData.fallback(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "",
                style: GoogleFonts.lato(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /* Row 1 /////////////////////////////////// */

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 450,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              //color: Colors.white,
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => _onSkinSelected(_skins[0]),
                          child: Image.asset(
                            selectedSkin.image,
                            width: 200,
                            height: 400,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),

            //////////// ROW2 ///////////////////
            ///
            ///
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
              child: Container(
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        selectedSkin.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //////////// ROW3 ///////////////////
            ///
            ///
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        selectedSkin.getFormattedPrice(),
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),

            /* Row 2 /////////////////////////////////// */

            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/Skin1.png",
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSkin = _skins[1];
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Skin2.png"),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSkin = _skins[2];
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Skin3.png"),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSkin = _skins[3];
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Skin4.png"),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSkin = _skins[4];
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Skin5.png"),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSkin = _skins[5];
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(width: 10),
                ],
              ),
            ),

            /* Row 3 /////////////////////////////////// */

            SizedBox(height: 20),
            SizedBox(height: 10),
            Container(
              width: 350,
              child: ElevatedButton.icon(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Background color
                ),
                label: Text(
                  'BUY NOW!!',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 350,
              child: OutlinedButton.icon(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  if (isDefault) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.red,
                        title: const Text("Invaild Input"),
                        content: const Text(
                          "Please make sure you Have Selected a Skin To Proceed",
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: const Text(
                              "OK",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.green,
                        title: const Text("Sucessfully Added To Cart"),
                        // content: const Text(
                        //   "Please make sure you Have Selected a Skin To Proceed",
                        // ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: const Text(
                              "OK",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => cartpage()));
                            },
                            child: const Text(
                              "View Cart",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                        icon: const Icon(
                          Icons.check,
                          color: Colors.black,
                        ),
                      ),
                    );
                    CartItem item = CartItem(
                        name: selectedSkin.name,
                        image: selectedSkin.image,
                        amount: selectedSkin.amount);

                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(item);
                  }
                  // Flushbar(
                  //   message: 'This is a flushbar',
                  //   duration: Duration(seconds: 3),
                  //   flushbarPosition: FlushbarPosition.TOP,
                  //   icon: Icon(Icons.info),
                  //   borderRadius: 10,
                  // ).show(context);
                  // if (isDefault) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       animation: CurvedAnimation(
                  //         parent: _animationController,
                  //         curve: Curves.easeInCirc,
                  //       ),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //       backgroundColor: Colors.red,
                  //       behavior: SnackBarBehavior.floating,
                  //       margin:
                  //           EdgeInsets.only(bottom: 720, left: 10, right: 10),
                  //       content: Row(
                  //         children: [
                  //           Text("Select A Skin to Proceed"),
                  //           SizedBox(width: 5),
                  //           CircleAvatar(
                  //               backgroundColor: Colors.white,
                  //               radius: 12,
                  //               child: Icon(
                  //                 Icons.block_sharp,
                  //                 color: Colors.red,
                  //               )),
                  //         ],
                  //       ),
                  //       duration: Duration(seconds: 3),
                  //     ),
                  //   );
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       animation: CurvedAnimation(
                  //         parent: _animationController,
                  //         curve: Curves.easeInCirc,
                  //       ),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //       backgroundColor: Colors.green,
                  //       behavior: SnackBarBehavior.floating,
                  //       margin:
                  //           EdgeInsets.only(bottom: 720, left: 10, right: 10),
                  //       content: Row(
                  //         children: [
                  //           Text("Skin Added to Cart"),
                  //           SizedBox(width: 5),
                  //           CircleAvatar(
                  //               backgroundColor: Colors.white,
                  //               radius: 12,
                  //               child: Icon(
                  //                 Icons.check,
                  //                 color: Colors.green,
                  //               )),
                  //         ],
                  //       ),
                  //       duration: Duration(seconds: 3),
                  //     ),
                  //   );

                  //   CartItem item = CartItem(
                  //       name: selectedSkin.name,
                  //       image: selectedSkin.image,
                  //       amount: selectedSkin.amount);

                  //   Provider.of<CartProvider>(context, listen: false)
                  //       .addToCart(item);
                  // }
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.orange, width: 1),
                ),
                label:
                    Text("Add To Cart", style: TextStyle(color: Colors.orange)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
