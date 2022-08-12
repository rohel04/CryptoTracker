import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  static Future<bool> saveTheme(String theme) async
  {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.setString('theme', theme);
  }

  static Future<String?> getTheme() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString('theme');
  }


}