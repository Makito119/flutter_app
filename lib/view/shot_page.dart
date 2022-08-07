import 'package:flutter/material.dart';
import 'question.dart';

class ShotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShotPageState();
  }
}

class ShotPageState extends State<ShotPage> {
  void test() {
    Text("Test");
  }

  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["q1", "q2", "q3"];
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
            Question(questions[questionIndex]),
            ElevatedButton(
              onPressed: answerQuestion,
              child: const Text('Answer1'),
            ),
            ElevatedButton(
              onPressed: () => print("test"),
              child: const Text('test'),
            ),
          ],
        ));
  }
}
