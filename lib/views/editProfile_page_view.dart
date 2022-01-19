import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
class EditProfilePage extends StatefulWidget {
  static const String id = "editProfile_page";
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: homeBackgroundColor,
          title: Text('Edit Profile'),
        ),
        body: Center(
          
        ),
      ),
    );
  }
}