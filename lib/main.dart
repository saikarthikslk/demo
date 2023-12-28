import 'package:app/Dummypage.dart';
import 'package:app/Loginpage.dart';
import 'package:app/Mainpage.dart';
import 'package:app/Otpscreen.dart';
import 'package:app/SignUpPage.dart';
import 'package:app/authprovider.dart';
import 'package:app/chat.dart';
import 'package:app/firebase_options.dart';
import 'package:app/videoscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final navigatorKey = GlobalKey<NavigatorState>();

  ZegoUIKit().initLog().then((value) {
    runApp(get(navigatorKey));
  });
}

Widget get(key) {
  return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        navigatorKey: key,
        debugShowCheckedModeBanner: false,
        home: LoginPage(
          key: null,
        ),
      ));
}
