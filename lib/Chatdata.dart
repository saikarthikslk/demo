import 'package:app/chat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chatdata extends StatelessWidget {
  final List data;
  final ScrollController scrollController;
  const Chatdata(
      {super.key, required this.data, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onDoubleTap: () {
                var messages = [];

                for (int i = 0; i < 50; i++) {
                  // var d1 = await http.get(Uri.parse("https://random-word-api.herokuapp.com/word"));
                  messages.add(
                      "Contex build  ContexbuildContex build Contex build Contex build svknejsvsvjwfdnvjnsjvcnsjdvnjfdnvjsd \n kwviewnvcienvinvenivenvienv  ");
                }
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ChatScreen(
                      key: null,
                      controller: this.scrollController,
                      message: messages,
                      url: data[index]['results'][0]['picture']['large'],
                      name: data[index]['results'][0]['name']['first'],
                    );
                  },
                ));
              },
              child: Container(
                  padding: EdgeInsets.all(20),
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: NetworkImage(data[index]['results'][0]
                                    ['picture']['large']))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(data[index]['results'][0]['name']['first'])
                    ],
                  )));
        });
  }
}
