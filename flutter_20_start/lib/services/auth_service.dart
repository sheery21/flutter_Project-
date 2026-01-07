import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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

      User? user = userCredential.user;
      if (user == null) throw 'User not found';

      String? idToken = await user.getIdToken();

      print("ID Token: $idToken");

      return user;
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

  // LOGIN WITH GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Google Error: $e");
      rethrow;
    }
  }

  // LOGIN WITH FACEBOOK
  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Facebook Error: $e");
      rethrow;
    }
  }

  Future<UserCredential> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId:
              'com.your.service.id', // Service ID from Apple Developer Portal
          redirectUri: Uri.parse('your-firebase-app.firebaseapp.com'),
        ),
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (e) {
      print("Apple Error: $e");
      rethrow;
    }
  }

  // LOGOUT
  Future<void> logOut() async {
    await _auth.signOut();
  }
}
