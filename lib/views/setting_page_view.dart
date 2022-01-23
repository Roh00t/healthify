import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: homeBackgroundColor,
          title: Text('Settings Page'),
        ),
        body: Center(
          
        ),
        
      ),
    );
  }
}