import 'package:app/Mainpage.dart';
import 'package:app/Otpscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool loggedin = false;
  String verificationid = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  AuthProvider() {
    requestpermission();
  }
  void requestpermission() async {
    await firebaseMessaging.requestPermission();
    FirebaseMessaging.onBackgroundMessage(handlemessage);
  }

  Future<void> handlemessage(RemoteMessage remoteMessage) async {
    print(remoteMessage);
  }

  void saveuser() {}
  void signin(String num, BuildContext context) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: num,
        verificationCompleted: (phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) => {},
        codeSent: (verificationId, forceResendingToken) {
          this.verificationid = verificationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(),
              ));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void login(String num, BuildContext context) async {
    PhoneAuthCredential creds = PhoneAuthProvider.credential(
        verificationId: this.verificationid, smsCode: num);
    try {
      User? user = (await auth.signInWithCredential(creds)).user;

      if (user != null) {
        loggedin = true;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ));
      }
    } catch (e) {
      print(e);
    }
  }
}
