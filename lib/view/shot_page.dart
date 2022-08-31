import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shot_dev/view/profile/login.dart';
import 'package:flutter_shot_dev/widgets/alert_dialog.dart';
import 'package:flutter_shot_dev/widgets/profile_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/hoempage_notifier.dart';
import 'package:flutter_shot_dev/test_data/homepage_data.dart';

class ShotPage extends HookConsumerWidget {
  ShotPage({
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

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xff48366d), Color(0xff2c2339)],
      )),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  Padding(padding: const EdgeInsets.only(top: 40)),
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff48366d), Color(0xff2c2339)],
                    )),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment(0, 0),
                                  child: Opacity(
                                      opacity: 0.24,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.95,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x7f840899),
                                              blurRadius: 35,
                                              offset: Offset(0, 8),
                                            ),
                                          ],
                                          color: Colors.white,
                                        ),
                                      ))),
                              Align(
                                alignment: Alignment(0, -0.8),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xff9e6efd),
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment(0, 1),
                                  child: Opacity(
                                    opacity: 0.24,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.23,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x7f840899),
                                            blurRadius: 35,
                                            offset: Offset(0, 8),
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const ProfileHeaderLabel(
                            headerLabel: '  acount setting  '),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                height: 275,
                                decoration: BoxDecoration(
                                    color: Color(0xff9e6efd),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  children: const [
                                    ListTile(
                                      title: Text(
                                        'payment method',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      leading: Icon(
                                          Icons.account_balance_wallet,
                                          size: 30),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                        const ProfileHeaderLabel(
                            headerLabel: '  acount info  '),
                      ],
                    ),
                  ),
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
                                      leading: Icon(
                                          Icons.account_balance_wallet,
                                          size: 30),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                        const ProfileHeaderLabel(
                            headerLabel: '  acount info  '),
                      ],
                    ),
                  ),
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
                                      leading: Icon(
                                          Icons.account_balance_wallet,
                                          size: 30),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                                          color:
                                              Color.fromARGB(255, 77, 18, 88),
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
                        const ProfileHeaderLabel(
                            headerLabel: '  acount info  '),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        ]),
      ),
    );
  }
}
