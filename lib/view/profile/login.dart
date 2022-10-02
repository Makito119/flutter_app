import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shot_dev/model/signup_notifier.dart';
import 'package:flutter_shot_dev/test_data/signup_data.dart';
import 'package:flutter_shot_dev/view/profile/signup.dart';
import 'package:flutter_shot_dev/widgets/auth_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SignUpData signUpData = ref.watch(signUpProvider);

    print(signUpData.processing);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: SafeArea(
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
                    bottom: 10.0,
                    right: MediaQuery.of(context).size.width * 0.4),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    height: 1,
                    width: 1,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff9163f3),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff9163f3),
                            blurRadius: 334,
                            spreadRadius: 113.0,
                            //offset: Offset(1, 51))
                          )
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.12,
                    bottom: MediaQuery.of(context).size.height * 0.008),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    //validator: ,
                    decoration: textFormDecoration.copyWith(
                        hintText: 'User Name', prefixIcon: Icon(Icons.person))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.008),
                child: TextFormField(
                    decoration:
                        textFormDecoration.copyWith(hintText: 'Password')),
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
              signUpData.processing == true
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.only(top: 80.0, bottom: 10),
                      child: TextButton(
                          onPressed: () async {
                            ref.read(signUpProvider.notifier).processtotrue();
                            await FirebaseAuth.instance.signInAnonymously();

                            Navigator.pushNamedAndRemoveUntil(
                                context, '/home_page', (route) => false);
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Container(
                              child: Center(
                                  child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(130),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26c26ffe),
                                    blurRadius: 36,
                                    offset: Offset(0, 14),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xfff56dff),
                                    Color(0xffdb6bfd),
                                    Color(0xff7678ff)
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(
                    width: 50,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Text(
                    'Dont have account yet?',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
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
                      height: MediaQuery.of(context).size.height * 0.065,
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
    );
  }
}
