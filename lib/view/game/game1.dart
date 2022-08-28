import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Game1Page extends HookConsumerWidget {
  const Game1Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(backgroundColor: Color(0xff2c233a), title: Text("ゲーム１")),
      body: Text(
        "ゲーム１",
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
