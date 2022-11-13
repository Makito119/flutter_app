import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shot_dev/model/model.dart';
import 'package:flutter_shot_dev/model/profilepage_data.dart';

//using StateNotifierProvider to allow the UI to interact with class
final profilepageProvider =
    StateNotifierProvider.autoDispose<ProfilePageNotifier, ProfilePageData>(
        (ref) {
  return ProfilePageNotifier(ref.read);
});

final storeListProvider =
    StateNotifierProvider<StoreListNotifier, AsyncValue<List<StoreListModel>>>(
        (ref) {
  return StoreListNotifier(ref.read);
});

class StoreListNotifier
    extends StateNotifier<AsyncValue<List<StoreListModel>>> {
  final Reader read;
  StoreListNotifier(this.read) : super(const AsyncLoading());

  // 現在取得している最後のドキュメントを保持
  DocumentSnapshot? fetchedLastDoc;

  Future<void> fetchFirstPosts() async {
    //state = const AsyncLoading();
    try {
      final snapshots =
          await FirebaseFirestore.instance.collection('store').limit(10).get();

      fetchedLastDoc = snapshots.docs.last;
      state = AsyncValue.data([
        ...snapshots.docs.map((e) => (StoreListModel(e.data()['address'],
            e.data()['img_url'], e.data()['name'], e.data()['phone']))),
      ]);
    } catch (err, stack) {
      state = AsyncValue.error(err, stackTrace: stack);
    }
  }
}

class ProfilePageNotifier extends StateNotifier<ProfilePageData> {
  final Reader read;
  ProfilePageNotifier(this.read) : super(const ProfilePageData());

  void hideNav() {
    state = state.copyWith(showNavigation: false);
  }

  void showNav() {
    state = state.copyWith(showNavigation: true);
  }

  // 現在取得している最後のドキュメントを保持
  DocumentSnapshot? fetchedLastDoc;

  Future<void> fetchFirstPosts() async {
    final snapshots =
        await FirebaseFirestore.instance.collection('store').limit(10).get();
    fetchedLastDoc = snapshots.docs.last;
    state = state.copyWith(storeList: [
      ...snapshots.docs.map((e) => (StoreListModel(e.data()['address'],
          e.data()['img_url'], e.data()['name'], e.data()['phone']))),
    ]);
  }

  //Future<void> fetchPosts() async {
  // // TODO: 後ほど実装
  // final snapshots = await FirebaseFirestore.instance
  //     .collection('posts')
  //     .orderBy('index')
  //     .startAfterDocument(fetchedLastDoc!)
  //     .limit(20)
  //     .get();

  // fetchedLastDoc = snapshots.docs.last;
  // state = [
  //   ...state,
  //   ...snapshots.docs.map(
  //     (e) => PostModel(
  //       id: e.id,
  //       index: e.data()['index'],
  //     ),
  //   ),
  // ];
}
