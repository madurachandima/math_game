import 'package:shared_preferences/shared_preferences.dart';

/*
*save Google Auth Id in shared_preferences
*@param authId
*/
saveGoogleAuthId(authId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("googleAuthId", authId);
}

/*
*save User Id in shared_preferences
*@param userId
*/
saveUserId(userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("userId", userId);
}

/*
*save Player name shared_preferences
*@param playerName
*/
savePlayerName(playerName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("playerName", playerName);
}

/*
*save Player country shared_preferences
*@param playerCountry
*/
savePlayerCountry(playerCountry) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("playerCountry", playerCountry);
}

/*
*Get google auth id from shared_preferences
*return google auth id
*/
getGoogleAuthId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("googleAuthId");
}

/*
*Get  user id from shared_preferences
*return  user id
*/
getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("userId");
}

/*
*Get player name from shared_preferences
*return player name
*/
getPlayerName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("playerName");
}

/*
*Get player country from shared_preferences
*return player country
*/
getPlayerCountry() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("playerCountry");
}
