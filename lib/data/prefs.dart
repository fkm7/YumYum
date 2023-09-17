import 'package:shared_preferences/shared_preferences.dart';

const String firstLaunch = 'firstLaunch';
const String isLoggedIn = 'isLoggedIn';

Future<void> setFirstLaunch(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(firstLaunch, value);
}

Future<bool?> getFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(firstLaunch);
}

Future<void> setAuthenticationState(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(isLoggedIn, value);
}

Future<bool?> getAuthenticationState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(isLoggedIn);
}
