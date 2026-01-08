import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Save user details after signup
  Future<void> saveUser({
    required User user,
    required String name,
    required String phoneNumber,
    required String imageUrl,
  }) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'name': name,
        'email': user.email,
        'phoneNumber': phoneNumber,
        'imageUrl': imageUrl,
        'uid': user.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw 'Failed to save user data: $e';
    }
  }

  /// Get user details by UID
  Future<Map<String, dynamic>?> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection("users")
          .doc(uid)
          .get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      throw 'Failed to get user data: $e';
    }
  }

  /// Upload profile image and return download URL
  Future<String> uploadProfileImage({
    required String uid,
    required File image,
  }) async {
    try {
      final ref = _storage.ref().child("profile_images").child("$uid.jpg");
      final uploadTask =  await ref.putFile(image);

      final snaphot = await uploadTask;

      // Return the download URL
      final downloadUrl = await snaphot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Firebase Storage Error: $e");
      throw 'Failed to upload profile image: $e';
    }
  }

  /// Update profile image URL in Firestore
  Future<void> updateProfileImage({
    required String uid,
    required String imageUrl,
  }) async {
    try {
      await _firestore.collection("users").doc(uid).update({
        'imageUrl': imageUrl,
      });
    } catch (e) {
      throw 'Failed to update profile image: $e';
    }
  }

  /// Update user details
  Future<void> updateUser({
    required String uid,
    String? name,
    String? email,
  }) async {
    try {
      Map<String, dynamic> data = {};
      if (name != null) data['name'] = name;
      if (email != null) data['email'] = email;
      if (data.isNotEmpty) {
        await _firestore.collection('users').doc(uid).update(data);
      }
    } catch (e) {
      throw 'Failed to update user data: $e';
    }
  }
}
