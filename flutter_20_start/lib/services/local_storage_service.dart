import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _uid = "uid";
  static const _name = "name";
  static const _lastName = "lastName";
  static const _email = "email";
  static const _phone = "phone";
  static const _address = "address";
  static const _imageUrl = "imageUrl";

  static Future saveUser({
    required String uid,
    required String name,
    required String email,
    required String phone,
    String? lastName,
    String? address,
    required String imageUrl,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uid, uid);
    await prefs.setString(_name, name);
    await prefs.setString(_email, email);
    await prefs.setString(_phone, phone);
    await prefs.setString(_imageUrl, imageUrl);
    await prefs.setString(_lastName, lastName ?? "");
    await prefs.setString(_address, address ?? "");
  }

  static Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "uid": prefs.getString(_uid),
      "name": prefs.getString(_name),
      "lastName": prefs.getString(_lastName),
      "email": prefs.getString(_email),
      "phone": prefs.getString(_phone),
      "address": prefs.getString(_address),
      "imageUrl": prefs.getString(_imageUrl),
    };
  }

  static Future clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
