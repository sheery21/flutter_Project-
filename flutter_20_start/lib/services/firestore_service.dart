import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 📝 Save user details after signup
  Future<void> saveUser({
    required User user,
    required String name,
    String? lastName,
    required String phoneNumber,
    String? address,
    String imageUrl = "",
  }) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': name,
        'lastName': lastName,
        'email': user.email,
        'phoneNumber': phoneNumber,
        'address': address,
        'imageUrl': imageUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw 'Failed to save user data: $e';
    }
  }

  /// 📥 Get user details by UID
  Future<Map<String, dynamic>?> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.exists ? doc.data() as Map<String, dynamic> : null;
    } catch (e) {
      throw 'Failed to get user data: $e';
    }
  }

  /// 🖼️ Update profile image
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

  /// 🔄 Update user fields (name, lastname, email, phoneNumber, address)
  Future<void> updateUser({
    required String uid,
    String? name,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? address,
  }) async {
    final Map<String, dynamic> data = {};

    if (name != null) data['name'] = name;
    if (lastName != null) data['lastName'] = lastName;
    if (email != null) data['email'] = email;
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
    if (address != null) data['address'] = address;

    if (data.isNotEmpty) {
      await _firestore.collection('users').doc(uid).update(data);
    }
  }
}
