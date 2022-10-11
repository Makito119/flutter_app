import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shot_dev/model/signup_data.dart';
import 'package:flutter_shot_dev/view_model/signup_notifier.dart';
import 'package:flutter_shot_dev/widgets/alert_dialog.dart';
import 'package:flutter_shot_dev/widgets/profile_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../view_model/hoempage_notifier.dart';

class ProfilePage extends HookConsumerWidget {
  ProfilePage({Key? key}) : super(key: key);
  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SignUpData signUpData = ref.watch(signUpProvider);
    final ScrollController scrollController =
        ScrollController(keepScrollOffset: false);
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        ref.read(homepageProvider.notifier).showNav();
      } else {
        ref.read(homepageProvider.notifier).hideNav();
      }
    });
    print(10);
    print(signUpData.uid);

    // return FutureBuilder<DocumentSnapshot>(
    //   future: customers.doc(signUpData.uid).get(),
    //   builder:
    //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return Text("Something went wrong");
    //     }

    //     if (snapshot.hasData && !snapshot.data!.exists) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xff48366d), Color(0xff2c2339)],
      )),
      child: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
                FutureBuilder<DocumentSnapshot>(
                    future: customers.doc(signUpData.uid).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }
                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.20,
                            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Opacity(
                                  opacity: 0.24,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x7f840899),
                                          blurRadius: 35,
                                          offset: Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff9e6efd),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05),
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                AssetImage('img/user.png'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05),
                                          child: Text('GUEST'.toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ]),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 1),
                                child: Opacity(
                                  opacity: 1,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Color.fromARGB(255, 145, 131, 172),
                                          Color.fromARGB(235, 145, 131, 172),
                                          Color.fromARGB(210, 145, 131, 172),
                                          Color.fromARGB(130, 145, 131, 172),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.9),
                                child: Container(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        shape: StadiumBorder(),
                                        side: BorderSide(color: Colors.white)),
                                    onPressed: () => {
                                      Navigator.of(context)
                                          .pushNamed('/login_page')
                                    },
                                    child: Text(
                                      'Log in/Sign up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]));
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.20,
                            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Opacity(
                                  opacity: 0.24,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x7f840899),
                                          blurRadius: 35,
                                          offset: Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff9e6efd),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05),
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                AssetImage('img/user.png'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05),
                                          child: Text(
                                              data['name'].toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ]),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 1),
                                child: Opacity(
                                  opacity: 1,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Color.fromARGB(255, 145, 131, 172),
                                          Color.fromARGB(235, 145, 131, 172),
                                          Color.fromARGB(210, 145, 131, 172),
                                          Color.fromARGB(130, 145, 131, 172),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.9),
                                child: Container(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        shape: StadiumBorder(),
                                        side: BorderSide(color: Colors.white)),
                                    onPressed: () => {
                                      Navigator.of(context)
                                          .pushNamed('/login_page')
                                    },
                                    child: Text(
                                      'See more',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]));
                      }
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xff9163f3)),
                      );
                    }),
                TextButton(
                  child: Text(
                    'log out',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () async {
                    MyAlertDilaog.showMyDialog(
                      context: context,
                      title: 'Log Out',
                      content: 'are you sure to log out',
                      tabNo: () {
                        Navigator.pop(context);
                      },
                      tabYes: () async {
                        await FirebaseAuth.instance.signOut();

                        ref.read(signUpProvider.notifier).uidInput(null);
                        Navigator.pop(context);
                        // Navigator.of(context).pushNamedAndRemoveUntil(
                        //     "/", ModalRoute.withName('profile_page'));
                      },
                    );
                  },
                ),
                Padding(padding: const EdgeInsets.only(top: 20)),
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xff48366d), Color(0xff2c2339)],
                  )),
                  child: Column(
                    children: [
                      const ProfileHeaderLabel(
                          headerLabel: '  acount setting  '),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height: 275,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: const [
                                  ListTile(
                                    title: Text(
                                      'payment method',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading: Icon(Icons.account_balance_wallet,
                                        size: 30),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        color: Color.fromARGB(255, 77, 18, 88),
                                        thickness: 1,
                                      )),
                                  ListTile(
                                    title: Text(
                                      'member information ',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading:
                                        Icon(Icons.manage_accounts, size: 30),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        color: Color.fromARGB(255, 77, 18, 88),
                                        thickness: 1,
                                      )),
                                  ListTile(
                                    title: Text(
                                      'notification/sound',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading: Icon(Icons.tune, size: 30),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        color: Color.fromARGB(255, 77, 18, 88),
                                        thickness: 1,
                                      )),
                                  ListTile(
                                    title: Text(
                                      'security and privacy',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading:
                                        Icon(Icons.verified_user, size: 30),
                                  ),
                                ],
                              ))),
                      const ProfileHeaderLabel(headerLabel: '  acount info  '),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height: 275,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: const [
                                  ListTile(
                                    title: Text(
                                      'privacy policy',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading: Icon(Icons.policy, size: 30),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        color: Color.fromARGB(255, 77, 18, 88),
                                        thickness: 1,
                                      )),
                                  ListTile(
                                    title: Text(
                                      'available stores',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading: Icon(Icons.store, size: 30),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        color: Color.fromARGB(255, 77, 18, 88),
                                        thickness: 1,
                                      )),
                                  ListTile(
                                    title: Text(
                                      'how to contact me',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading:
                                        Icon(Icons.contact_support, size: 30),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        color: Color.fromARGB(255, 77, 18, 88),
                                        thickness: 1,
                                      )),
                                  ListTile(
                                    title: Text(
                                      'FAQ',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading:
                                        Icon(Icons.question_answer, size: 30),
                                  ),
                                ],
                              ))),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0, bottom: 30.0),
                          child: Container(
                              height: 135,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: const [
                                  ListTile(
                                    title: Text(
                                      'change to member store',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading: Icon(Icons.storefront, size: 30),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        color: Color.fromARGB(255, 77, 18, 88),
                                        thickness: 1,
                                      )),
                                  ListTile(
                                    title: Text(
                                      'logout',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    leading: Icon(Icons.logout, size: 30),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
