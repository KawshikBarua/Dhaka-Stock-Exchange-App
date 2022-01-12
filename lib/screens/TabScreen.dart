import 'package:flutter/material.dart';
import 'package:stock_market/utils/constants.dart';
import 'package:stock_market/screens/HomePage.dart';
import 'package:stock_market/screens/Profilepage.dart';
import 'package:stock_market/screens/ViewAllPage.dart';

class TabScreen extends StatefulWidget {
  State<StatefulWidget> createState() => TabScreenState();
}

class TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  final tabIcons = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.view_list), label: "View All"),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded), label: "Profile")
  ];

  final tabs = [HomePage(), ViewAllPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: dark_blue,
            selectedItemColor: white,
            unselectedItemColor: light_blue.shade100,
            showUnselectedLabels: true,
            selectedFontSize: 15,
            currentIndex: _currentIndex,
            items: tabIcons,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
        body: tabs[_currentIndex]);
  }
}
