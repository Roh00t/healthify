import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:healthify/widgets/icon_widget.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'About',
        subtitle: 'Learn more about the app',
        leading: IconWidget(
          icon: Icons.info,
          color: Colors.grey,
        ),
        child: SettingsScreen(
          title: 'About',
          children: <Widget>[
            const SizedBox(height: 24),
              buildName(),
              const SizedBox(height: 48),
              buildAbout(),
          ],
        ),
      );
}
  Widget buildName() => Column(
        children: [
           Text(
              'Developer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
          Text(
            'Rohit',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            "pandarohit05@gmail.com",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );


  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "Currently, as of 2019, 8.6% of Singaporeans are obese. Ever since the pandemic and circuit breaker hit, the number is constantly increasing. This shows that current health and fitness apps like Healthy 365 and Nike’s fitness apps aren’t working effectively. Healthify aims to be a health and fitness combined app that will motivate the user to stay fit and healthy",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
