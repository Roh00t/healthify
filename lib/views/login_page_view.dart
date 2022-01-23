import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/services/auth_service.dart';

import 'package:healthify/widgets/my_password_field.dart';
import 'package:healthify/widgets/my_text_button.dart';
import 'package:healthify/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
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
      body: SafeArea(
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back.",
                            style: kHeadline,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You've been missed!",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          MyTextField(
                            controllerType: emailController,
                            hintText: 'Email',
                            inputType: TextInputType.text,
                          ),
                          MyPasswordField(
                            controllerInput: passwordController,
                            isPasswordVisible: isPasswordVisible,
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                             Navigator.of(context).pushNamed('/register');
                          },
                          child: Text(
                            'Register',
                            style: kBodyText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: 'Sign In',
                      onTap: () async {
                        try {
                        var reguser = await authService.signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        if (reguser != null) {
                          print("User signed in successfully");
                          Navigator.of(context).pushNamed('/home');
                              
                        }else{
                          print("User not found");
                           Navigator.of(context).pushNamed('/welcome');
                        }
                        } catch (e) {
                          print("This is an exception from Login Page at Login Btn "+e.message);
                        }
                      },
                      
                      bgColor: Colors.white,
                      textColor: Colors.black87,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
