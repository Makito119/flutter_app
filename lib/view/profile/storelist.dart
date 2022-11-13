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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('加盟店リスト'),
          backgroundColor: Color(0xff2c233a),
          //加盟店用
        ),
        body: Container(
          //child: Text('Entry ${storeList[index].name}'),
          child: storeList.when(
            data: (store) {
              //print(store[0].address);
              //print(store.length);

              return ListView.builder(
                  itemCount: store.length, //List(List名).length
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.155,
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3, // 1 要素分の横幅
                              child: Container(
                                //color: Colors.red,
                                height: double.infinity,
                                width: double.infinity,
                                child: Image.network(
                                  '${store[index].img_url}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5, // 2 要素分の横幅
                              child: Container(
                                // color: Colors.blue,
                                height: double.infinity,
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.025),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3, // 1 要素分の横幅
                                        child: Container(
                                          //color: Colors.black,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                    '${store[index].name}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.left),
                                              ),
                                              Text('${store[index].address}',
                                                  textAlign: TextAlign.left),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1, // 2 要素分の横幅
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 80,
                                          width: double.infinity,
                                          child: Text(
                                            'TEL:${store[index].phone}',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            error: (_, __) {
              return const Text("An error occurred");
            },
            loading: () {
              return Center(child: const CircularProgressIndicator());
            },
          ),
        ));
  }
}
