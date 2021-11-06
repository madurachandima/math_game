import 'package:shared_preferences/shared_preferences.dart';

saveGoogleAuthId(authId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("googleAuthId", authId);
}

saveUserId(userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("userId", userId);
}

getGoogleAuthId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("googleAuthId");
}

getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("userId");
}
