import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: homeBackgroundColor,
          title: Text('Menu Page'),
        ),
        body: Center(
          
        ),
      ),
      
      
    );
  }
  }