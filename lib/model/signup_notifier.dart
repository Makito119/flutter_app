import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shot_dev/test_data/signup_data.dart';

//using StateNotifierProvider to allow the UI to interact with class
final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpData>((ref) {
  return SignUpNotifier(ref.read);
});

class SignUpNotifier extends StateNotifier<SignUpData> {
  final Reader _read;
  SignUpNotifier(this._read)
      : super(SignUpData(
          email: '',
          password: '',
          name: '',
          processing: false,
        ));
  void emailInput(index) {
    state = state.copyWith(email: index);
  }

  void nameInput(index) {
    state = state.copyWith(name: index);
  }

  void passwordInput(index) {
    state = state.copyWith(password: index);
  }

  void processtotrue() {
    state = state.copyWith(processing: true);
  }
}
