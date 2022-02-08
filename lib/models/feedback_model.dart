class FeedbackModel {
  String uid;
  String displayName;
  String title;
  String description;
  FeedbackModel({this.uid, this.displayName, this.title, this.description});
  FeedbackModel.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    displayName = data['displayName'];
    title = data['title'];
    description = data['description'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'title': title,
      'description': description
    };
  }
}
