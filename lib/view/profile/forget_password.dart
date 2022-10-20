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
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Forget Passowrd?'),
      ),
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'to reset your password \n\n please Enter your email address \n and click on the button below',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontFamily: 'acme'),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
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
                        labelText: 'Email Address',
                        hintText: 'Enter your email'),
                  ),
                  TextButton(
                    child: Text('Send Reset Password Link'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        AuthRepo.sendPasswordResetEmail(emailController.text);
                      } else {
                        print('form not valid');
                      }
                    },
                  )
                ],
              ))),
    );
  }
}
