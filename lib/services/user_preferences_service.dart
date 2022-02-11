
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthify/models/user_model.dart';

class UserPreferences {
 static  SharedPreferences _preferences;
  
    static const _keyUser = 'user';
  static  UserModel myUser = UserModel(
    name: 'Your Name',
    email: 'youremail@gmail.com',

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