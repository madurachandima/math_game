import 'dart:convert';

import 'package:get/get.dart';
import 'package:math_game/const/apiConst.dart';
import 'package:math_game/const/const.dart';
import 'package:math_game/screens/firstScreen/models/CountryModel.dart';
import 'package:math_game/screens/firstScreen/models/LoginModel.dart';
import 'package:math_game/service/http_requests.dart';

class ApiRequest extends HttpRequests {
  var _getCountryModel = CountryModel();
  var _publicIp = "";

  getUserPublicIp() async {
    try {
      var response = await getRequest(GET_USER_PUBLIC_IP);
      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        _publicIp = decodeResponse['ip'];
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
        return;
      }
    } catch (e) {
      Get.snackbar("Error", COMMOMN_ERROR);
      return;
    }
  }

  getUserLocation() async {
    try {
      if (_publicIp != "") {
        var response = await getRequest(GET_USER_LOCATION_BY_IP + "$_publicIp");
        if (response.statusCode == 200) {
          _getCountryModel = countryModelFromJson(response.body);
        } else {
          Get.snackbar("Error", COMMOMN_ERROR);
          return;
        }
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
        return;
      }
    } catch (e) {
      Get.snackbar("Error", COMMOMN_ERROR);
      return;
    }
  }

  postLoginDetails(username, authId) async {
    try {
      if (_getCountryModel.location!.country != "" &&
          username != "" &&
          authId != "") {
        var data = jsonEncode({
          "auth_id": "$authId",
          "username": "$username",
          "country": "${_getCountryModel.location!.country}"
        });

        var response = await postRequest(data, BASE_URL + "login");
        if (response.statusCode == 200) {
          return loginModelFromJson(response.body);
        } else {
          Get.snackbar("Error", COMMOMN_ERROR);
          return "";
        }
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
        return "";
      }
    } catch (e) {
      Get.snackbar("Error", COMMOMN_ERROR);
      return "";
    }
  }
}
