import 'package:flutter/material.dart';

class ProfileWidget {
  static logOutBar({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.055,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(130),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x26c26ffe),
              blurRadius: 36,
              offset: Offset(0, 14),
            ),
          ],
        ),
        child: const Center(
            child: Text(
          'ログアウト',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;

  const ProfileHeaderLabel({
    Key? key,
    required this.headerLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
              width: 50,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
            Text(
              headerLabel,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 40,
              width: 50,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
          ],
        ));
  }
}
