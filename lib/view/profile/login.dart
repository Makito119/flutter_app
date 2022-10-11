import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shot_dev/model/signup_data.dart';
import 'package:flutter_shot_dev/view_model/signup_notifier.dart';
import 'package:flutter_shot_dev/widgets/alert_dialog.dart';
import 'package:flutter_shot_dev/widgets/auth_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SignUpData signUpData = ref.watch(signUpProvider);
    final passwordVisible = useState<bool>(true);
    final processing = useState<bool>(false);

    void logIn() async {
      processing.value = true;
      if (_formKey.currentState!.validate()) {
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          _formKey.currentState!.reset();
          ref
              .read(signUpProvider.notifier)
              .uidInput(FirebaseAuth.instance.currentUser!.uid);
          Navigator.of(context).pushNamedAndRemoveUntil(
              "/", ModalRoute.withName('profile_page'));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            processing.value = false;
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'No user found for that email');
          } else if (e.code == 'wrong-password') {
            processing.value = false;
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'Wrong password provided for that user');
          }
        }
      } else {
        processing.value = false;
        MyMessageHandler.showSnackBar(_scaffoldKey, 'please fill all fields');
      }
    }

    return ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: SafeArea(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/", ModalRoute.withName('profile_page'));
                              //Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07,
                            right: MediaQuery.of(context).size.width * 0.4),
                        child: const purpleBlur(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ShaderMask(
                              child: Text(
                                'WELCOME \nBACK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              shaderCallback: (Rect rect) {
                                return LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffbfc3ff),
                                      Color(0xfff7a5ff)
                                    ]).createShader(rect);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.05,
                            top: MediaQuery.of(context).size.height * 0.05,
                            bottom: MediaQuery.of(context).size.height * 0.008),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              } else if (value.isValidEmail() == false) {
                                return 'invalid email';
                              } else if (value.isValidEmail() == true) {
                                // MyMessageHandler.showSnackBar(
                                //     _scaffoldKey, 'your email is valid');
                              }
                              return null;
                            },
                            onChanged: ((value) {
                              email = value;
                            }),
                            decoration: textFormDecoration.copyWith(
                                hintText: 'Email Address',
                                prefixIcon: Icon(Icons.mail))),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                            vertical:
                                MediaQuery.of(context).size.height * 0.008),
                        child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: passwordVisible.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your password';
                              }
                              return null;
                            },
                            onChanged: ((value) {
                              password = value;
                            }),
                            decoration: textFormDecoration.copyWith(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      passwordVisible.value =
                                          !passwordVisible.value;
                                    },
                                    icon: Icon(
                                        passwordVisible.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Color(0xff9163f3))),
                                hintText: 'Password')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget password?',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                      processing.value == true
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Color(0xff9163f3)),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 80.0, bottom: 10),
                              child: TextButton(
                                  onPressed: () {
                                    logIn();
                                  },
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.065,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: const SignUpButton(name: 'Login'),
                                  )),
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                              ),
                              Text(
                                'Dont have account yet?',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 40,
                                width: 50,
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: TextButton(
                            onPressed: () =>
                                {Navigator.pushNamed(context, '/signup_page')},
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Container(
                                child: Center(
                                    child: Text(
                                  'Create account',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w700),
                                )),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(130),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x26c26ffe),
                                      blurRadius: 36,
                                      offset: Offset(0, 14),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
