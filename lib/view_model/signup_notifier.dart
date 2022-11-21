import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shot_dev/model/signup_data.dart';

//using StateNotifierProvider to allow the UI to interact with class
final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpData>((ref) {
  return SignUpNotifier(ref.read);
});

class SignUpNotifier extends StateNotifier<SignUpData> {
  final Reader _read;
  SignUpNotifier(this._read)
      : super(SignUpData(
            uid: FirebaseAuth.instance.currentUser?.uid,
            name: '',
            gender: '',
            phone: '',
            imag_url: ''));

  void nameInput(index) {
    state = state.copyWith(name: index);
  }

  void uidInput(index) {
    state = state.copyWith(uid: index);
  }
}
