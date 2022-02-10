import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyThemes extends ChangeNotifier {
  ThemeData _selectedTheme;

  static final primary = Colors.blue;
  static final primaryColor = Colors.blue.shade300;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    accentColor: Colors.blue,
    colorScheme: ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );

  MyThemes({bool isDarkMode}) {
    if (isDarkMode == null) {
      _selectedTheme = lightTheme;
    } else {
      _selectedTheme = isDarkMode ? darkTheme : lightTheme;
    }
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_selectedTheme == darkTheme) {
      _selectedTheme = lightTheme;
      prefs.setBool("isDarkTheme", false);
    } else {
      _selectedTheme = darkTheme;
      prefs.setBool("isDarkTheme", true);
    }
    notifyListeners();
    //notifylisteners calls for them to rebuild
  }

  ThemeData get getTheme => _selectedTheme;
}




