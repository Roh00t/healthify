import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: homeBackgroundColor,
          title: Text('Profile Page'),
        ),
        body: Center(
          
        ),
        
      ),
    );
  }
}