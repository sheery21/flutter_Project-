
import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper {

  static String isLoggedInKey = 'ISLOGGEDIN';
  static String userIdKey = 'USERKEY';
  static String userNameKey = 'USERNAMEKEY';
  static String userEmailKey = 'USEREMAILKEY';
  static String userImageKey = 'USERIMAGEKEY';
  static String userAddressKey = 'USERADDRESSKEY';


  static Future<void> saveUserLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, value);
  }
  static Future<bool?> getUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey);
  }
  static Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedpreferenceHelper.userIdKey, getUserId);
  }

  static Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedpreferenceHelper.userNameKey, getUserName);
  }

  static Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedpreferenceHelper.userEmailKey, getUserEmail);
  }

  static Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedpreferenceHelper.userImageKey, getUserImage);

  }static Future<bool> saveUserAddress(String userId, String  address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('address_$userId', address);
  }

  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedpreferenceHelper.userIdKey);
  }

  static Future<String?> getUaesName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedpreferenceHelper.userNameKey);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedpreferenceHelper.userEmailKey);
  }

  static Future<String?> getUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedpreferenceHelper.userImageKey);
    }
  static Future<String?> getUserAddress(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('address_$userId');
  }
}