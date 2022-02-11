import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:healthify/services/user_preferences_service.dart';
import 'package:healthify/views/fitness_page_view.dart';
import 'package:healthify/views/menu_page_view.dart';
import 'package:healthify/views/searchRecipe_page_view.dart';
import 'package:healthify/views/setting_page_view.dart';
import 'package:healthify/views/welcome_page_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  // ignore: deprecated_member_use
  List<Widget> _listPages = List();
  @override
  void initState() {
    super.initState();
    _listPages..add(FitnessPage())..add(MenuPage())..add(SearchScreen())..add(SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    UserPreferences.getUser();
     AuthService().getCurrentUser();
    return ThemeProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: _listPages[_currentIndex],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).primaryColor,
            //shape property must be set to NotchedShape
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.fitness_center),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.menu_book_outlined),
                  color: Colors.white,
                  
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings_applications_sharp),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                ),
                Divider(),
              ],
            ),
          ),
          //set the docked position- centerDocked or endDocked
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FloatingActionButton(
          child: Icon(Icons.logout),
          backgroundColor: Theme.of(context).primaryColor,
          tooltip: 'Sign Out',
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WelcomePage()));
          },
        ),
        ),
      ),
    );
  }
}