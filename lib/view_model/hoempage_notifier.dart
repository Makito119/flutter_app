import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shot_dev/model/homepage_data.dart';

//using StateNotifierProvider to allow the UI to interact with class
final homepageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageData>((ref) {
  return HomePageNotifier(ref.read);
});

class HomePageNotifier extends StateNotifier<HomePageData> {
  final Reader _read;
  HomePageNotifier(this._read)
      : super(const HomePageData(
          bottomNaviChange: 1,
          hideNavigation: false,
          showNavigation: true,
        ));

  void hideNav() {
    state = state.copyWith(showNavigation: false);
  }

  void showNav() {
    state = state.copyWith(showNavigation: true);
  }

  void changeIndex(int index) {
    state = state.copyWith(bottomNaviChange: index);
  }
}
