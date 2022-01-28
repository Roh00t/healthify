import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';

class EditProfilePage extends StatefulWidget {
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
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image(
                width: 24,
                color: Colors.white,
                image: AssetImage('assets/images/back_arrow.png'),
              ),
            ),
          ),
          body: Container(),
        ));
  }
}
