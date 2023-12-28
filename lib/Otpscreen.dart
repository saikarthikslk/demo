import 'package:app/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.all(20),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.purple.shade50),
              child: const Image(
                image: AssetImage('images/image2.png'),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text("Verification",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text("Enter the otp sent to phone number",
                style: TextStyle(fontSize: 10)),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Pinput(
                showCursor: true,
                onCompleted: (value) {
                  final ap = Provider.of<AuthProvider>(context, listen: false);
                  ap.login(value, context);
                },
                length: 6,
              ))
        ],
      ),
    );
  }
}
