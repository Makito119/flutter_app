import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shot_dev/model/profilepage_notifier.dart';
import 'package:flutter_shot_dev/test_data/homepage_data.dart';
import 'package:flutter_shot_dev/test_data/profilepage_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/hoempage_notifier.dart';

class MyHomePage extends HookConsumerWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);
  final _appBarName = ['ゲーム', 'ショットページ', 'プロフィール'];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageData homePageData = ref.watch(homepageProvider);
    print(homePageData.bottomNaviChange);
    return Scaffold(
        extendBody: true,
        appBar: homePageData.bottomNaviChange != 0
            ? null
            : AppBar(
                backgroundColor: Color(0xff2c233a),
                title: Text(_appBarName[homePageData.bottomNaviChange])),
        body: homePageData.pageList[homePageData.bottomNaviChange],
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: homePageData.showNavigation ? 110 : 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x59763380),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff423262), Color(0xff282232)],
            ),
          ),
          child: Wrap(children: [
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_esports, size: 40),
                  label: 'GAME',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wine_bar, size: 40),
                  label: 'SHOT',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle, size: 40),
                  label: 'PROFILE',
                ),
              ],
              currentIndex: homePageData.bottomNaviChange,
              // デフォルトでshiftingタイプが設定されてしまうため、fixedタプを指定
              type: BottomNavigationBarType.fixed,
              onTap: (index) =>
                  ref.read(homepageProvider.notifier).changeIndex(index),
            )
          ]),
        ));
  }
}
