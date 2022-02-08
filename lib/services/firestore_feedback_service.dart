import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthify/models/feedback_model.dart';

class FirestoreFeedbackService {
  // Create a CollectionReference called feedbackCollection that references
  // the firestore collection
  final CollectionReference feedbackCollection =
      FirebaseFirestore.instance.collection('feedbacks');
  Future<void> addFeedbackData(
      String feedbackdisplayName, String feedbackTitle, String feedbackDescription) async {
    var docRef = FirestoreFeedbackService().feedbackCollection.doc();
    print('add docRef: ' + docRef.id);
    await feedbackCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'displayName': feedbackdisplayName,
      'title': feedbackTitle,
      'description': feedbackDescription
    });
  } 

  Future<List<FeedbackModel>> readFeedbackData() async {
    List<FeedbackModel> feedbackList = [];
    QuerySnapshot snapshot = await feedbackCollection.get();
    snapshot.docs.forEach((document) {
      FeedbackModel feedback = FeedbackModel.fromMap(document.data());
      feedbackList.add(feedback);
    });
    print('Feedback: $feedbackList');
    return feedbackList;
  } //readBookData

  Future<void> deleteFeedbackData(String docId) async {
    feedbackCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } 

  //for your reference
  Future<void> updateFeedbackData(
     String feedbackdisplayName, String feedbackTitle, String feedbackDescription) async {
    var docRef = FirestoreFeedbackService().feedbackCollection.doc();
    print('update docRef: ' + docRef.id);
    await feedbackCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'author': feedbackdisplayName,
      'title': feedbackTitle,
      'description': feedbackDescription
    });
  } 

  //for your reference
  Future<void> deleteFeedbackDoc() async {
    await feedbackCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } 
} //FirestoreService