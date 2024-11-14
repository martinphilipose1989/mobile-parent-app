import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared/shared.dart';
class SharedPreferenceHelper {
  // Write String DATA
  static Future<bool> saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(
      key,
      value,
    );
  }

  // Read String Data
  static Future<String> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  // Write bool DATA
  static Future<bool> saveBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(
      key,
      value,
    );
  }

  // Read bool Data
  static Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
      key,
    );
  }

  // Write Int DATA
  static Future<bool> saveInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(
      key,
      value,
    );
  }

  // Read Int Data
  static Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(
      key,
    );
  }

  // Clear Data
  static Future clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    await prefs.clear();
    
  }

  static Future clearTemporaryRegistrationDate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(mobileNumber);
   
  }
}
