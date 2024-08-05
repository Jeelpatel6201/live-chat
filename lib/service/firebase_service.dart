import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:live_chat/helper/dialog.dart';
import 'package:live_chat/screen/auth/login_screen.dart';
import 'package:live_chat/screen/home_screen.dart';

class FirebaseService {
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  verifyGoogleSignInLogin(context) async {
    Dialogs.showProgressBar(context: context);
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    try {
      await InternetAddress.lookup("google.com"); // internet checking
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);
      final user = await firebaseAuth.signInWithCredential(credential);
      if (user.user != null) {
        print('Signed in with Google: ${user.user!.email}');
        if(firebaseAuth.currentUser != null){ // one time login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
        else{ // new login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      } else {
        print('Failed to sign in with Google');
      }
    } catch (e) {
      print("google :-$e");
      Dialogs.showSnackBar(context: context,msg: "Something went wrong (Check Internet!)");
    }
  }

  setDataFireStore(name, email, number) async {
    try {
      String docId = firebaseFireStore.collection('user').doc().id;

      await firebaseFireStore.collection('user').doc(docId).set({
        'name': name,
        'email': email,
        'number': number,
        'did': docId
      }).then((value) {
        log("Data:- $docId " as num);
      });
    } catch (e) {
      print("Error:----------------$e");
    }
  }

}
