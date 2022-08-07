import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
int _selectedIndex = 0;
final PageController _pageController = PageController();
var bottomNavigationBar2 = DotNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      margin: EdgeInsets.only(left: 40, right: 10),
      paddingR: const EdgeInsets.only(bottom: 10, top: 5),
      marginR: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 0.0),
      //margin: const EdgeInsets.all(40),
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.sports_esports),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.wine_bar),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.account_circle),
        ),
      ],

      currentIndex: _selectedIndex,
      // デフォルトでshiftingタイプが設定されてしまうため、fixedタプを指定
      //type: BottomNavigationBarType.fixed,
      onTap: (index) {
        _selectedIndex = index;
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      },
    );