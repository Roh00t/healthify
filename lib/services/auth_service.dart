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
      var user = _firebaseAuth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e.message);
    }
  }

  //GET UID
  Future<String> getCurrentUID() async {
    try {
      return (_firebaseAuth.currentUser).uid;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  //GET CURRENT USER
  Future currentUser() async {
    try {
      // ignore: await_only_futures
      return await _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  //UPDATE NAME
  Future<void> updateDisplayName(String displayName) async {
    try {
      // ignore: await_only_futures
      var user = await _firebaseAuth.currentUser;

      // ignore: deprecated_member_use
      user.updateProfile(
        displayName: displayName,
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  //UPDATE EMAIL
  Future<void> updateEmail(String email) async {
    try {
      // ignore: await_only_futures
      var user = await _firebaseAuth.currentUser;

      user.updateEmail(
        email,
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  //User Sign out
  Future<void> signOut() async {
    try {
      // await _firebaseAuth.signOut();
      // print('Signed Out successful!');
      FirebaseAuth.instance.authStateChanges().listen((User uid) {
        if (uid == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signOut
}
