import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/Smartphone%20Pages/Smartphone.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme.dart';
import 'Smartphone Pages/Samsung_Skins/Samsung_phones.dart';
import 'drawer.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  Timer? _timer;
  double _scrollOffset = 0.0;
  //final List<String> _listItems = List.generate(20, (index) => 'Item $index');
  bool _isScrolling = false;

  void initState() {
    super.initState();
    // Start the timer to auto-scroll the list every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_isScrolling) {
        return;
      }
      if (_scrollOffset < _scrollController.position.maxScrollExtent) {
        _isScrolling = true;
        _scrollToPosition(_scrollOffset + 200, Duration(seconds: 1));
      } else {
        _scrollToPosition(0, Duration(seconds: 1)); // Scroll back to the start
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer and dispose of the scroll controller when the widget is disposed
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToPosition(double offset, Duration duration) {
    _scrollController
        .animateTo(
      offset,
      duration: duration,
      curve: Curves.easeInOut,
    )
        .then((value) {
      _isScrolling = false;
      _scrollOffset = offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mydrawer(),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    // Change Custom Drawer Icon Color
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 45,
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => profilepage(),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Image(
              color: Colors.orange,
              image: ResizeImage(
                  AssetImage(
                    "assets/images/logo 3 removed.png",
                  ),
                  width: 150,
                  height: 130),
            ),
          ),
        ),
        iconTheme: IconThemeData.fallback(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First horizontal image slider for ads
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: ListView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset(
                      'assets/images/6.png',
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/1.jpg',
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/7.png',
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/8.png',
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  "Best Selling Mobile Skins",
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/14 pro max skin12.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Charcoal Black\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/14 pro max skin9.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Magma\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/14 pro max skin10.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Chaos\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Second horizontal image slider for highlighted products
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  "Marvel Exclusive Designs",
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset(
                      'assets/images/Marvel_Baner.png',
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    // Image.asset(
                    //   'assets/images/5.jpg',
                    //   width: 400,
                    //   fit: BoxFit.cover,
                    // ),
                  ],
                ),
                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: [
                //     ProductItem(
                //       name: 'Marvel Exclusive',
                //       image: 'assets/images/Marvel_Baner.png',
                //       price: '1099/- Onwards',
                //     ),
                //     ProductItem(
                //       name: '3D Texture Layer',
                //       image: 'assets/images/5.jpg',
                //       price: '499/- Onwards',
                //     ),
                //   ],
                // ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/14 pro max skin13.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Iron Man Gaze\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/14 pro max skin15.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Iron Man in Action\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/14 pro max skin14.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Wolverine On Bike\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  "Best Selling Laptop Skins",
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/macbook skin2.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Wolfgang\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/macbook skin3.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Pink Aesthetic\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/macbook skin4.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Black Leather\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => smartphonecategory(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TAppTheme.containerColor(context),
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
                              "assets/images/macbook skin5.png",
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "\nStarting At 699",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Text(
                            //   "₹599",
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor:
                            //         Colors.orange, // Background color
                            //   ),
                            //   child: Text(
                            //     "Buy Now",
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => samsungpage()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 400,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/HomeScreen Bottom.png')
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: 500,
                padding: EdgeInsets.all(16),
                color: Colors.black,
                child: Center(
                  child: Text(
                    '© Layers Shop 2023',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  ProductItem({
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            price,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
