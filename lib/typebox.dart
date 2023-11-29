import 'package:flutter/material.dart';

class TypeBox extends StatelessWidget {
  const TypeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(
                  Icons.sentiment_satisfied_alt_sharp,
                  color: Colors.white,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Type a message',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
