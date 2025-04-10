import 'package:shared_preferences/shared_preferences.dart';

class Shearedprefrencesutils {
  static String token = 'token';
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else {
      return prefs.setBool(key, value);
    }
  }

  static Object? getData({required String key}) {
    return prefs.get(key);
  }
    static Future<bool> removeData({required String token})async {
    return await prefs.remove(token);
  }
}
