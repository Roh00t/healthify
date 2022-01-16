import 'package:cloud_firestore/cloud_firestore.dart';
class FirestoreService {
 // Create a CollectionReference called bookCollection that references
 // the firestore collection
 final CollectionReference userCollection =
 FirebaseFirestore.instance.collection('users');
 Future<void> addUserData(
 String userName, String userEmail, String userPassword) async {
 var docRef = FirestoreService().userCollection.doc();
 print('add docRef: ' + docRef.id);
 await userCollection.doc(docRef.id).set({
 'uid': docRef.id,
 'name': userName,
 'email': userEmail,
 'password': userPassword
 });
 }
}