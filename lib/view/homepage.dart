import 'package:flutter/material.dart';
import 'game_page.dart';
import 'test_page.dart';
import 'shot_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/hoempage_notifier.dart';

class MyHomePage extends HookConsumerWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  final List _pageList = [GamePage(), ShotPage(), TestPage()];
  final _appBarName = ['ゲーム', 'ショットページ', 'プロフィール'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabType = ref.watch(tabtypeProvider);

    var bottomNavigationBar3 = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
        child: BottomNavigationBar(
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
          currentIndex: tabType,
          // デフォルトでshiftingタイプが設定されてしまうため、fixedタプを指定
          type: BottomNavigationBarType.fixed,
          onTap: (index) => ref.read(tabtypeProvider.notifier).state = index,
        ));
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
            backgroundColor: Color(0xff2c233a),
            title: Text(_appBarName[tabType])),
        body: _pageList[tabType],
        bottomNavigationBar: bottomNavigationBar3);
  }
}
