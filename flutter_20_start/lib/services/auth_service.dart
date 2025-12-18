import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  SIGN UP
  Future<User?> signup(String email, String Password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: Password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for this email';
      } else if (e.code == 'wrong-password') {
        throw 'Incorrect password';
      } else if (e.code == 'invalid-email') {
        throw 'Invalid email address';
      } else {
        throw 'Login failed. Try again';
      }
    }
  }

  // LOGIN

  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for this email';
      } else if (e.code == 'wrong-password') {
        throw 'Incorrect password';
      } else if (e.code == 'invalid-email') {
        throw 'Invalid email address';
      } else {
        throw 'Login failed. Try again';
      }
    }
  }

  // LOGOUT
  Future<void> logOut() async {
    await _auth.signOut();
  }
}
