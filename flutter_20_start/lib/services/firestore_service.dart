import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Save user details after signup
  Future<void> saveUser({
    required User user,
    required String name,
    required String phoneNumber,
    String imageUrl = "",
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
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.exists ? doc.data() as Map<String, dynamic> : null;
    } catch (e) {
      throw 'Failed to get user data: $e';
    }
  }

  /// Upload profile image and return download URL
  Future<void> uploadProfileImage({
    required String uid,
    required String imageUrl,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'imageUrl': imageUrl,
      });
    } catch (e) {
      throw 'Failed to upload profile image: $e';
    }
  }

  /// Update image URL in Firestore
  Future<void> updateProfileImageUrl({
    required String uid,
    required String imageUrl,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'imageUrl': imageUrl,
      });
    } catch (e) {
      throw 'Failed to update profile image URL: $e';
    }
  }

  /// Update name / email
  Future<void> updateUser({
    required String uid,
    String? name,
    String? email,
  }) async {
    Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;

    if (data.isNotEmpty) {
      await _firestore.collection('users').doc(uid).update(data);
    }
  }
}
