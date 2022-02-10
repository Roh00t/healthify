import 'package:flutter/material.dart';
import 'package:healthify/views/addFeedback_page_view.dart';
import 'package:healthify/views/sendEmail.dart';
import 'package:healthify/views/showFeedback_page_view.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Feedback System'),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image(
            width: 24,
            color: Colors.white,
            image: AssetImage('assets/images/back_arrow.png'),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.add_box),
                iconSize: 60,
                tooltip: 'add Feedback',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddFeedbackPage()));
                },
              ),
               IconButton(
                icon: Icon(Icons.email),
                iconSize: 60,
                tooltip: 'Send Email',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SendEmail()));
                },
              ),
              IconButton(
                icon: Icon(Icons.list),
                iconSize: 60,
                tooltip: 'View Feedbacks',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ViewFeedbackPage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
} //HomePageState