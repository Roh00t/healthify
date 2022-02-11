import 'package:flutter/material.dart';

class MyPasswordField extends StatelessWidget {
  const MyPasswordField({
    Key key,
    @required this.controllerInput,
    @required this.isPasswordVisible,
    @required this.onTap,
  }) : super(key: key);

  final bool isPasswordVisible;
  final Function onTap;
  final TextEditingController controllerInput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controllerInput,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ).copyWith(
          color: Colors.white,
        ),
        obscureText: isPasswordVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: onTap,
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          hintText: 'Password',
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
