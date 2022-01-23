import 'package:healthify/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<User> retrieve() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String name = sp.getString('name');
    String email = sp.getString('email');
    String password = sp.getString('password');
    int gender = sp.getInt('gender');
    print(name);
    print(email);
    print(email);
    print(password);
    print(gender);
    if (email != null) {
      User user = User(name: name, email: email, password: password);
      return user;
    } else
      return null;
  }
}
