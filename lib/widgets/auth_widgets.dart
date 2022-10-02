import 'package:flutter/material.dart';

var signupBottonDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(130),
  boxShadow: [
    BoxShadow(
      color: Color(0x26c26ffe),
      blurRadius: 36,
      offset: Offset(0, 14),
    ),
  ],
  gradient: const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xfff56dff), Color(0xffdb6bfd), Color(0xff7678ff)],
  ),
);

var textFormDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(15.0),
  hintText: 'Password',
  prefixIcon: Icon(
    Icons.lock,
  ),
  hintStyle: TextStyle(color: Colors.white24, fontSize: 16),
  fillColor: Colors.white24,
  filled: true,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: Colors.white,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white24),
      borderRadius: BorderRadius.circular(20)),
);

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z]{2,3})$')
        .hasMatch(this);
  }
}
