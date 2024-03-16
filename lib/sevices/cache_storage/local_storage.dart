
import 'package:shared_preferences/shared_preferences.dart';


const String USER_INFO='USER_INFO';
const String USER_JWT='USER_JWT';
const isLoggedIn = 'isLoggedIn';
const userId = 'adminId';


class LocalStorage{
  ///saved user Information

 static Future<bool> setLoginStatus(bool status) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(isLoggedIn, status);
  }

 static Future<bool> getLoginStatus() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(isLoggedIn) ?? false;
  }
 static Future<bool> setUserId(int id) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt(userId, id);
  }

 static Future<int> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(userId) ?? 0;
  }

  // static Future<bool> saveUser(String value)async{
  //   final sp=await SharedPreferences.getInstance();
  //   return sp.setString('email', value );
  // }
  // static Future<String?> getUser(String value)async{
  //   final sp=await SharedPreferences.getInstance();
  //   return sp.getString('email');
  // }
  // static Future<void> logOut() async{
  //   final sp=await SharedPreferences.getInstance();
  //   sp.remove('email');
  // }
  
  // static Future<bool> savedUserInformation(String value) async {
  //   final localBD=await SharedPreferences.getInstance();
  //   return localBD.setString(USER_INFO, value);
  // }
  // static Future<String?> getUserInformation() async {
  //   final localBD=await SharedPreferences.getInstance();
  //
  //   return localBD.getString(USER_INFO);
  // }
  ///saved jwt
  // static Future<bool> savedJWT(String value) async {
  //   final localBD=await SharedPreferences.getInstance();
  //   return localBD.setString(USER_JWT, value);
  // }
  // static Future<String?> getJWT() async {
  //   final localBD=await SharedPreferences.getInstance();
  //   return localBD.getString(USER_JWT);
  // }
}