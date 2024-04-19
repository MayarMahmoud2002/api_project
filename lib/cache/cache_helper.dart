import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late SharedPreferences sharedPreferences;

  // initialize of cache
  init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // this method put data in local database using key
  String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  // this method put data in local database using key
  Future <bool> saveData({required String key, required dynamic value}) async
  {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }
  // this method get data in local database

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
  // this method remove data by specific key

  Future <bool> removeData({required String key}) async
  {
    return await sharedPreferences.remove(key);
  }
  // this method check if  data contain in Database


  Future <bool> containKey({required String key}) async
  {
    return await sharedPreferences.containsKey(key);
  }

  // clear all data in local Database
  Future <bool> clearData() async
  {
    return await sharedPreferences.clear();
  }

  // put all data in local Database
  Future <bool> put({required String key, required dynamic value}) async
  {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}


