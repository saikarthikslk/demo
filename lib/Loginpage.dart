import 'package:app/Otpscreen.dart';
import 'package:app/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPage();
  }
}

class _LoginPage extends State<StatefulWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var ap = Provider.of<AuthProvider>(context, listen: false);
    ap.requestpermission();
  }

  final usertextcontroller = new TextEditingController(text: "");
  final passwordtextcontroller = new TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: BoxDecoration(color: Colors.white70),
            padding: EdgeInsets.all(20),
            width: 300,
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple.shade50),
                  child: Image(
                    image: AssetImage('images/image2.png'),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text("Registration",
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  TextField(
                    controller: usertextcontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Phone Number"),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)))),
                      onPressed: () {
                        final ap =
                            Provider.of<AuthProvider>(context, listen: false);

                        ap.signin("+91" + usertextcontroller.text, context);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Login"),
                            ]),
                      ))
                ],
              ),
            ])));
  }
}
