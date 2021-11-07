import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:math_game/const/apiConst.dart';
import 'package:math_game/const/const.dart';
import 'package:math_game/model/CountryModel.dart';
import 'package:math_game/model/LoginModel.dart';
import 'package:math_game/service/get_request.dart';
import 'package:math_game/service/post_request.dart';
import 'package:math_game/service/shared_preference.dart';

class FirstScreenController extends GetxController {
  var userNameController = TextEditingController();
  var _googleSignIn = GoogleSignIn();
  var _getCountryModel = CountryModel();
  var _loginModel = LoginModel();
  var _publicIp = "";
  var _authId = "";
  var _playerId = "";

  var isNewUser = true.obs;
  var isEnableSignUp = true.obs;

  @override
  void onInit() async {
    super.onInit();
    try {
      _authId = await getGoogleAuthId();
      _playerId = await getUserId();
    } catch (e) {
      _authId = "";
      _playerId = "";
    }

    if (_authId == "" && _playerId == "") {
      isNewUser.value = true;
    } else {
      isNewUser.value = false;
    }
  }

  login() async {
    isEnableSignUp.value = false;
    var _username = userNameController.text;
    if (_username != "") {
      var signinResponse = await _googleSignIn.signIn();
      print(signinResponse);
      // _googleSignIn.signOut();

      if (signinResponse != null) {
        _authId = signinResponse.id;
        _publicIp = await getUserPublicIp();
        _getCountryModel = await getUserLopcation();
        _loginModel = await postLoginDetails(_username, _authId);

        saveGoogleAuthId(_loginModel.authId);
        saveUserId(_loginModel.id);
        savePlayerName(_loginModel.username);
        isEnableSignUp.value = true;
      } else {
        Get.snackbar("Error", " Google sign up failed");
        isEnableSignUp.value = true;
      }
    } else {
      Get.snackbar("Error", "Enter player name");
      isEnableSignUp.value = true;
    }
  }

  getUserPublicIp() async {
    try {
      var response = await getRequest(GET_USER_PUBLIC_IP);
      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        print(decodeResponse);
        return decodeResponse['ip'];
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
        return null;
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", COMMOMN_ERROR);
      return null;
    }
  }

  getUserLopcation() async {
    try {
      var response = await getRequest(GET_USER_LOCATION_BY_IP + "$_publicIp");
      if (response.statusCode == 200) {
        return countryModelFromJson(response.body);
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
        return null;
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", COMMOMN_ERROR);
      return null;
    }
  }

  postLoginDetails(username, authId) async {
    try {
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
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", COMMOMN_ERROR);
      return null;
    }
  }
}
