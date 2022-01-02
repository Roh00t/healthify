import 'package:flutter/material.dart';
import 'package:healthify/models/user_model.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:healthify/views/home_page_view.dart';
import 'package:healthify/views/login_page_view.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User> snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final User user = snapshot.data;
          return user == null ? LoginPage() : HomePage();
        }else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
              
            ),
          );
        }
      });
  }
  
}