import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/view_model/auth_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_shot_dev/widgets/auth_widgets.dart';

class ForgetPassword extends HookConsumerWidget {
  ForgetPassword({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          //Navigator.of(context).pushNamedAndRemoveUntil(
                          // "/", ModalRoute.withName('login_page'));

                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
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
                  const SizedBox(
                    height: 50,
                  ),
                  ShaderMask(
                    child: const Text(
                      'パスワード再設定',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'acme'),
                    ),
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffbfc3ff), Color(0xfff7a5ff)])
                          .createShader(rect);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: const Text(
                      'パスワード再設定ページをURLを記載したメールを送信します \nログインIDとして利用中のメールアドレスを入力してください。',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'acme'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'メールアドレスを入力してください';
                        } else if (value.isValidEmail() == false) {
                          return 'invalid email';
                        }
                        // else if (value.isValidEmail() == true) {
                        //   return null;
                        // }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: textFormDecoration.copyWith(
                          prefixIcon: Icon(Icons.mail), hintText: 'メールアドレス'),
                    ),
                  ),
                  const SizedBox(height: 60),
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        AuthRepo.sendPasswordResetEmail(emailController.text);
                      } else {
                        print('form not valid');
                      }
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 50,
                      child: SignUpButton(name: '送信する'),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
