import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:provider/provider.dart';
class ProfilePage extends StatefulWidget {
    static const String id = "profile_page";
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
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Sign Out',
        onPressed: () async {
           await AuthService().signOut();
            Navigator.pop(context);
        },
      ),
      ),
    );
  }
}