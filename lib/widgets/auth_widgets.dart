import 'package:flutter/material.dart';
class SignUpButton extends StatelessWidget {
  final String name;
  const SignUpButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.065,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
            child: Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700),
        )),
        decoration: signupBottonDecoration);
  }
}

class purpleBlur extends StatelessWidget {
  const purpleBlur({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment(0, 0),
        child: Opacity(
          opacity: 0.5,
          child: Container(
            height: 1,
            width: 1,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff9163f3),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff9163f3),
                    blurRadius: 334,
                    spreadRadius: 113.0,
                    //offset: Offset(1, 51))
                  )
                ]),
          ),
        ),
      ),
    ]);
  }
}

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
