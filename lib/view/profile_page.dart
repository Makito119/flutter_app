import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shot_dev/view/profile/login.dart';
import 'package:flutter_shot_dev/widgets/alert_dialog.dart';
import 'package:flutter_shot_dev/widgets/profile_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/hoempage_notifier.dart';
import 'package:flutter_shot_dev/test_data/homepage_data.dart';

class ProfilePage extends HookConsumerWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageData homePageData = ref.watch(homepageProvider);
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

    return Stack(children: [
      Container(
        height: 300,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.yellow, Colors.brown])),
      ),
      CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: 110,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: constraints.biggest.height <= 120 ? 1 : 0,
                    child: const Text('Account',
                        style: TextStyle(color: Colors.black)),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.yellow, Colors.brown])),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 30),
                      child: Row(children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('img/user.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text('guest'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 103, 4, 120),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            onPressed: () => {
                              Navigator.of(context).pushNamed('/login_page')
                            },
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const Center(
                                child: Text(
                                  'log in',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: const Center(
                              child: Text(
                                'log out',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 22),
                              ),
                            ),
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
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/", ModalRoute.withName('profile_page'));
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: const Center(
                              child: Text(
                                'point',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 22),
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  )),
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
                    const ProfileHeaderLabel(headerLabel: '  acount setting  '),
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
                                  leading: Icon(Icons.verified_user, size: 30),
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
    ]);
  }
}
