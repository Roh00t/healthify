import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/views/fitness_page_view.dart';
import 'package:healthify/views/home_page_view.dart';
import 'package:healthify/views/menu_page_view.dart';
import 'package:healthify/views/profile_page_view.dart';

import 'package:healthify/views/welcome_page_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');




class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int selectedIndex = 0;
  final screens = [
  HomePage(), FitnessPage(), MenuPage(), ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
      FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      if (kReleaseMode) {
        return WelcomePage();
      } else {
        return MaterialApp();
      }
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
    backgroundColor: NavBackgroundColor,
    items: <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.fitness_center, size: 30),
      Icon(Icons.menu_book_rounded, size: 30),
      Icon(Icons.person, size: 30),
    ],
    onTap: (index) {
      //Handle button tap
      setState(() {
              selectedIndex = index;
            });
    },
  ),
        body: screens[selectedIndex],
      ),
    );
  }
}
