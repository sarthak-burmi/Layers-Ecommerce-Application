import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/Screens/drawer.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/Screens/login_page.dart';
import 'package:flutter_application_2/models/custom_skin_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  //String _errorMessage = '';
  String _username = '';
  String _phone = '';
  String _errorMessage = '';

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        await _firestore
            .collection('usersdata')
            .doc(userCredential.user!.uid)
            .set({
          'name': _name,
          'email': _email,
          'username': _username,
          'phone': _phone,
          'cart': [],
        });
        // Navigate to the home page or another page in your app
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
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
                  Text("Email address already in use"),
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
          _errorMessage = 'Email address already in use';
        } else {
          _errorMessage = 'An error occurred, please try again later';
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
                  Text("An error occurred, please try again later"),
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
        setState(() {});
      } catch (e) {
        _errorMessage = 'An error occurred, please try again later';

        setState(() {});
      }
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 120, top: 50, left: 10),
              child: RichText(
                text: TextSpan(
                  text: 'Create Account',
                  style: GoogleFonts.lato(
                      color: Color.fromARGB(255, 79, 59, 171),
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                  children: [
                    TextSpan(
                      text: '\n& Get new Look For Your Smartphone',
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              "assets/images/sign up.png",
              height: 350,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _name = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username(Display Name)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Your Display Name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _username = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Contact Number';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          _phone = value;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color.fromARGB(255, 79, 59, 171),
                          ),
                          onPressed: () {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(30),
                            //     ),
                            //     backgroundColor: Colors.green,
                            //     behavior: SnackBarBehavior.floating,
                            //     margin: EdgeInsets.only(
                            //         bottom: 720, left: 10, right: 10),
                            //     content: Row(
                            //       children: [
                            //         Text("Account Created $_username"),
                            //         SizedBox(width: 5),
                            //         CircleAvatar(
                            //             backgroundColor: Colors.white,
                            //             radius: 12,
                            //             child: Icon(
                            //               Icons.check,
                            //               color: Colors.green,
                            //             )),
                            //       ],
                            //     ),
                            //     duration: Duration(seconds: 3),
                            //   ),
                            // );

                            _submit();
                          },
                        ),
                      ),
                      if (_errorMessage.isNotEmpty) Text(""),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
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
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => loginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Already Have Account? Click Here to Login In",
                            style: TextStyle(
                              color: Color.fromARGB(255, 79, 59, 171),
                            ),
                          ),
                        ),
                      )
                    ],
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
