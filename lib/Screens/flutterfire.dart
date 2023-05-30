//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/material.dart';

//class Authentication {
  //final auth = FirebaseAuth.instance;

  //Future<FirebaseUser> createAccount({

    //required String email,
    //required String password,
    //required String name}) 
    //async{
    //try{
      //UserCredential newuser  = await auth.//createUserWithEmailAndPassword(email: email, password: password);
      //auth.currentUser!.updateDisplayName(name);
      //status=AuthStatus.successful;

    //}
  //}
//}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/Screens/signIn.dart';
import 'package:flutter/material.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    {
      return false;
    }
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    {
      return false;
    }
  }
}

