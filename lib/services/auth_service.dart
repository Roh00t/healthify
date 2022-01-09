
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:healthify/models/user_model.dart';

class AuthService{
  FlutterSecureStorage storage;
  AuthService() {
    storage = new FlutterSecureStorage(); // 1
  }
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  //For Firebase Auth
  User _userFromFirebase(auth.User user){
    if(user == null){
      return null;
    }else{
      return User(user.uid, user.displayName, user.email);
    }
  }
  Stream<User> get user{
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  //Auth Functions
  Future<User> signInWithEmailAndPassword(
    String email,
    String password,
  ) async{
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password,
      ); 
      return _userFromFirebase(credential.user);
  }
    Future<User> createUserWithEmailAndPassword(
    String displayName,
    String email,
    String password,
  ) async{
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password
      );
    return _userFromFirebase(credential.user);
  }
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }
}