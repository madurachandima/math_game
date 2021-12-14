import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:math_game/screens/firstScreen/apiRequest/api_request.dart';
import 'package:math_game/screens/firstScreen/models/LoginModel.dart';
import 'package:math_game/screens/homeScreen/home.dart';
import 'package:math_game/service/shared_preference.dart';

class FirstScreenController extends GetxController {
  var userNameController = TextEditingController();
  var _googleSignIn = GoogleSignIn();
  LoginModel _loginModel = new LoginModel();
  var _apiRequest = ApiRequest();
  var _authId = "";
  var _playerId = "";

  var isNewUser = true.obs;
  var isEnableSignUp = true.obs;

  @override
  void onInit() async {
    super.onInit();
    try {
      //** traing to get google auth id and user id*/
      _authId = await getGoogleAuthId();
      _playerId = await getUserId();
    } catch (e) {
      _authId = "";
      _playerId = "";
    }

//**check  the user id and auth id is empty*/
    if (_authId == "" && _playerId == "") {
      isNewUser.value = true;
    } else {
      isNewUser.value = false;
    }
  }

  login() async {
    isEnableSignUp.value = false;
    var _username = userNameController.text.trim();
    if (_username != "") {
      //*call google sign in/
      var signinResponse = await _googleSignIn.signIn();

      //**check the signinResponse is null
      if (signinResponse != null) {
        //*get google auth ID
        _authId = signinResponse.id;

        //* get user public id from API
        await _apiRequest.getUserPublicIp();

        //* get user country from API
        await _apiRequest.getUserLopcation();

        try {
          /**
         * @param _username
         * @param _authId
         * save user data
         */
          _loginModel = await _apiRequest.postLoginDetails(_username, _authId);
          // //* save Auth_id, User_id, Player_name and Player_country in SharedPreferences
          saveUserDetails(_loginModel);
          isEnableSignUp.value = true;
          //* goto Home screen
          Get.off(() => Home());
        } catch (e) {
          Get.snackbar("Error", " Google sign up failed");
          isEnableSignUp.value = true;
        }
      } else {
        Get.snackbar("Error", " Google sign up failed");
        isEnableSignUp.value = true;
      }
    } else {
      Get.snackbar("Error", "Enter player name");
      isEnableSignUp.value = true;
    }
  }

  saveUserDetails(_loginModel) {
    //* save Auth_id, User_id, Player_name and Player_country in SharedPreferences
    saveGoogleAuthId(_loginModel.authId);
    saveUserId(_loginModel.id);
    savePlayerName(_loginModel.username);
    savePlayerCountry(_loginModel.country);
  }
}
