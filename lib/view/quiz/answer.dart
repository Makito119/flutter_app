import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Answer extends ConsumerWidget {
  final Function selectHandler;
  Answer(this.selectHandler);

  @override
  Widget build(BuildContext, WidgetRef ref) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Answer1'),
        onPressed: () => selectHandler,
      ),
    );
  }
}
