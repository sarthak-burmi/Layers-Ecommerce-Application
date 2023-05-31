import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/create_account.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

//firebase.initializeApp()

class loginPage extends StatefulWidget {
  @override
  _loginnPageState createState() => _loginnPageState();
}

class _loginnPageState extends State<loginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isLoading = false;
  void _googlesignin(BuildContext context) async {
    try {
      // Trigger the Google authentication flow.
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the Google login.
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential.
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials.
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Get the user's information from the Google account.
      final GoogleSignInAccount? currentUser = _googleSignIn.currentUser;
      final String displayName = currentUser!.displayName!;
      final String email = currentUser.email;
      final String photoUrl = currentUser.photoUrl!;

      // Create a new user document in Firestore with the user's information.
      await FirebaseFirestore.instance
          .collection('usersdata')
          .doc(userCredential.user!.uid)
          .set({
        'displayName': displayName,
        'email': email,
        'photoUrl': photoUrl,
      });

      // Navigate to the home page.
      Navigator.pushReplacementNamed(context, '/home');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 720, left: 10, right: 10),
          content: Row(
            children: [
              Text("Successfully Logged In"),
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
    } catch (e) {
      // Handle any errors that occur during sign-in.
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 720, left: 10, right: 10),
          content: Row(
            children: [
              Text("ERORR!! Sigining with Google"),
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
  }

  // Future<void> _signIn() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //             email: _emailController.text, password: _passwordController.text);
  //     // TODO: Navigate to home page or do something else
  //   } on FirebaseAuthException catch (e) {
  //     // setState(() {
  //     //   _isLoading = false;
  //     // });
  //     if (e.code == 'user-not-found') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('No user found for that email.')));
  //     } else if (e.code == 'wrong-password') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Wrong password provided for that user.')));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text('Failed to sign in. Please try again later.')));
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('Failed to sign in. Please try again later.')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 40, right: 40, top: 40),
                  child: Image.asset(
                    "assets/images/login page image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: RichText(
                  text: TextSpan(
                    text: 'Welcome Back !!!',
                    style: GoogleFonts.lato(
                        color: Color.fromARGB(255, 79, 59, 171),
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                    children: [
                      TextSpan(
                        text: '\nEnter Your SignIn Details',
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email.';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password.';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor:
                                        Color.fromARGB(255, 79, 59, 171),
                                  ),
                                  onPressed: () async {
                                    // final auth = Provider.of<AuthProvider>(
                                    //     context,
                                    //     listen: false);
                                    // auth.login();
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      CircularProgressIndicator();
                                      try {
                                        UserCredential userCredential =
                                            await FirebaseAuth.instance
                                                .signInWithEmailAndPassword(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            backgroundColor: Colors.green,
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.only(
                                                bottom: 720,
                                                left: 10,
                                                right: 10),
                                            content: Row(
                                              children: [
                                                Text(
                                                    "Logged Into Your Account"),
                                                SizedBox(width: 5),
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
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
                                        Navigator.pushReplacementNamed(
                                            context, '/home');
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'invalid-email') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              backgroundColor: Colors.red,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: EdgeInsets.only(
                                                  bottom: 720,
                                                  left: 10,
                                                  right: 10),
                                              content: Row(
                                                children: [
                                                  Text(
                                                      "Please Enter Vaild Email Adress"),
                                                  SizedBox(width: 5),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
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
                                        } else if (e.code == 'user-not-found' ||
                                            e.code == 'wrong-password') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              backgroundColor: Colors.red,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: EdgeInsets.only(
                                                  bottom: 720,
                                                  left: 10,
                                                  right: 10),
                                              content: Row(
                                                children: [
                                                  Text(
                                                      "Inavaild Email or Password"),
                                                  SizedBox(width: 5),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
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
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              backgroundColor: Colors.red,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: EdgeInsets.only(
                                                  bottom: 720,
                                                  left: 10,
                                                  right: 10),
                                              content: Row(
                                                children: [
                                                  Text(
                                                      "An unknown error occured"),
                                                  SizedBox(width: 5),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
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
                                      }
                                    } else {
                                      if (_emailController.text.isEmpty ||
                                          _passwordController.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            backgroundColor: Colors.red,
                                            behavior: SnackBarBehavior.floating,
                                            //width: 300,
                                            margin: EdgeInsets.only(
                                                bottom: 720,
                                                left: 10,
                                                right: 10),
                                            content: Row(
                                              children: [
                                                Text(
                                                    "Please Enter Your Email And Password"),
                                                SizedBox(width: 5),
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            backgroundColor: Colors.red,
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.only(
                                                bottom: 720,
                                                left: 10,
                                                right: 10),
                                            content: Row(
                                              children: [
                                                Text(
                                                    "Please Enter vaild Email and Password"),
                                                SizedBox(width: 5),
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
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
                                    }
                                    //   final form = _formKey.currentState;
                                    //   if (_formKey.currentState!.validate()) {
                                    //     if (form!.validate()) {
                                    //       _signIn();
                                    //     }

                                    //     _signIn();
                                    //     Navigator.of(context).push(MaterialPageRoute(
                                    //         builder: (context) => HomePage()));
                                    //   }
                                  },
                                  child: _isLoading
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'Sign In',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  "Or",
                                  style: GoogleFonts.lato(
                                      color: Color.fromARGB(255, 79, 59, 171),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                child: Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      _googlesignin(context);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/images/google_logo.png',
                                          height: 24.0,
                                        ),
                                        SizedBox(width: 12.0),
                                        Text(
                                          'Sign up with Google',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  child: Text(
                                    "Want to Explore...Go to Home Page",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 79, 59, 171),
                                    ),
                                  )),
                              SizedBox(height: 0),
                              Container(
                                  height: 45,
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CreateAccountPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "New User? Click Here to Create Account",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 79, 59, 171),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
