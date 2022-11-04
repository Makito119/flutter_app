import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shot_dev/model/profilepage_data.dart';

//using StateNotifierProvider to allow the UI to interact with class
final profilepageProvider =
    StateNotifierProvider.autoDispose<ProfilePageNotifier, ProfilePageData>(
        (ref) {
  return ProfilePageNotifier(ref.read);
});

class ProfilePageNotifier extends StateNotifier<ProfilePageData> {
  final Reader _read;
  ProfilePageNotifier(this._read)
      : super(const ProfilePageData(
          showNavigation: true,
        ));

  void hideNav() {
    state = state.copyWith(showNavigation: false);
  }

  void showNav() {
    state = state.copyWith(showNavigation: true);
  }
}
