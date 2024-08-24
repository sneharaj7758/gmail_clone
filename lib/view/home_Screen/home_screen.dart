import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/dummy_db.dart';
import 'package:gmail_clone/view/gmail_screen/gmail_screen.dart';
import 'package:gmail_clone/view/googlemeet_screen/googlemeet_screen.dart';
import 'package:gmail_clone/view/home_Screen/sections/bottomnav_section.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final int index;
  HomeScreen(this.title, this.index);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isScrollingDown = false;
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNavItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    MySize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConst.WHITE,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            GmailScreen(title: widget.title, index: widget.index),
            GooglemeetScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomnavSection(
          isScrollingDown: _isScrollingDown,
          selectedIndex: _selectedIndex,
          onNavItemTapped: _onNavItemTapped),
    );
  }
}
