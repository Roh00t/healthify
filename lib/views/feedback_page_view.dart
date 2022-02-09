import 'package:flutter/material.dart';
import 'package:healthify/views/addFeedback_page_view.dart';
import 'package:healthify/views/showFeedback_page_view.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("FeedBack System", style: TextStyle(fontSize: 30)),
          SizedBox(height: 80),
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
                icon: Icon(Icons.list),
                iconSize: 60,
                tooltip: 'view Feedbacks',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ViewFeedbackPage()));
                },
              ),
            ],
          ),
        ],
      ),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Back',
        onPressed: () async {
          Navigator.of(context).pop();
        },
      ),
    );
  }
} //HomePageState