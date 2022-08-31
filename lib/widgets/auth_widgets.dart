import 'package:flutter/material.dart';

var textFormDecoration = InputDecoration(
  
  hintText: 'Password',
  prefixIcon: Icon(Icons.lock),
  hintStyle: TextStyle(color: Colors.white24, fontSize: 18),
  fillColor: Colors.white24,
  filled: true,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
      //borderSide: BorderSide(color: Colors.white24),
      borderRadius: BorderRadius.circular(20)),
);

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z]{2,3})$')
        .hasMatch(this);
  }
}
