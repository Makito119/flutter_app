import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/firebase_options.dart';
import 'package:flutter_shot_dev/view/profile/forget_password.dart';
import 'package:flutter_shot_dev/view/profile/login.dart';
import 'package:flutter_shot_dev/view/profile/signup.dart';
import 'package:flutter_shot_dev/view/profile_page.dart';
import 'package:flutter_shot_dev/view_model/shotpage_notifier.dart';
import 'view/homepage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(shotpageProvider.notifier).fetchFirstPosts();
    return MaterialApp(
      routes: {
        '/profile_page': (context) => ProfilePage(),
        '/home_page': (context) => MyHomePage(),
        '/login_page': (context) => LoginPage(),
        '/signup_page': (context) => SignupPage(),
        '/forget_password': (context) => ForgetPassword(),
      },
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
