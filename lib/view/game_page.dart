import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GamePageState();
  }
}

class GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff48366d), Color(0xff2c2339)],
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.gamepad, size: 60),
            GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ss",
                    //productsList[index],
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            )
          ],
        )
        //backgroundColor: Colors.transparent,
        );
  }
}
