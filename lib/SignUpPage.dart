import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  final emialtextcontroller = new TextEditingController(text: "");

  final usertextcontroller = new TextEditingController(text: "");
  final passwordtextcontroller = new TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white, body: Center(child: Container()));
  }
}
