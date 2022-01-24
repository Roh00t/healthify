import 'package:flutter/material.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:healthify/views/fitness_page_view.dart';
import 'package:healthify/views/menu_page_view.dart';
import 'package:healthify/views/setting_page_view.dart';

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
    _listPages..add(FitnessPage())..add(MenuPage())..add(SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    AuthService().getCurrentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        body: SafeArea(
          child: _listPages[_currentIndex],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue.shade200,
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
                icon: Icon(Icons.settings_applications_sharp),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
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
        backgroundColor: Colors.blueAccent,
        tooltip: 'Sign Out',
        onPressed: () async {
          await AuthService().signOut();
          Navigator.of(context).pop('/login');
        },
      ),
      ),
    );
  }
}

Widget openBottomDrawer() {
  return Drawer(
    child: Column(
      children: <Widget>[
        //Add menu item to edit
        ListTile(
          leading: const Icon(Icons.mode_edit),
          title: const Text('Edit'),
          onTap: () {
            print('Edit tapped..');
          },
        ),
        ListTile(
          //Add menu item to add
          leading: const Icon(Icons.add),
          title: const Text('Add'),
          onTap: () {
            print('Add tapped..');
          },
        ),
      ],
    ),
  );
}
