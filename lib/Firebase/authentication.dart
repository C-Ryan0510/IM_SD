import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/Pages/login_page.dart';

class AuthService{
  // FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in email&password/*<void>*/
  Future signInWithCredentials(String email, String password) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  // register email&password/*<UserCredential>*/
  Future signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<bool> isSignIn() async{
    final currentUser = await _auth.currentUser;
    return currentUser != null;//return true when is NOT null
  }
  Future<String?> getUser() async{
    return await _auth.currentUser?.email;
  }

}