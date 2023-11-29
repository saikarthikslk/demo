import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPage();
  }
}

class _LoginPage extends State<StatefulWidget> {
  final usertextcontroller = new TextEditingController(text: "");
  final passwordtextcontroller = new TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.all(20),
            width: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Image(
                image: AssetImage('images/d83012c34a8f88a64e2b.jpg'),
              ),
              Column(
                children: [
                  TextField(
                    controller: usertextcontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Username"),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: passwordtextcontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password"),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Placeholder(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 120,
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Login"),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.login_outlined)
                            ]),
                      ))
                ],
              ),
            ])));
  }
}
