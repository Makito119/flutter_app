import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shot_dev/model/signup_data.dart';

import 'package:flutter_shot_dev/view_model/profilepage_notifier.dart';
import 'package:flutter_shot_dev/widgets/bottomNavigationBar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/signup_notifier.dart';
import '../../widgets/auth_widgets.dart';
import '../../widgets/profile_widgets.dart';

// ignore: camel_case_types
class MemberinfPage extends HookConsumerWidget {
  MemberinfPage({
    Key? key,
  }) : super(key: key);

  final titleController = TextEditingController();
  final mentitleController = TextEditingController();
  final mengender = [
    "男",
    "女",
    "回答なし",
  ];

  DateTime dateTime = DateTime.now();

  int index = 0;

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SignUpData signUpData = ref.watch(signUpProvider);

    final gender = useState<int>(0);
    final birthdeydata = useState<int>(0);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xff2c233a),
          title: Text('会員情報'),
          shadowColor: Color(0x7f840899),
          elevation: 10,
        ),
        body: FutureBuilder<DocumentSnapshot>(
            future: customers.doc(signUpData.uid).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text(
                  "Something went wrong",
                );
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return Center(
                    child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                  child: Text(
                    'ログインしてください',
                  ),
                ));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        //白い背景部分を縦に並べる
                        children: [
                          Container(
                            //会員情報（名前等部分）の白い背景部分
                            width: MediaQuery.of(context).size.width * 0.95,
                            margin: const EdgeInsets.only(top: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                //画像と表示名のコンテナの中を横並び
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'img/user.png'))),
                                          ),
                                        ),
                                        Positioned(
                                          right: 5.0,
                                          bottom: 15.0,
                                          width: 30,
                                          height: 30,
                                          child: Container(
                                            alignment: Alignment.center,
                                            //画像用のコンテナ
                                            width: 30,

                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                            ),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: (Colors.white),
                                              size: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    maxLines: 20,
                                    minLines: 1,
                                    initialValue: data['name'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(1),
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            //会員情報（名前等部分）の白い背景部分
                            width: MediaQuery.of(context).size.width * 0.95,
                            margin: const EdgeInsets.only(top: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, left: 20, bottom: 20, top: 10),
                                child: Column(
                                  children: [
                                    ListTile(
                                        dense: true,
                                        leading: Text('性別',
                                            style: TextStyle(fontSize: 20)),
                                        trailing: Wrap(
                                          spacing: 3,
                                          children: [
                                            Text(mengender[gender.value],
                                                style: TextStyle(fontSize: 20)),
                                            Icon(
                                              Icons.navigate_next,
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                        onTap: () => {
                                              showCupertinoModalPopup(
                                                  context: context,
                                                  builder: (context) =>
                                                      CupertinoActionSheet(
                                                        actions: [
                                                          genderPicker(gender)
                                                        ],
                                                        cancelButton:
                                                            CupertinoActionSheetAction(
                                                          child: Text('Cancel'),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                        ),
                                                      ))
                                            }),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Divider(
                                          color: Colors.white70,
                                          thickness: 0.5,
                                        )),
                                    ListTile(
                                        dense: true,
                                        leading: Text('生年月日',
                                            style: TextStyle(fontSize: 20)),
                                        trailing: Wrap(
                                          spacing: 3,
                                          children: [
                                            Text(
                                                '${dateTime.year}年${dateTime.month}月${dateTime.day}',
                                                style: TextStyle(fontSize: 20)),
                                            Icon(
                                              Icons.navigate_next,
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                        onTap: () => {
                                              showCupertinoModalPopup(
                                                  context: context,
                                                  builder: (context) =>
                                                      CupertinoActionSheet(
                                                        actions: [
                                                          birthdey(dateTime)
                                                        ],
                                                        cancelButton:
                                                            CupertinoActionSheetAction(
                                                          child: Text('Cancel'),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                        ),
                                                      ))
                                            }),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Divider(
                                          color: Colors.white70,
                                          thickness: 0.5,
                                        )),
                                    ListTile(
                                        dense: true,
                                        leading: Text('メールアドレス',
                                            style: TextStyle(fontSize: 16)),
                                        trailing: Text(data['email'],
                                            style: TextStyle(fontSize: 14)),
                                        onTap: () => {}),
                                  ],
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: ElevatedButton(
                                  child: Text(
                                    '保存',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(280, 50),
                                    shape: const StadiumBorder(),
                                    elevation: 16,
                                  )))
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0xff9163f3)),
                ),
              );
            }));
  }

// 性別のドラムロール要素
  Widget genderPicker(gender) => SizedBox(
        height: 200,
        child: CupertinoPicker(
          itemExtent: 64,
          children: mengender
              .map(
                (item) => Center(
                    child: Text(
                  item,
                  style: TextStyle(fontSize: 25),
                )),
              )
              .toList(),
          onSelectedItemChanged: (index) {
            gender.value = index;
          },
        ),
      );
//生年月日のドラムロール要素
  Widget birthdey(birthdeydate) => SizedBox(
        height: 300,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (index) {
            //選択したデータを取得（できませんでした）
          },
        ),
      );
}
