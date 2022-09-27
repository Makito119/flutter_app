import 'package:flutter/material.dart';

class GameWidgets {
  static showGameList({required BuildContext context,required String name,required String picture }) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.4,
        margin: EdgeInsets.only(left: 10.0, right: 10, top: 15.0, bottom: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(picture), fit: BoxFit.cover),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: [
          Align(
              alignment: const Alignment(0, 1),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.12,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x7f840899),
                        blurRadius: 35,
                        offset: Offset(0, 8),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 116, 102, 141),
                        Color.fromARGB(191, 116, 102, 141),
                        Color.fromARGB(127, 116, 102, 141),
                        Color.fromARGB(63, 116, 102, 141),
                      ],
                    )),
              )),
          Align(
            alignment: Alignment(-0.8, 0.95),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ]));
  }
}
