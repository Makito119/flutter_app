import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shot_dev/model/homepage_data.dart';
import 'package:flutter_shot_dev/view/game_page.dart';
import 'package:flutter_shot_dev/view/profile_page.dart';
import 'package:flutter_shot_dev/view/shot_page.dart';
import 'package:flutter_shot_dev/view_model/shotpage_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../view_model/hoempage_notifier.dart';

class MyHomePage extends HookConsumerWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);
  final _appBarName = ['ゲーム', 'ショットページ', 'プロフィール'];
  final List<Widget> _pageList = [
    GamePage(),
    ShotPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    HomePageData homePageData = ref.watch(homepageProvider);
    print(homePageData.bottomNaviChange);
    return Scaffold(
        extendBody: true,
        appBar: homePageData.bottomNaviChange != 0
            ? null
            : AppBar(
                shadowColor: Color(0x7f840899),
                elevation: 10,
                backgroundColor: Color(0xff2c233a),
                title: Text(_appBarName[homePageData.bottomNaviChange])),
        body: _pageList[homePageData.bottomNaviChange],
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: homePageData.showNavigation ? 96 : 0,
          color: Color(0xff282232),
          child: Wrap(children: [
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_esports, size: 38),
                  label: 'GAME',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wine_bar, size: 38),
                  label: 'SHOT',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle, size: 38),
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
