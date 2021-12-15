import 'dart:convert';

import 'package:get/get.dart';
import 'package:math_game/const/apiConst.dart';
import 'package:math_game/const/const.dart';
import 'package:math_game/screens/homeScreen/controller/homeController.dart';
import 'package:math_game/screens/homeScreen/model/playerDetailsModel.dart';
import 'package:math_game/service/http_requests.dart';

import 'package:math_game/service/shared_preference.dart';

class ApiRequest extends HttpRequests {
  HomeController _homeController = Get.put(HomeController());
  var _sharedPreference = new SharedPreference();

  /*
  *Get bestplayers details
  */
  getBestPlayers() async {
    try {
      //disable button press
      _homeController.isClickdBestPlayersButton = true;
      // cal get request function
      var response = await getRequest(BASE_URL + "getbestplayers");
      if (response.statusCode == 200) {
        //decode json response
        var decodeResponse = jsonDecode(response.body);
        try {
          //set reponse to array
          _homeController.bestPlayersList.value = decodeResponse;
          //enable button press
          _homeController.isClickdBestPlayersButton = false;
        } catch (e) {
          //enable button press
          _homeController.isClickdBestPlayersButton = false;
          print(e);
        }
      } else {
        // show error message
        Get.snackbar("Error", COMMOMN_ERROR);
        //enable button press
        _homeController.isClickdBestPlayersButton = false;
      }
    } catch (e) {
      print(e);
      // show error message
      Get.snackbar("Error", COMMOMN_ERROR);
      //enable button press
      _homeController.isClickdBestPlayersButton = false;
    }
  }

  /*
  *Post player scores
  *@param authId 
  *@param playerId
  *@param score 
  */
  postPlayerScore(authId, playerId, score) async {
    try {
      // get player name from shared_preference
      var playerName = await _sharedPreference.getPlayerName();
      // get player country from shared_preference
      var playerCountry = await _sharedPreference.getPlayerCountry();

      // create json object
      var data = jsonEncode({
        "auth_id": "$authId",
        "playerId": "$playerId",
        "playerName": "$playerName",
        "playerScore": score,
        "country": "$playerCountry"
      });
      print(data);
      // call post request function
      var response = await postRequest(data, BASE_URL + "save");
      if (response.statusCode == 200) {
      } else {
        // show error message
        Get.snackbar("Error", COMMOMN_ERROR);
      }
    } catch (e) {
      print(e);
      // show error message
      Get.snackbar("Error", COMMOMN_ERROR);
    }
  }

  /*
  * get player details
  *@param authId
  *return player detailsModel
  */
  getPlayerDetails(authId) async {
    try {
      // create json object
      var data = jsonEncode({
        "auth_id": "$authId",
      });
      // call post request function
      var response = await postRequest(data, BASE_URL + "getplayer");
      if (response.statusCode == 200) {
        return playerDetailsModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        print("new player");
      } else {
        // show error message
        Get.snackbar("Error", COMMOMN_ERROR);
        return null;
      }
    } catch (e) {
      // show error message
      Get.snackbar("Error", COMMOMN_ERROR);
      return null;
    }
  }
}
