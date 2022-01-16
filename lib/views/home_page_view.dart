import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:healthify/views/welcome_page_view.dart';

const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');

class HomePage extends StatelessWidget {
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
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: homeBackgroundColor,
          title: Text('Home'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello'),
          ),
        ),
              floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Sign Out',
        onPressed: () async {
          await AuthService().signOut();
          Navigator.of(context).pushReplacementNamed('/login');
        },
      ),
      ),
    );
  }
}
