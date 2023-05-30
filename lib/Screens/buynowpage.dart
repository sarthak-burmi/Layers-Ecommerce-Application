import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'cart.dart';
import 'drawer.dart';

class buynowpage extends StatefulWidget {
  final double totalAmt;
  final String name;
  final String image;
  const buynowpage(
      {Key? key,
      required this.totalAmt,
      required this.name,
      required this.image})
      : super(key: key);

  @override
  _BuyNowPageState createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<buynowpage> {
  String getFormattedPrice() {
    var rupeeFormat = NumberFormat.currency(symbol: '₹');
    return rupeeFormat.format(widget.totalAmt);
  }

  String? _selectedOption;

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
                builder: (context) => cartpage(),
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Image(
              image: ResizeImage(AssetImage("assets/images/logo 3 removed.png"),
                  width: 150, height: 130),
            ),
          ),
        ),
        iconTheme: IconThemeData.fallback(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Select Payment ',
                    style: GoogleFonts.lato(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    children: [
                      TextSpan(
                        text: 'GateWay',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      // TextSpan(
                      //   text: widget.name,
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 30),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 350,
              height: 35,
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: 'Your total ',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    children: [
                      TextSpan(
                        text: 'Amount is - ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      TextSpan(
                        text: getFormattedPrice(),
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Consumer<CartProvider>(
            //     builder: (context, cartProvider, child) {
            //       List<CartItem> cartItems = cartProvider.cartItems;
            //       if (cartItems.isEmpty) {
            //         return Center(
            //           child: RichText(
            //             text: TextSpan(
            //               text: 'Your ',
            //               style: TextStyle(
            //                   color: Colors.orange,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 30),
            //               children: [
            //                 TextSpan(
            //                   text: 'Cart Is Empty',
            //                   style: TextStyle(
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 30),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       } else {
            //         // return Container(
            //         //   decoration: BoxDecoration(
            //         //     borderRadius: BorderRadius.circular(10),
            //         //     color: Colors.white,
            //         //     boxShadow: [
            //         //       BoxShadow(
            //         //         color: Colors.grey.withOpacity(0.5),
            //         //         blurRadius: 5,
            //         //         offset: Offset(0, 3),
            //         //       ),
            //         //     ],
            //         //   ),
            //         return ListView.builder(
            //           itemCount: cartItems.length,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               title: Row(
            //                 children: [
            //                   Text(cartItems[index].name),
            //                 ],
            //               ),
            //               subtitle: Text(cartItems[index].amount.toString()),
            //             );
            //             // return ListTileTheme(
            //             //   dense: true,
            //             //   child: ListTile(
            //             //     title: Text(cartItems[index].name),
            //             //     subtitle: Text(cartItems[index].amount.toString()),
            //             //     //leading: Image.asset(cartItems[index].image),
            //             //   ),
            //             // );
            //           },
            //           //),
            //         );
            //       }
            //     },
            //   ),
            // ),
            SizedBox(height: 16.0),
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 2.0,
                        color: _selectedOption == 'GooglePay'
                            ? Colors.orange
                            : Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RadioListTile<String>(
                      title: const Text('GooglePay'),
                      value: 'GooglePay',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                      secondary: Image.asset(
                        'assets/images/google_logo.png', // replace with your image path
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 2.0,
                        color: _selectedOption == 'Paytm'
                            ? Colors.orange
                            : Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RadioListTile<String>(
                      title: const Text('Paytm'),
                      value: 'Paytm',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                      secondary: Image.asset(
                        'assets/images/paytm_logo.png', // replace with your image path
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 2.0,
                        color: _selectedOption == 'PayPal'
                            ? Colors.orange
                            : Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RadioListTile<String>(
                      title: const Text('PayPal'),
                      value: 'PayPal',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                      secondary: Image.asset(
                        'assets/images/paypal_logo.png', // replace with your image path
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 2.0,
                        color: _selectedOption == 'PhonePay'
                            ? Colors.orange
                            : Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RadioListTile<String>(
                      title: const Text('PhonePay'),
                      value: 'PhonePay',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                      secondary: Image.asset(
                        'assets/images/phonepe_logo.png', // replace with your image path
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectedOption == null
                  ? null
                  : () {
                      //print('Selected payment option: $_selectedOption');
                      // Add your code to proceed to payment here
                    },
              child: RichText(
                text: TextSpan(
                  text: 'Proceed To ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  children: [
                    TextSpan(
                      text: 'Gateway: $_selectedOption',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedOption == null ? Colors.grey : Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: Size(double.infinity, 50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
