import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/view/answer.dart';
import 'question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class ShotPage extends HookConsumerWidget {
  const ShotPage({
    Key? key,
  }) : super(key: key);

  void test() {
    Text("Test");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    var questions = ["q1", "q2", "q3"];
    void _answerQuestion() {
      ref.read(counterProvider.state).state++;
      print(counterProvider);
    }

    return Container(
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        //   colors: [Color(0xff48366d), Color(0xff2c2339)],
        // )),
        color: Colors.white,
        child: Column(
          children: [
            Question(questions[counter]),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.state).state++,
              child: const Text('Answer1'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () => print("test"),
              child: const Text('test'),
            ),
          ],
        ));
  }
}
