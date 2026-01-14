import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  String? _email;
  String? _name;
  String? _lastName;
  String? _imageUrl;
  String? _phoneNumber;
  String? _address;

  // 🔹 Getters
  User? get user => _user;
  String? get email => _email;
  String? get name => _name;
  String? get lastName => _lastName;
  String? get imageUrl => _imageUrl;
  String? get phoneNumber => _phoneNumber;
  String? get address => _address;

  // 🔹 Initial set (Signup / Login)
  void setUser({
    required User user,
    required String? email,
    required String name,
    String? lastName,
    String? imageUrl,
    String? phoneNumber,
    String? address,
  }) {
    _user = user;
    _email = email;
    _name = name;
    _lastName = lastName;
    _imageUrl = imageUrl;
    _phoneNumber = phoneNumber;
    _address = address;
    notifyListeners();
  }

  // 🔹 Load from Local Storage (Auto Login)
  void setUserFromLocal({
    required String uid,
    required String name,
    required String email,
    String? lastName,
    String? imageUrl,
    String? phoneNumber,
    String? address,
  }) {
    _user = FirebaseAuth.instance.currentUser;
    _email = email;
    _name = name;
    _lastName = lastName;
    _imageUrl = imageUrl;
    _phoneNumber = phoneNumber;
    _address = address;
    notifyListeners();
  }

  // 🔹 Update single fields
  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  void updateLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void updateAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void updateImage(String imageUrl) {
    _imageUrl = imageUrl;
    notifyListeners();
  }

  // 🔹 Update multiple fields at once
  void updateUser({
    String? name,
    String? lastName,
    String? imageUrl,
    String? phoneNumber,
    String? address,
  }) {
    if (name != null) _name = name;
    if (lastName != null) _lastName = lastName;
    if (imageUrl != null) _imageUrl = imageUrl;
    if (phoneNumber != null) _phoneNumber = phoneNumber;
    if (address != null) _address = address;
    notifyListeners();
  }

  // 🔹 Logout
  void clearUser() {
    _user = null;
    _email = null;
    _name = null;
    _lastName = null;
    _imageUrl = null;
    _phoneNumber = null;
    _address = null;
    notifyListeners();
  }
}
