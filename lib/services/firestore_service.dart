import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthify/models/user_model.dart';

class FirestoreService {
  // Create a CollectionReference called bookCollection that references
  // the firestore collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  Future<void> addUserData(
    String userName, String userEmail, String userPassword) async {
      try {
    var docRef = FirestoreService().userCollection.doc();
    print('added User: ' + docRef.id);
    await userCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'name': userName,
      'email': userEmail,
      'password': userPassword,
    });
      } catch(e){
        print(e.message);
      }
  }

  Future<List<UserModel>> readUserData() async {
    List<UserModel> userList = [];
    QuerySnapshot snapshot = await userCollection.get();
    snapshot.docs.forEach((document) {
      UserModel user = UserModel.fromMap(document.data());
      userList.add(user);
    });
    print('Userlist: $userList');
    return userList;
  }
//for your reference
  Future<void> updateUserData(
      String userName, String userEmail, String userPassword) async {
    var docRef = FirestoreService().userCollection.doc();
    print('update docRef: ' + docRef.id);
    await userCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'name': userName,
      'email': userEmail,
      'password': userPassword,
    });
  } 

  //for your reference
  Future<void> deleteUserData() async {
    await userCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } 
}
