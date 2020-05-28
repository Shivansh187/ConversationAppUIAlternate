import 'package:com/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:com/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create User Object based on Firebase User
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(id: user.hashCode) : null;
  }

  // Auth change User Stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

//  // Login as Guest
//  Future signInAnon() async {
//    try {
//      AuthResult result = await _auth.signInAnonymously();
//      FirebaseUser user = result.user;
//      return _userFromFirebaseUser(user);
//    } catch (e) {
//      print(e.toString());
//      return null;
//    }
//  }

  // Login with Email and Password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with Email and Password
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // Create a New Document for the User with the UID
      await DatabaseService(uid: user.uid).updateUserData('New Member');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Logout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
