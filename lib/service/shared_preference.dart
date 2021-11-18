import 'package:shared_preferences/shared_preferences.dart';

saveGoogleAuthId(authId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("googleAuthId", authId);
}

saveUserId(userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("userId", userId);
}

savePlayerName(playerName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("playerName", playerName);
}

savePlayerCoubtry(playerCountry) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("playerCountry", playerCountry);
}

getGoogleAuthId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("googleAuthId");
}

getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("userId");
}

getPlayerName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("playerName");
}

getPlayerCountry() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("playerCountry");
}
