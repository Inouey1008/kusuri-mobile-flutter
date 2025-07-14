import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFactory {
  SharedPreferencesFactory();

  static late final SharedPreferences _instance;
  static SharedPreferences get instance => _instance;

  static Future<void> setup() async => SharedPreferencesFactory._instance = await SharedPreferences.getInstance();
}
