import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    } catch (e) {
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
    print('User: $userList');
    return userList;
  }

//for your reference
  Future<void> updateUserData(String userName, String userEmail) async {
    try{
    var docRef = FirestoreService().userCollection.doc();
    print('update docRef: ' + docRef.id);
    Fluttertoast.showToast(msg: 'Data Updated Successfully', gravity: ToastGravity.TOP);
    await userCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'name': userName,
      'email': userEmail,
    });
     } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> deleteUserData(String docId) async {
    try {
    userCollection.doc(docId).delete();
    print('deleting' + docId);
     } catch (e) {
      print(e);
      return null;
    }
  }

  //Delete All Users
  Future<void> deleteAllUserData() async {
    try {
      await userCollection.get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
    } catch (e) {
      print(e);
      return null;
    }
  }
}
