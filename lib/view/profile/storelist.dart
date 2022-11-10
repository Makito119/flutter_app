import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shot_dev/view_model/profilepage_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StorelistPage extends HookConsumerWidget {
  StorelistPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(storeListProvider.notifier).fetchFirstPosts();
    }, const []);
    final storeList = ref.watch(storeListProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('加盟店リスト'),
          //加盟店用
        ),
        body: Container(
          child: storeList.when(
            data: (data) {
              return Text(data.toString());
            },
            error: (_, __) {
              return const Text("An error occurred");
            },
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
