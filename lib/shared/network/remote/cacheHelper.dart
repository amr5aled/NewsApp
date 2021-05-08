import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences sharedPreferences;
  static int()async
  {
    sharedPreferences=await SharedPreferences.getInstance();
  }
  // to save light or dark//
  static Future<bool> putBolean({@required String key,bool value})async
{
   return await sharedPreferences.setBool(key, value);// save value//

}
  static bool getBoolean({@required String key})
{
  return sharedPreferences.getBool(key);// Read value//
}
}