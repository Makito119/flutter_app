import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_shot_dev/view/game/game1.dart';
import 'package:flutter_shot_dev/view/quiz/quiz_page.dart';
import 'package:flutter_shot_dev/widgets/game_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final turnlighton = StateProvider<bool>((ref) => false);

// child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Icon(Icons.gamepad, size: 10),
//       Container(
//         color: Colors.yellow.shade600,
//         child: Text(
//           ref.watch(turnlighton) ? 'GAME1' : 'BOOM',
//           style: const TextStyle(fontSize: 30),
//         ),
//       ),
//       const Text("ゲームの説明文"),
//     ]),
class GamePage extends HookConsumerWidget {
  const GamePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController =
        ScrollController(keepScrollOffset: true);
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xff48366d), Color(0xff2c2339)],
      )),
      child: ListView(
        children: [
          GestureDetector(
              onTap: () {
                ref.read(turnlighton.notifier).state = !ref.watch(turnlighton);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Game1Page()));
              },
              child: GameWidgets.showGameList(
                  context: context, name: 'GAME1', picture: 'img/game1.png')),
          GestureDetector(
              onTap: () {
                ref.read(turnlighton.notifier).state = !ref.watch(turnlighton);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Game1Page()));
              },
              child: GameWidgets.showGameList(
                  context: context, name: 'GAME2', picture: 'img/game2.png')),
          GestureDetector(
              onTap: () {
                ref.read(turnlighton.notifier).state = !ref.watch(turnlighton);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Game1Page()));
              },
              child: GameWidgets.showGameList(
                  context: context, name: 'GAME3', picture: 'img/game3.png')),
          GestureDetector(
              onTap: () {
                ref.read(turnlighton.notifier).state = !ref.watch(turnlighton);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Game1Page()));
              },
              child: GameWidgets.showGameList(
                  context: context, name: 'GAME4', picture: 'img/game1.png')),
        ],
      ),
    );
  }
}
