import 'package:flutter/material.dart';
import 'package:healthify/models/feedback_model.dart';
import 'package:healthify/services/firestore_feedback_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewFeedbackPage extends StatefulWidget {
  @override
  _ViewFeedbackPageState createState() => _ViewFeedbackPageState();
}

class _ViewFeedbackPageState extends State<ViewFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Records'),
      ),
      body: 
      FutureBuilder<List<FeedbackModel>>(
        future: FirestoreFeedbackService().readFeedbackData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data[index].displayName,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      ),
                      Column(
                        children: [
                          Text(
                            snapshot.data[index].title,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            snapshot.data[index].description,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ],
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          setState(() {
                            FirestoreFeedbackService()
                                .deleteFeedbackData(snapshot.data[index].uid);
                          });
                          Fluttertoast.showToast(
                              msg: "Data deleted successfully",
                              gravity: ToastGravity.TOP);
                        },
                      )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
} //_RecordsPageState