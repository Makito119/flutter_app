import 'package:flutter/material.dart';
import 'game_page.dart';
import 'test_page.dart';
import 'shot_page.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.transparent),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  static List<Widget> _pageList = [GamePage(), ShotPage(), TestPage()];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar3 = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(76),
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
              icon: Icon(Icons.sports_esports),
              label: 'GAME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wine_bar),
              label: 'SHOT',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'PROFILE',
            ),
          ],
          currentIndex: _selectedIndex,
          // デフォルトでshiftingタイプが設定されてしまうため、fixedタプを指定
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInExpo);
          },
        ));
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
            duration: Duration(milliseconds: 100), curve: Curves.easeInExpo);
      },
    );

    var scaffold = Scaffold(
        extendBody: true,
        appBar: AppBar(
            backgroundColor: Colors.black, title: const Text("homepage")),
        body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pageList),
        bottomNavigationBar: bottomNavigationBar3);
    return scaffold;
  }
}
