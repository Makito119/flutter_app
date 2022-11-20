import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shot_dev/view_model/profilepage_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StorelistPage extends HookConsumerWidget {
  const StorelistPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      //加盟店をリストに追加
      ref.read(storeListProvider.notifier).fetchFirstPosts();
      return null;
    }, const []);
    final storeList = ref.watch(storeListProvider);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('加盟店リスト'),
          backgroundColor: const Color(0xff2c233a),
          shadowColor: const Color(0x7f840899),
          elevation: 10,
        ),
        body: SafeArea(
          child: storeList.when(
            data: (store) {
              return ListView.builder(
                  itemCount: store.length, //List(List名).length
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.155,
                      child: Card(
                        color: Colors.white,
                        shadowColor: const Color(0x7f840899),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            //店舗写真
                            Expanded(
                              flex: 3, // 1 要素分の横幅
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Image.network(
                                  store[index].img_url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //店舗情報
                            Expanded(
                              flex: 5, // 2 要素分の横幅
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5,
                                      top: MediaQuery.of(context).size.height *
                                          0.025),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: SizedBox(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(store[index].name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.left),
                                              ),
                                              Text(store[index].address,
                                                  textAlign: TextAlign.left),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1, // 2 要素分の横幅
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'TEL: ${store[index].phone}',
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
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
