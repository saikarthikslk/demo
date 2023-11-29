import 'dart:math';

import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final text;
  final t;
  final time;
  final s = "12";

  const Message({super.key, this.t, this.text, this.time});

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Container(
      alignment: t == 1 ? Alignment.centerLeft : Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(maxWidth: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Align(
                child: DefaultTextStyle(
                  child: Text("random"),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 15),
                ),
                alignment: Alignment.topLeft),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.bottomLeft,
                child: DefaultTextStyle(
                  child: Text(this.text.substring(0, random.nextInt(40))),
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ))
          ])),
    );
  }
}
