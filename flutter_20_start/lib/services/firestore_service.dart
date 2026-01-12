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
    String imageUrl = "",
  }) async {
    await _firestore.collection('users').doc(user.uid).set({
      'name': name,
      'email': user.email,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'uid': user.uid,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Get user details
  Future<Map<String, dynamic>?> getUser(String uid) async {
    final doc = await _firestore.collection("users").doc(uid).get();
    return doc.exists ? doc.data() : null;
  }

  /// 1️⃣ Upload image to Firebase Storage
  Future<String> uploadProfileImage({
    required String uid,
    required File image,
  }) async {
    final ref = _storage.ref('profile_images/$uid.jpg');

    final snapshot = await ref.putFile(image);
    final url = await snapshot.ref.getDownloadURL();

    return url;
  }

  /// 2️⃣ Save image URL to Firestore
  Future<void> updateProfileImageUrl({
    required String uid,
    required String imageUrl,
  }) async {
    await _firestore.collection('users').doc(uid).update({
      'imageUrl': imageUrl,
    });
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
