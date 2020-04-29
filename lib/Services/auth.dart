import 'package:firebase_auth/firebase_auth.dart';
import 'package:focus7/Models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

final AuthService authService = AuthService();

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creating user object
  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null
        ? User(
            uid: user.uid,
            name: user.displayName,
            email: user.email,
            phone: user.phoneNumber,
            photo: user.photoUrl)
        : null;
  }

  //auth change user stream
  Stream<User> get user => _auth.onAuthStateChanged.map(_userFromFireBaseUser);

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
      //TODO send data to backend

      //TODO create userprofle for the user
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final FirebaseUser user = result.user;

      return user;
      //TODO send data to backend
      //TODO authenticate using Admin SDK in backend

    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      final AuthResult result = await _auth.signInWithCredential(credential);

      final FirebaseUser user = result.user;

      print("signed in " + user.displayName);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
