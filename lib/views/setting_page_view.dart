import 'package:flutter/material.dart';
import 'package:healthify/services/notification_api_service.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:healthify/views/feedback_page_view.dart';
import 'package:healthify/widgets/icon_widget.dart';

import 'about_page_view.dart';

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
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              SettingsGroup(
                title: 'General',
                children: [
                  
                  buildDeleteAccount(),
                  AboutPage(),

                ],
              ),
              const SizedBox(height: 32,),
              SettingsGroup(
                title: 'Feedback',
                children: [
                  const SizedBox(height: 8,),
                  buildReportBug(context),
                  buildSendFeedback(context),
                ],
              ),
              testNotification()
            ],
          ),
        ),
      ),
    );
  }


//For Notifications
  Widget testNotification() => ElevatedButton(
        child: Text(
          "Test Notification",
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () => NotificationApi.showNotification(
            title: 'Healthify',
            body: 'Hey! Your Nofications are working!',
            payload: ''),
      );
      Widget buildDeleteAccount()=> SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(icon: Icons.delete,color: Colors.pink),
        onTap: () {},
      );
       Widget buildReportBug(BuildContext context)=> SimpleSettingsTile(
        title: 'Report Bug',
        subtitle: '',
        leading: IconWidget(icon: Icons.bug_report,color: Colors.red),
        onTap: () {},
      );
       Widget buildSendFeedback(BuildContext context)=> SimpleSettingsTile(
        title: 'Send Feedback',
        subtitle: '',
        leading: IconWidget(icon: Icons.feedback,color: Colors.orange),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> FeedbackPage()));
        },
      );
}


