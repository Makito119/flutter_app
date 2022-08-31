import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/view/game/game1.dart';
import 'package:flutter_shot_dev/view/quiz/quiz_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final turnlighton = StateProvider<bool>((ref) => false);

class GamePage extends HookConsumerWidget {
  const GamePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff48366d), Color(0xff2c2339)],
        )),
        //color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  ref.read(turnlighton.notifier).state =
                      !ref.watch(turnlighton);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Game1Page()));
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.gamepad, size: 120),
                      Container(
                        color: Colors.yellow.shade600,
                        child: Text(
                          ref.watch(turnlighton) ? 'GAME1' : 'BOOM',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                      const Text("ゲームの説明文"),
                    ]),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () => ref.read(turnlighton.notifier).state =
                    !ref.watch(turnlighton),
                child: Column(
                    //padding: const EdgeInsets.all(8),
                    // Change button text when light changes state.
                    children: [
                      Icon(Icons.gamepad, size: 60),
                      Container(
                        color: Colors.yellow.shade600,
                        child: Text(ref.watch(turnlighton) ? 'GAME2' : 'DICE'),
                      )
                    ]),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () => ref.read(turnlighton.notifier).state =
                    !ref.watch(turnlighton),
                child: Column(
                    //padding: const EdgeInsets.all(8),
                    // Change button text when light changes state.
                    children: [
                      Icon(Icons.gamepad, size: 60),
                      Container(
                        color: Colors.yellow.shade600,
                        child: Text(ref.watch(turnlighton) ? 'GAME2' : 'DICE'),
                      )
                    ]),
              ),
            ),
          ],
        )
        //backgroundColor: Colors.transparent,
        );
  }
}
