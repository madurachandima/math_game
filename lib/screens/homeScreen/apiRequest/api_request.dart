import 'dart:convert';

import 'package:get/get.dart';
import 'package:math_game/const/apiConst.dart';
import 'package:math_game/const/const.dart';
import 'package:math_game/screens/homeScreen/controller/homeController.dart';
import 'package:math_game/screens/homeScreen/model/playerDetailsModel.dart';
import 'package:math_game/service/get_request.dart';
import 'package:math_game/service/post_request.dart';
import 'package:math_game/service/shared_preference.dart';

class ApiRequest {
  HomeController _homeController = Get.put(HomeController());

  getBestPlayers() async {
    try {
      _homeController.isClickdBestPlayersButton = true;
      var response = await getRequest(BASE_URL + "getbestplayers");
      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        try {
          _homeController.bestPlayersList.value = decodeResponse;

          _homeController.isClickdBestPlayersButton = false;
        } catch (e) {
          _homeController.isClickdBestPlayersButton = false;
          print(e);
        }
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
        _homeController.isClickdBestPlayersButton = false;
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", COMMOMN_ERROR);
      _homeController.isClickdBestPlayersButton = false;
    }
  }

  postPlayerScore(authId, playerId, score) async {
    try {
      var playerName = await getPlayerName();
      var playerCountry = await getPlayerCountry();

      var data = jsonEncode({
        "auth_id": "$authId",
        "playerId": "$playerId",
        "playerName": "$playerName",
        "playerScore": score,
        "country": "$playerCountry"
      });
      print(data);
      var response = await postRequest(data, BASE_URL + "save");
      if (response.statusCode == 200) {
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", COMMOMN_ERROR);
    }
  }

  getPlayerDetails(authId) async {
    try {
      var data = jsonEncode({
        "auth_id": "$authId",
      });
      var response = await postRequest(data, BASE_URL + "getplayersdd");
      if (response.statusCode == 200) {
        return playerDetailsModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        print("new player");
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", COMMOMN_ERROR);
      return null;
    }
  }
}
