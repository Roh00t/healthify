import 'package:flutter/material.dart';
import 'package:healthify/services/firestore_feedback_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddFeedbackPage extends StatefulWidget {
  @override
  _AddFeedbackPageState createState() => _AddFeedbackPageState();
}

class _AddFeedbackPageState extends State<AddFeedbackPage> {
  String feedbackdisplayName;
  String feedbackTitle;
  String feedbackDescription;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Saving Feedback Record'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (val) => val.length == 0 ? "Enter Name" : null,
                  onSaved: (val) => this.feedbackdisplayName = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (val) => val.length == 0 ? 'Enter Title' : null,
                  onSaved: (val) => this.feedbackTitle = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Description' : null,
                  onSaved: (val) => this.feedbackDescription = val,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _submit,
                          child: Text('Submit Feedback'),
                        ),
                      
                        ElevatedButton(
                          onPressed:()=> Navigator.of(context).pop(),
                          child: Text('Cancel'),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreFeedbackService().addFeedbackData(
        feedbackdisplayName, feedbackTitle, feedbackDescription);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState