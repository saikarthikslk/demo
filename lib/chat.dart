import 'dart:math';
import 'package:app/audioscreen.dart';
import 'package:app/message.dart';
import 'package:app/typebox.dart';
import 'package:app/videoscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class ChatScreen extends StatefulWidget {
  final name;
  final url;
  final message;
  final controller;
  const ChatScreen(
      {super.key,
      required this.name,
      required this.controller,
      required this.message,
      required this.url});

  @override
  State<ChatScreen> createState() => _ChatScreenState(
      controller: this.controller,
      message: this.message,
      url: this.url,
      name: this.name);
}

class _ChatScreenState extends State<ChatScreen> {
  final name;
  final url;
  final message;
  final ScrollController controller;
  _ChatScreenState(
      {this.name, this.url, this.message, required this.controller});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(236, 229, 221, 1),
      bottomNavigationBar: Stack(children: [
        Container(
            color: Color.fromRGBO(236, 229, 221, 1),
            height: 60,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 8),
            margin: EdgeInsets.only(top: 16),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 48,
                  padding: const EdgeInsets.fromLTRB(20, 2, 4, 2),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
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
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.6),
                                hintText: "Message",
                                border: InputBorder.none)),
                      ])),
              ElevatedButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(10.0),
                      shape: MaterialStatePropertyAll(CircleBorder(
                          side: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(37, 211, 102, 1)))),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(37, 211, 102, 1))),
                  onPressed: () {},
                  child: Icon(Icons.mic, color: Colors.white, size: 20))
            ])),
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom + 70,
        )
      ]),
      body: ListView.builder(
          reverse: true,
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
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CallPage(
                              key: null,
                            ),
                          ));
                        },
                        child: Icon(
                          Icons.video_call,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AudioPage(
                              key: null,
                            ),
                          ));
                        },
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                        )),
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
