import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/login_page.dart';
import 'package:flutter_application_2/auth_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color.fromARGB(255, 4, 5, 33),
        child: Stack(
          children: <Widget>[
            PageView(
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: controller,
              children: <Widget>[
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 90,
                    ),
                    Container(
                      width: 240,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Center(
                        child: Text(
                          "EXCLUSIVE COLLECTION",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.lightBlue),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Container(
                        height: 450,
                        width: 350,
                        decoration: BoxDecoration(
                            //color: Colors.white,
                            // border: Border.all(
                            //   width: 5,
                            //   //color: Colors.white70,
                            // ),
                            ),
                        child: Image.asset(
                          'assets/images/slide1.png',
                          height: 750,
                          width: 500,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: 220,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Center(
                        child: Text(
                          "MARVEL COLLECTION",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/images/slide2.png',
                        height: 800,
                        width: 1000,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/images/slide3.png',
                        height: 750,
                        width: 1000,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 16.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Opacity(
                          opacity: pageIndex != 2 ? 1.0 : 0.0,
                          child: TextButton(
                            child: Text(
                              'SKIP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => loginPage()));
                            },
                          ),
                        ),
                        pageIndex != 2
                            ? TextButton(
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                onPressed: () {
                                  if (!(controller.page == 2.0))
                                    controller.nextPage(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.linear);
                                },
                              )
                            : TextButton(
                                child: Text(
                                  'FINISH',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => loginPage()));
                                },
                              )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
