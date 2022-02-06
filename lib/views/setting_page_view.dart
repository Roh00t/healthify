import 'package:flutter/material.dart';
import 'package:healthify/services/notification_api_service.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotications();
  }

  void listenNotications() => NotificationApi.onNotification.stream;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(  
                  child: Text("Test Notification", style: TextStyle(fontSize: 20.0),),  
                  onPressed: () => NotificationApi.showNotification(
                    title: 'Healthify',
                    body: 'Hey! Your Nofications are working!',
                    payload: ''
                  ),  
                ),  
              ],
            ),
          ),
        ),
      ),
    );
  }
}