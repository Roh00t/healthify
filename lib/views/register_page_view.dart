import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:healthify/services/firestore_service.dart';
import 'package:provider/provider.dart';
import '../widgets/widget.dart';
import '../constants.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            style: kHeadline,
                          ),
                          Text(
                            "Create new account to get started.",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          MyTextField(
                            controllerType: nameController,
                            hintText: 'Name',
                            inputType: TextInputType.name,
                          ),
                          MyTextField(
                            controllerType: emailController,
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                          ),
                          MyPasswordField(
                            controllerInput: passwordController,
                            isPasswordVisible: passwordVisibility,
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Text(
                            'Sign In',
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
                      buttonName: 'Register',
                      onTap: () async {
                        try {
                        var newuser = await authService.signUp(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        if (newuser != null) {
                          FirestoreService().addUserData(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim());
                           Navigator.of(context).pushNamed('/home');
                        } else {
                           Navigator.of(context).pushNamed('/welcome');
                        }
                        } catch (e) {
                          print("This is an exception from Register Page at Register Btn "+e.message);
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
