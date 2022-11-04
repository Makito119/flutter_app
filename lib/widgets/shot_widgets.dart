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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('img/widget1.png'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Scaning",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.width * 0.01)),
                  const Opacity(
                    opacity: 0.60,
                    child: Text(
                      "Come and find your current bar!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]));
  }
}
