import 'package:flutter/material.dart';
import 'package:healthify/views/login_page_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LoginPage()
    );
  }
}