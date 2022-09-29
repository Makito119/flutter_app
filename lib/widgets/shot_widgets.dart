import 'package:flutter/material.dart';

class ShotWidgets {
  static codeScanBar({required BuildContext context}) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.22,
        width: MediaQuery.of(context).size.width * 0.95,
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Stack(children: [
          Align(
            alignment: Alignment(0, 0),
            child: Opacity(
              opacity: 0.25,
              child: Container(
                width: 690,
                height: 155,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
              alignment: const Alignment(-0.9, 0),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('img/widget1.png'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          const Align(
            alignment: Alignment(-0.37, -0.4),
            child: Text(
              "Scaning",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0.1, 0.4),
            child: Opacity(
              opacity: 0.60,
              child: Text(
                "Come and find your current bar!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ]));
  }
}
