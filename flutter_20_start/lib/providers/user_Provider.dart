import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  String? _email;
  String? _name;
  String? _imageUrl;
  String? _phuneNumber;
  User? get user => _user;
  String? get email => _email;
  String? get name => _name;
  String? get imageUrl => _imageUrl;
  String? get phoneNumber => _phuneNumber;

  /// Initial set (signup / login)
  void setUser({
    required User user,
    required String? email,
    required String name,
    String? imageUrl,
    String? phoneNumber,
  }) {
    _user = user;
    _email = email;
    _name = name;
    _imageUrl = imageUrl;
    _phuneNumber = phoneNumber;
    notifyListeners();
  }

  /// 🔄 Update only name
  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  /// 🖼️ Update profile image
  void updateImage(String imageUrl) {
    _imageUrl = imageUrl;
    notifyListeners();
  }

  /// 🔁 Update multiple fields at once
  void updateUser({String? name, String? imageUrl, String? phoneNumber}) {
    if (name != null) _name = name;
    if (imageUrl != null) _imageUrl = imageUrl;
    if (phoneNumber != null) _phuneNumber = phoneNumber;
    notifyListeners();
  }

  /// 🚪 Logout
  void clearUser() {
    _user = null;
    _name = null;
    _imageUrl = null;
    _phuneNumber = null;
    notifyListeners();
  }
}
