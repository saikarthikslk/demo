import 'dart:math';
import 'package:app/message.dart';
import 'package:app/typebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatelessWidget {
  final name;
  final url;
  final message;
  const ChatScreen({super.key, this.name, this.url, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(236, 229, 221, 1),
      bottomNavigationBar: Stack(children: [
        Container(
            height: 100,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 8),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                  width: 300,
                  height: 48,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.fromLTRB(20, 2, 4, 2),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sentiment_satisfied_sharp,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextField(
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                constraints: BoxConstraints(maxWidth: 200),
                                hintText: "Message",
                                border: InputBorder.none)),
                      ])),
              SizedBox(
                width: 25,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                      shape: MaterialStatePropertyAll(CircleBorder(
                          side: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(37, 211, 102, 1)))),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(37, 211, 102, 1))),
                  onPressed: () {},
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 35,
                  ))
            ]))
      ]),
      body: ListView.builder(
          itemCount: message.length,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return Message(
                key: null,
                text: message[index],
                t: 0,
                time: "",
              );
            } else {
              return Message(
                key: null,
                text: message[index],
                t: 1,
                time: "",
              );
            }
          }),
      appBar: AppBar(
          toolbarHeight: 64,
          leadingWidth: 22,
          backgroundColor: Color.fromRGBO(37, 211, 102, 1),
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(image: NetworkImage(url)))),
                    const SizedBox(
                      width: 10,
                    ),
                    DefaultTextStyle(
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        child: Text(name))
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.video_call,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
