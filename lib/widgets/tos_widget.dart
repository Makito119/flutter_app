import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TosWidget {
  static titleBar({required BuildContext context, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
      ),
    );
  }

  static itemBar(
      {required BuildContext context,
      required int index,
      required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index}.　',
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static itemsabBar(
      {required BuildContext context,
      required int index,
      required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index}.　',
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static oneitemBar({required BuildContext context, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
