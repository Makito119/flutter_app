import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/view_model/auth_repo.dart';
import 'package:flutter_shot_dev/widgets/alert_dialog.dart';
import 'package:flutter_shot_dev/widgets/auth_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends HookConsumerWidget {
  SignupPage({
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  late String name;
  late String email;
  late String password;
  late String _uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVisible = useState<bool>(true);
    final processing = useState<bool>(false);
    print(2);
    print(passwordVisible.value);
    void signUp() async {
      processing.value = true;

      if (_formKey.currentState!.validate()) {
        print('valid');
        print(name);
        print(email);
        print(password);
        try {
          AuthRepo.signUpWithEmailAndPassword(email, password);
          AuthRepo.sendEmailVerification();

          _uid = FirebaseAuth.instance.currentUser!.uid;
          //firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref('customer-info/$emai')
          await customers.doc(_uid).set({
            'name': name,
            'email': email,
            'phone': '',
            'gender': '',
            'birthday': '',
            'cid': _uid
          });

          _formKey.currentState!.reset();
          Navigator.of(context).pushNamedAndRemoveUntil(
              "/", ModalRoute.withName('profile_page'));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            processing.value = false;
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'The password provided is too weak');
          } else if (e.code == 'email-already-in-use') {
            processing.value = false;
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'the account already exists for that email');
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
                            child: const Text(
                              'Let\'s \nget started',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            shaderCallback: (Rect rect) {
                              return const LinearGradient(
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
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your full name';
                            }
                            return null;
                          },
                          onChanged: ((value) {
                            name = value;
                          }),
                          decoration: textFormDecoration.copyWith(
                              hintText: 'User Name',
                              prefixIcon: Icon(Icons.person))),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.008),
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
                          // onSaved: (value) => _email = value!.trim(),
                          decoration: textFormDecoration.copyWith(
                            hintText: 'Email address',
                            prefixIcon: const Icon(Icons.mail),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.008),
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
                          //onSaved: (value) => _password = value!.trim(),
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
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('already have account?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic)),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff9163f3),
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                    processing.value == true
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation(Color(0xff9163f3)))
                        : Padding(
                            padding:
                                const EdgeInsets.only(top: 120.0, bottom: 10),
                            child: TextButton(
                              onPressed: () {
                                signUp();
                              },
                              child: const SignUpButton(name: 'Sign Up'),
                            )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
