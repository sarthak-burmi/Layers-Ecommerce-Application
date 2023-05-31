import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/Screens/buynowpage.dart';
import 'package:flutter_application_2/Screens/drawer.dart';
import 'package:flutter_application_2/Screens/home_page.dart';

import 'package:flutter_application_2/Screens/create_account.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/cart_model.dart';
import 'cart_provider.dart';

// class smartphoneskin {
//   final String name;
//   final String image;
//   final int amount;

//   smartphoneskin({
//     required this.name,
//     required this.image,
//     required this.amount,
//   });
//   String getFormattedPrice() {
//     var rupeeFormat = NumberFormat.currency(symbol: '₹');
//     return rupeeFormat.format(amount);
//   }
// }

NumberFormat priceFormat = NumberFormat.currency(symbol: '₹');

class cartpage extends StatefulWidget {
  const cartpage({super.key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(35),
                  child: Image.asset(
                    "assets/images/no_user_cart.png",
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: RichText(
                        text: TextSpan(
                          text: 'Please Login to ',
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 79, 59, 171),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          children: [
                            TextSpan(
                              text: 'access Your Cart',
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: SizedBox(
                          width: 190,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Color.fromARGB(255, 79, 59, 171),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 250,
                        height: 40,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Text(
                            'Back to Home Screen',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 79, 59, 171),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CreateAccountPage(),
                          ),
                        );
                      },
                      child: Text(
                        "New User? Click Here to Create Account",
                        style: TextStyle(
                          color: Color.fromARGB(255, 79, 59, 171),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    final bool canAddToCart = cartProvider.totalcartamt > 0;
    final totalamount = cartProvider.totalcartamt;
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
      body: Column(
        children: [
          Container(
            width: 400,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "Your ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    children: [
                      TextSpan(
                        text: 'Cart',
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
          ),
          SizedBox(height: 8),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                List<CartItem> cartItems = cartProvider.cartItems;
                if (cartItems.isEmpty) {
                  return Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Your ',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        children: [
                          TextSpan(
                            text: 'Cart Is Empty',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container(
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
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Container(
                          child: ListTile(
                            title: Text(cartItems[index].name),
                            subtitle: Text(cartItems[index].amount.toString()),
                            leading: Image.asset(cartItems[index].image),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    cartProvider.decreaseQuantity(cartItem);
                                  },
                                ),
                                Text(cartItem.quantity.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    cartProvider.increaseQuantity(cartItem);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    cartProvider.removeFromCart(cartItem);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: canAddToCart
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => buynowpage(
                                      totalAmt: cartProvider.totalcartamt,
                                      image: '',
                                      name: '',
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // Background color
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'Proceed To ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: 'Check Out',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        // ElevatedButton(

                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => buynowpage(
                        //           totalAmt: cartProvider.totalcartamt,
                        //           image: '',
                        //           name: '',
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   child: RichText(
                        //     text: TextSpan(
                        //       text: 'Proceed To ',
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 20),
                        //       children: [
                        //         TextSpan(
                        //           text: 'Check Out',
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 20),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Total Cart Amount - $totalamount",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          )
        ],
      ),
    );
  }
}
