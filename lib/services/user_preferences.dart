
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthify/models/user_model.dart';

class UserPreferences {
 static  SharedPreferences _preferences;
  
    static const _keyUser = 'user';
  static  UserModel myUser = UserModel(
    imagePath:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Your',
    email: 'youremail@gmail.com',
    about:
        'Write Something About Yourself',
    isDarkMode: false,
  );

   static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

   static Future setUser(UserModel user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

    static UserModel getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : UserModel.fromJson(jsonDecode(json));
  }
}