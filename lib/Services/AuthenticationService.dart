import 'package:cz3002_iattend/Models/iAttendUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  // iAttendUser _userFromFirebaseUser(User? user) {
  //   if (user != null) {
  //     return iAttendUser(email: user.email, firstName: user.displayName);
  //   } else {
  //     return null;
  //   }}

  // auth change user stream
  Stream<User?> get user {
    // return _auth.authStateChanges();
    return _auth.userChanges();
  }

  // sign in
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register
  Future registerWithEmailAndPassword(String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await user?.updateDisplayName(name);
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // current user display name
  String? getCurrentDisplayName() {
    return _auth.currentUser!.displayName;
  }
}