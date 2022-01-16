import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  //For Firebase Auth 
  Future<User> signIn({String email, String password}) async {
 try {
 UserCredential ucred = await _firebaseAuth.signInWithEmailAndPassword(
 email: email, password: password);
 User user = ucred.user;
 print("Signed In successful! userid: $ucred.user.uid, user: $user.");
 return user;
 } on auth.FirebaseAuthException catch (e) {
 Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
 return null;
 } catch (e) {
 print(e.message);
 return null;
 }
} //signIn
 Future<User> signUp({String name,String email, String password}) async {
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
 Future<void> signOut() async {
 await _firebaseAuth.signOut();
 } //sig
}
