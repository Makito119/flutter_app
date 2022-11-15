import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: camel_case_types
class MemberinfPage extends HookConsumerWidget {
  MemberinfPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xff2c233a),
          shadowColor: Color(0x7f840899),
          elevation: 10,
        ));
  }
}
