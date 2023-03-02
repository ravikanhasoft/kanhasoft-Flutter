// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static const PREF_IS_LOGIN = "isLogin";
  static const BEARER_TOKEN = "bearer_token";
  static const ORG_TOKEN = "org_token";

  //filter
  static const FROM_DATE_FILTER = "from_date_filter";
  static const TO_DATE_FILTER = "to_date_filter";
  static const STATUS_FILTER = "status_filter";
  static const ORDER_FILTER = "order_filter";

  static removeAll() {
    add(PREF_IS_LOGIN, false, SharePrefType.Bool);
    add(PREF_IS_LOGIN, "", SharePrefType.String);
    add(FROM_DATE_FILTER, "", SharePrefType.String);
    add(TO_DATE_FILTER, "", SharePrefType.String);
    add(STATUS_FILTER, "", SharePrefType.String);
    add(ORDER_FILTER, "", SharePrefType.String);
  }

  static add(String key, dynamic value, SharePrefType prefType) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    switch (prefType) {
      case SharePrefType.Bool:
        return myPref.setBool(key, value);
      case SharePrefType.Double:
        return myPref.setDouble(key, value);
      case SharePrefType.Int:
        return myPref.setInt(key, value);
      case SharePrefType.String:
        return myPref.setString(key, value);
    }
  }

  static get(String key, SharePrefType prefType) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    switch (prefType) {
      case SharePrefType.Bool:
        return myPref.getBool(key);
      case SharePrefType.Double:
        return myPref.getDouble(key);
      case SharePrefType.Int:
        return myPref.getInt(key);
      case SharePrefType.String:
        return myPref.getString(key);
    }
  }

  static Future<bool> removeKeyData(String key) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    return await myPref.remove(key);
  }

  static containsKey(key) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    return myPref.containsKey(key);
  }

  static Future<dynamic> clear() async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    return await myPref.clear();
  }
}

enum SharePrefType {
  Int,
  String,
  Bool,
  Double,
}
