import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  // Save user details after signup
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> saveUser({required User user, required String name}) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'name': name,
        'email': user.email,
        'uid': user.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw 'Failed to save user data: $e';
    }
  }

  // Get user details by UID
  Future<Map<String, dynamic>?> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection("user").doc(uid).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      throw 'Failed to get user data: $e';
    }
  }

  // Update user details
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
