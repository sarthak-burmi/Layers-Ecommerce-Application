import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../models/cart_model.dart';
import '../../cart_provider.dart';
import 'iPhone.dart';

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

class iphone13proskinpage extends StatefulWidget {
  const iphone13proskinpage({super.key});

  @override
  State<iphone13proskinpage> createState() => _iphone13proskinpageState();
}

class _iphone13proskinpageState extends State<iphone13proskinpage>
    with TickerProviderStateMixin {
  late Skin _selectedSkin;
  final List<Skin> _skins = [
    Skin(
        name: 'iPhone 13 Pro',
        image: 'assets/images/14 pro max.png',
        amount: 000),
    Skin(
        name: 'iPhone 13 Pro Astro Rainbow',
        image: 'assets/images/14 pro max skin1.png',
        amount: 9.99),
    Skin(
        name: 'iPhone 13 Pro Empowher',
        image: 'assets/images/14 pro max skin2.png',
        amount: 14.99),
    Skin(
        name: 'iPhone 13 Pro Florescence',
        image: 'assets/images/14 pro max skin3.png',
        amount: 19.99),
    Skin(
        name: 'iPhone 13 Pro Spaceboy',
        image: 'assets/images/14 pro max skin4.png',
        amount: 1999),
    Skin(
        name: 'iPhone 13 Pro Iron Man For Duty',
        image: 'assets/images/14 pro max skin5.png',
        amount: 599),
  ];

  @override
  void initState() {
    super.initState();
    _selectedSkin = _skins[0];
  }

  void _onSkinSelected(Skin skin) {
    setState(() {
      _selectedSkin = skin;
    });
  }

  bool get isDefault => _selectedSkin == (_skins[0]);
  @override
  Widget build(BuildContext context) {
    final _animationController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
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
                builder: (context) => iphonepage(),
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text("Apple", style: GoogleFonts.roboto()),
        iconTheme: IconThemeData.fallback(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
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
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              //color: Colors.white,
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => _onSkinSelected(_skins[0]),
                          child: Image.asset(
                            _selectedSkin.image,
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
            Text.rich(
              TextSpan(
                text: _selectedSkin.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                children: <InlineSpan>[
                  TextSpan(text: '\n'),
                  TextSpan(
                    text: _selectedSkin.getFormattedPrice(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
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
                          _selectedSkin = _skins[1];
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
                          _selectedSkin = _skins[2];
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
                          _selectedSkin = _skins[3];
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
                          _selectedSkin = _skins[4];
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
                          _selectedSkin = _skins[5];
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
                icon: Icon(Icons.shopping_cart, color: Colors.black),
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
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.orange,
                ),
                onPressed: () {
                  // Flushbar(
                  //   message: 'This is a flushbar',
                  //   duration: Duration(seconds: 3),
                  //   flushbarPosition: FlushbarPosition.TOP,
                  //   icon: Icon(Icons.info),
                  //   borderRadius: 10,
                  // ).show(context);
                  if (isDefault) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        animation: CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInCirc,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        margin:
                            EdgeInsets.only(bottom: 720, left: 10, right: 10),
                        content: Row(
                          children: [
                            Text("Select A Skin to Proceed"),
                            SizedBox(width: 5),
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 12,
                                child: Icon(
                                  Icons.block_sharp,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        animation: CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInCirc,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        margin:
                            EdgeInsets.only(bottom: 720, left: 10, right: 10),
                        content: Row(
                          children: [
                            Text("Skin Added to Cart"),
                            SizedBox(width: 5),
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 12,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );

                    CartItem item = CartItem(
                        name: _selectedSkin.name,
                        image: _selectedSkin.image,
                        amount: _selectedSkin.amount);

                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(item);
                  }
                  ;
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.orange, width: 1),
                ),
                label:
                    Text("Add To Cart", style: TextStyle(color: Colors.orange)),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 30, 40, 30),
                  child: RichText(
                    text: TextSpan(
                      text: 'Realted To Your',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      children: [
                        TextSpan(
                          text: ' Selected Product',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Image.asset(
                          //   "assets/images/s23 ultra marvel skin1.png",
                          //   width: 120,
                          //   height: 120,
                          //   fit: BoxFit.cover,
                          // ),
                          SizedBox(height: 5),
                          Text(
                            "Samsung S23 Ultra \n Dr Strange",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "₹599",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.orange, // Background color
                            ),
                            child: Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              // Add your buy now functionality here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 160,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/14 pro max skin6.png",
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "iPhone 14 Pro Max \n Captain America",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "₹599",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.orange, // Background color
                            ),
                            child: Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              // Add your buy now functionality here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/14 pro max skin7.png",
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "iPhone 14 pro Max \n Wolverine On Bike",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "₹599",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.orange, // Background color
                            ),
                            child: Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              // Add your buy now functionality here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}