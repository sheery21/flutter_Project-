import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _name = "name";
  static const _email = "email";
  static const _phone = "phone";
  static const _imageUrl = "imageUrl";
  static const _uid = "uid";

  static Future saveUser({
    required String uid,
    required String name,
    required String email,
    required String phone,
    required String imageUrl,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uid, uid);
    await prefs.setString(_name, name);
    await prefs.setString(_email, email);
    await prefs.setString(_phone, phone);
    await prefs.setString(_imageUrl, imageUrl);
  }

  static Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "uid": prefs.getString(_uid),
      "name": prefs.getString(_name),
      "email": prefs.getString(_email),
      "phone": prefs.getString(_phone),
      "imageUrl": prefs.getString(_imageUrl),
    };
  }

  static Future clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
