import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key key,
    @required this.controllerType,
    @required this.hintText,
    @required this.inputType,
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controllerType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controllerType,
        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ).copyWith(color: Colors.white),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: hintText,
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
