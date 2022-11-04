import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shot_dev/model/shotpage_data.dart';
import 'package:flutter_shot_dev/view/shot_page.dart';

//using StateNotifierProvider to allow the UI to interact with class
final shotpageProvider = StateNotifierProvider<ShotPageNotifier, ShotPageData>(
    (ref) => ShotPageNotifier(ref.read));

class ShotPageNotifier extends StateNotifier<ShotPageData> {
  final Reader read;
  ShotPageNotifier(this.read)
      : super(const ShotPageData(
          imgList: [],
        ));
  // 現在取得している最後のドキュメントを保持
  DocumentSnapshot? fetchedLastDoc;

  //　最初に表示するためのドキュメントを読み込む
  Future<void> fetchFirstPosts() async {
    final snapshots =
        await FirebaseFirestore.instance.collection('notices').get();
    fetchedLastDoc = snapshots.docs.last;
    state = state.copyWith(imgList: [
      ...snapshots.docs.map(
        (e) => e.data()['img'],
      ),
    ]);
  }
}
