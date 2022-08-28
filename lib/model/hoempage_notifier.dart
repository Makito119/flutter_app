import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shot_dev/test_data/homepage_data.dart';
import 'package:flutter_shot_dev/view/game_page.dart';
import 'package:flutter_shot_dev/view/shot_page.dart';
import 'package:flutter_shot_dev/view/profile_page.dart';

//using StateNotifierProvider to allow the UI to interact with class
final homepageProvider =
    StateNotifierProvider<HomePageNotifier, HomePageData>((ref) {
  return HomePageNotifier(ref.read);
});

class HomePageNotifier extends StateNotifier<HomePageData> {
  final Reader _read;
  HomePageNotifier(this._read)
      : super(HomePageData(
          bottomNaviChange: 0,
          hideNavigation: false,
          showNavigation: true,
          pageList: [GamePage(), ShotPage(), ProfilePage()],
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
