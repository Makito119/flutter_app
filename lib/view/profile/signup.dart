//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/model/signup_notifier.dart';
import 'package:flutter_shot_dev/test_data/signup_data.dart';
import 'package:flutter_shot_dev/widgets/auth_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SignUpData signUpData = ref.watch(signUpProvider);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';
    String _name = '';
    bool _validateAndSave() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      }
      return false;
    }

    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    print(_name);
    print(_email);
    print(_password);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        //reverse: true,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200, right: 150),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(
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
                padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your full name';
                      }
                      return null;
                    },
                    onSaved: (value) => _name = value!.trim(),
                    decoration: textFormDecoration.copyWith(
                        hintText: 'User Name',
                        prefixIcon: Icon(Icons.person_outline))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      } else if (value.isValidEmail() == false) {
                        return 'invalid email';
                      } else if (value.isValidEmail() == true) {}
                      return null;
                    },
                    onSaved: (value) => _email = value!.trim(),
                    decoration:
                        textFormDecoration.copyWith(hintText: 'Email address')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!.trim(),
                    decoration:
                        textFormDecoration.copyWith(hintText: 'Password')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0, bottom: 10),
                child: TextButton(
                    onPressed: () async {
                      if (_validateAndSave()) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                          _formKey.currentState!.reset();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                  
                            print('The password provided is too weak');
                          } else if (e.code == 'email-already-in-use') {
                            print('the account already exists for that email');
                          }
                        }

                        print('valid');
                        // ref
                        //     .read(signUpProvider.notifier)
                        //     .passwordInput(_password);
                        // ref.read(signUpProvider.notifier).nameInput(_name);
                        // ref.read(signUpProvider.notifier).emailInput(_email);
                        print(_name);
                        print(_email);
                        print(_password);
                      }

                      // if (_formKey.currentState!.validate()) {
                      //   print('valid');
                      //   print(signUpData.name);
                      //   print(signUpData.email);
                      //   print(signUpData.password);
                      // }
                      else {
                        print('not valid');
                      }
                    },
                    child: SizedBox(
                      height: 60,
                      width: screenWidth * 0.9,
                      child: Container(
                        child: Center(
                            child: Text(
                          'Sign up',
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
            ],
          ),
        ),
      ),
    );
  }
}

void signUp() {}
