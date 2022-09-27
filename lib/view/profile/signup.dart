import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/model/signup_notifier.dart';
import 'package:flutter_shot_dev/test_data/signup_data.dart';
import 'package:flutter_shot_dev/view/shot_page.dart';
import 'package:flutter_shot_dev/widgets/alert_dialog.dart';
import 'package:flutter_shot_dev/widgets/auth_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SignUpData signUpData = ref.watch(signUpProvider);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
        GlobalKey<ScaffoldMessengerState>();

    late String _email = '';
    late String _password = '';
    late String _name = '';
    late String _uid;
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

    CollectionReference customers =
        FirebaseFirestore.instance.collection('customers');
    double screenWidth = MediaQuery.of(context).size.width;
    void signUp() async {
      if (_validateAndSave()) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _email, password: _password);

          _uid = FirebaseAuth.instance.currentUser!.uid;
          //firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref('cust-info/$emai')
          await customers.doc(_uid).set({
            'name': _name,
            'email': _email,
            'phone': '',
            'gender': '',
            'birthday': '',
            'cid': _uid
          });

          _formKey.currentState!.reset();
          Navigator.pushNamedAndRemoveUntil(
              context, '/home_page', (route) => false);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'The password provided is too weak');
          } else if (e.code == 'email-already-in-use') {
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'the account already exists for that email');
          }
        }
        print('valid');
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
        MyMessageHandler.showSnackBar(_scaffoldKey, 'please fill all fields');
      }
    }

    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
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
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
                      decoration: textFormDecoration.copyWith(
                          hintText: 'Email address')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
                      onPressed: () {
                        signUp();
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
                            decoration: signupBottonDecoration),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
