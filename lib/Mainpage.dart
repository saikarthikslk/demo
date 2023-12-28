import 'dart:convert';

import 'package:app/Chatdata.dart';
import 'package:app/Header.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<String> strings = ["Chats", "Updates", "Calls"];
  var data = [];
  @override
  void initState() {
    super.initState();
    generate();
    return;
  }

  void generate() async {
    var randomdata = [];
    for (int i = 0; i < 10; i++) {
      var r1 = await http
          .get(Uri.parse("https://randomuser.me/api/?nat=us&randomapi"));
      var r2 = jsonDecode(r1.body) as Map<String, dynamic>;
      randomdata.add(r2);
    }
    setState(() {
      data = randomdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(37, 211, 102, 1),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 75,
                    alignment: Alignment.center,
                    child: DefaultTextStyle(
                        child: Text("Chat Me"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic)),
                  ),
                  Container(
                      height: 75,
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                          )
                        ],
                      ))
                ],
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(child: Text("Chats")),
                  Tab(
                    child: Text("Updates"),
                  ),
                  Tab(
                    child: Text("Calls"),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Chatdata(
                  key: null,
                  data: data,
                  scrollController: ScrollController(),
                ),
                Chatdata(
                  key: null,
                  data: [],
                  scrollController: ScrollController(),
                ),
                Chatdata(
                  key: null,
                  data: [],
                  scrollController: ScrollController(),
                ),
              ],
            )));
  }
}
