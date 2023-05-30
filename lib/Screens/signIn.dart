import 'package:flutter/material.dart';

import 'package:flutter_application_2/Screens/flutterfire.dart';
import 'package:flutter_application_2/Screens/create_account.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailField = TextEditingController();
    TextEditingController _passwordField = TextEditingController();

    // ignore: prefer_const_constructors
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              child: Image.asset(
                "assets/images/login page image.png",
                fit: BoxFit.cover,
                height: 350,
              ),
            ),

            // ignore: prefer_const_constructors
            Container(
              child: RichText(
                text: TextSpan(
                  text: 'Login',
                  style: GoogleFonts.lato(
                      color: Color.fromARGB(255, 79, 59, 171),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  children: [
                    TextSpan(
                      text: ' Here',
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailField,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Enter Username/Email",
                        labelText: "Username"),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _passwordField,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Color.fromARGB(255, 79, 59, 171),
                      ),
                      onPressed: () async {
                        bool shouldNavigate =
                            await signIn(_emailField.text, _passwordField.text);
                        if (shouldNavigate) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                  bottom: 720, left: 10, right: 10),
                              content: Row(
                                children: [
                                  Text("Successfully Logged into Your Account"),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                  bottom: 720, left: 10, right: 10),
                              content: Row(
                                children: [
                                  Text("Incorrect Details"),
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
                        }
                      },
                      child: const Text(
                        "SignIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(),
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Color.fromARGB(255, 79, 59, 171),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccountPage()));
                      },
                      child: const Text(
                        "Create An Account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
