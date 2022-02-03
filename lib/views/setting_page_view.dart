import 'package:flutter/material.dart';
import 'package:healthify/services/notification_api_service.dart';
import 'package:healthify/views/home_page_view.dart';

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

  void listenNotications() => NotificationApi.onNotification.stream.listen(onClickedNotification);
  void onClickedNotification(String payload)=> Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              Text(
                'Manage Nofications',
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(  
                child: Text("Test Notification", style: TextStyle(fontSize: 20.0),),  
                
                onPressed: () => NotificationApi.showNotification(
                  title: 'App Developer',
                  body: 'Hey! Your Nofications are working!',
                  payload: ''
                ),  
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(  
                child: Text("Schedule Notification", style: TextStyle(fontSize: 20.0),),  
                
                onPressed: () => NotificationApi.showNotification(
                  title: 'App Developer',
                  body: 'Hey! Your Nofications are working!',
                  payload: ''
                ),  
              ),    
            ],
          ),
        ),
      ),
    );
  }
}