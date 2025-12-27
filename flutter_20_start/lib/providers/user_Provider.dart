import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  String? _name;
  String? _imageUrl;

  User? get user => _user;
  String? get name => _name;
  String? get imageUrl => _imageUrl;

  /// Initial set (signup / login)
  void setUser({required User user, required String name, String? imageUrl}) {
    _user = user;
    _name = name;
    _imageUrl = imageUrl;
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
  void updateUser({String? name, String? imageUrl}) {
    if (name != null) _name = name;
    if (imageUrl != null) _imageUrl = imageUrl;
    notifyListeners();
  }

  /// 🚪 Logout
  void clearUser() {
    _user = null;
    _name = null;
    _imageUrl = null;
    notifyListeners();
  }
}
