import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        child: Center(
          child: FloatingActionButton.extended(
            icon: FaIcon(FontAwesomeIcons.google), 
            onPressed: () {
              GoogleSignIn().signIn();
            },
            label: Text("Sign In With Google"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
