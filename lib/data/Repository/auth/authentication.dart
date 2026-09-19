import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //acc create by using email and password

  Future<void> Signupwithemail(String Email, String Password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginwithemail(String Email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: Email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
