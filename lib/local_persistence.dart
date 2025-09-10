import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPersistence {
  static const _key = 'businesses_cache';

  static Future<void> saveBusinesses(List<Map<String, dynamic>> businesses) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(businesses));
  }

  static Future<List<Map<String, dynamic>>?> loadBusinesses() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) return null;
    final List<dynamic> data = jsonDecode(jsonStr);
    return data.cast<Map<String, dynamic>>();
  }
}
