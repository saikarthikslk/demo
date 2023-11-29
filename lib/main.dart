import 'package:app/Loginpage.dart';
import 'package:app/Mainpage.dart';
import 'package:app/SignUpPage.dart';
import 'package:app/chat.dart';
import 'package:app/videoscreen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  final navigatorKey = GlobalKey<NavigatorState>();

  ZegoUIKit().initLog().then((value) {
    runApp(get(navigatorKey));
  });
}

Widget get(key) {
  return MaterialApp(
    navigatorKey: key,
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        body: Center(
            child: button(
      key: null,
    ))),
  );
}

class button extends StatelessWidget {
  const button({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CallPage(
                  key: null,
                ),
              ));
        },
        child: Text('request'));
  }
}
