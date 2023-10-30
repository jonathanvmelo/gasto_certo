import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// const USER_PREFS =

class PrefsService {
  static const String key = 'key';

  static save(String user) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode({"user": user, "isAuth": true}));
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(key);
    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }
    return false;
  }
}
