import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xff48366d), Color(0xff2c2339)],
      )),
      child: Center(
        //backgroundColor: Colors.transparent,
        child: Column(children: [
          Text("12"),
          Text("34"),
          Text("34"),
        ]),
      ),
    );
  }
}
