import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:flutter_20_start/services/firestore_service.dart';
import 'package:flutter_20_start/services/local_storage_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  SIGN UP
  Future<User?> signup(
    String email,
    String password,
    String name, {
    required String lastName,
    required String phoneNumber,
    required String address,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user == null) throw "User not created";

      // Firestore
      await FirestoreService().saveUser(
        user: user,
        name: name,
        lastName: lastName,
        phoneNumber: phoneNumber,
        address: address,
        imageUrl: "",
      );

      // Local Storage
      await LocalStorageService.saveUser(
        uid: user.uid,
        name: name,
        lastName: lastName,
        email: email,
        phone: phoneNumber,
        address: address,
        imageUrl: "",
      );

      return user;
    } catch (e) {
      rethrow;
    }
  }

  // LOGIN

  Future<User?> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user == null) throw 'User not found';

      final firestore = FirestoreService();
      final userData = await firestore.getUser(user.uid);
      if (userData == null) throw "No user data found in Firestore!";

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(
        user: user,
        email: userData["email"],
        name: userData["name"],
        lastName: userData["lastName"],
        address: userData["address"],
        imageUrl: userData["imageUrl"],
        phoneNumber: userData["phoneNumber"],
      );

      // Local storage
      await LocalStorageService.saveUser(
        uid: user.uid,
        name: userData['name'],
        lastName: userData['lastName'],
        email: userData['email'],
        phone: userData['phoneNumber'],
        address: userData['address'],
        imageUrl: userData['imageUrl'] ?? "",
      );

      print("Login successful for: ${user.email}");
      return user;
    } on FirebaseAuthException catch (e) {
      print("Login failed: ${e.code}");
      rethrow;
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
