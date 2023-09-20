import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManagerUtils {
  static String isLogin = "is_login";
  static String userId = "userId";
  static String token = "Token";
  static String email = "Email";
  static String userName = "UserName";

  ///setIsLogin
  static Future setIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLogin, value);
  }

  static Future<bool?> getIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin);
  }

  ///setUserId
  static Future setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userId, value);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId).toString() ?? '';
  }

  ///setUsername
  static Future setUsername(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userName, value ?? "");
  }

  static Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName).toString() ?? '';
  }

  ///setToken
  static Future setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(token, value);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(token) ?? '';
  }

  ///setUserEmail
  static Future setUserEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(email, value);
  }

  static Future<String> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(email).toString() ?? '';
  }

  static Future clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setIsLogin(false);
    setUserId("");
    setUsername("");
    setToken("");
    setUserEmail("");

    prefs.clear();
  }
}
