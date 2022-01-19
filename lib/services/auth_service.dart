import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  User loggedInUser;
  //For Firebase Auth
  Future<User> signIn({String email, String password}) async {
    try {
      UserCredential ucred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = ucred.user;
      print("Signed In successful! userid: $ucred.user.uid, user: $user.");
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signIn

  Future<User> signUp({String name, String email, String password}) async {
    try {
      UserCredential ucred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = ucred.user;
      print('Signed Up successful! user: $user');
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signUp

//Checking if User is logged in
  void getCurrentUser() async {
    try {
      var user =  _firebaseAuth.currentUser;
      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e.message);
    }
  }

  //User Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      print('Signed Out successful!');
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signOut
}
