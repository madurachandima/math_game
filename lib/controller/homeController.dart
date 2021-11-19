import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';

import 'package:math_game/helper/Util.dart';
import 'package:math_game/const/apiConst.dart';
import 'package:math_game/const/const.dart';
import 'package:math_game/interfaces/Imethods.dart';
import 'package:math_game/business/OperaterImpl.dart';

import 'package:math_game/model/ResultModel.dart';
import 'package:math_game/model/playerDetailsModel.dart';
import 'package:math_game/service/get_request.dart';
import 'package:math_game/service/post_request.dart';
import 'package:math_game/service/shared_preference.dart';

class HomeController extends GetxController implements Methods {
  var operaters = ["-", "/", "+", "x"];
  var numbers = [].obs;
  var operater = "".obs;
  var uiValue1 = 0.obs;
  var uiValue2 = 0.obs;
  var answer = 0.obs;
  var score = 0;

  late Timer timer;
  var start = 10.obs;
  OperaterImpl opreterImpl = new OperaterImpl();
  Utills util = new Utills();

  var authId = "";
  var playerId = "";

  var playerDetailModel = PlayerDetailsModel().obs;
  var playerScoreModel = PlayerDetailsModel().obs;

  var bestPlayersList = [].obs;

  var isClickdBestPlayersButton = false;

  @override
  void onInit() async {
    super.onInit();

    calculate();
    startTimer();

    try {
      authId = await getGoogleAuthId();
      playerId = await getUserId();
    } catch (e) {
      authId = "";
      playerId = "";
    }

    await getPlayerDetails();
    await getBestPlayers();
  }

  @override
  calculate() async {
    var randValue1 = util.generateRandomNumner(11, 110);
    var randValue2 = util.generateRandomNumner(10, 150);
    operaters.shuffle();
    operater.value = operaters.elementAt(util.generateRandomNumner(0, 3));

    switch (operater.value) {
      case "-":
        try {
          ResultModel resultModel =
              opreterImpl.subtraction(randValue1, randValue2);
          answer.value = resultModel.answer;
          setUiValues(resultModel.uiValue1, resultModel.uiValue2);
          await createAnswersArray();
        } catch (e) {
          print("-------$e");
        }

        break;

      case "+":
        try {
          ResultModel resultModel =
              opreterImpl.addition(randValue1, randValue2);
          answer.value = resultModel.answer;
          setUiValues(resultModel.uiValue1, resultModel.uiValue2);
          await createAnswersArray();
        } catch (e) {
          print("++++++$e");
        }

        break;

      case "/":
        try {
          ResultModel resultModel =
              opreterImpl.division(randValue1, randValue2);
          answer.value = resultModel.answer;
          setUiValues(resultModel.uiValue1, resultModel.uiValue2);
          await createAnswersArray();
        } catch (e) {
          print("/ $e");
        }
        break;

      case "x":
        try {
          ResultModel resultModel =
              opreterImpl.multiplication(randValue1, randValue2);
          answer.value = resultModel.answer;
          setUiValues(resultModel.uiValue1, resultModel.uiValue2);
          await createAnswersArray();
        } catch (e) {
          print("xxxxxx $e");
        }

        break;

      default:
    }
  }

  @override
  createAnswersArray() async {
    numbers.clear();
    var maxValue = answer.value + 10;
    var minValue = answer.value;
    print("MaxValue 1 $maxValue" + "Minvalue 2 $minValue");

    for (var i = 0; i < 20; i++) {
      var number = util.generateRandomNumner(minValue, maxValue);
      if (number != answer.value) {
        numbers.add(number);
      }
    }

    var uniqueList = numbers.toSet().toList();
    numbers.clear();
    for (var i = 0; i < 5; i++) {
      numbers.add(uniqueList[i]);
    }
    numbers.add(answer.value);
    numbers.shuffle();
    print(numbers);
  }

  @override
  setUiValues(value1, value2) {
    uiValue1.value = value1;
    uiValue2.value = value2;
  }

  @override
  checkAnswer(yourAnswer) {
    if (yourAnswer == answer.value) {
      return true;
    } else {
      return false;
    }
  }

  @override
  startTimer() {
    start.value = 10;
    const oneSec = const Duration(seconds: 1);

    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
    print("--------");
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  incrimentScore() async {
    score = score + 10;
    await postPlayerScore();
    await getBestPlayers();
    await getPlayerDetails();
  }

  @override
  decrimentScore() {
    if (score > 0) {
      score = score - 5;
    }
  }

  getPlayerDetails() async {
    try {
      var data = jsonEncode({
        "auth_id": "$authId",
      });
      var response = await postRequest(data, BASE_URL + "getplayer");
      if (response.statusCode == 200) {
        playerDetailModel.value = playerDetailsModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        print("new player");
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
      }
    } catch (e) {
      Get.snackbar("Error", COMMOMN_ERROR);
    }
  }

  postPlayerScore() async {
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
        print(response);
        playerScoreModel.value = playerDetailsModelFromJson(response.body);
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", COMMOMN_ERROR);
    }
  }

  getBestPlayers() async {
    try {
      isClickdBestPlayersButton = true;
      var response = await getRequest(BASE_URL + "getbestplayers");
      if (response.statusCode == 200) {
        // bestPlayersModel.value = bestPlayersModelFromJson(response.body);
        var decodeResponse = jsonDecode(response.body);
        try {
          bestPlayersList.value = decodeResponse;
          // print(bestPlayersList[0]['_id']);
          isClickdBestPlayersButton = false;
        } catch (e) {
          isClickdBestPlayersButton = false;
          print(e);
        }
      } else {
        Get.snackbar("Error", COMMOMN_ERROR);
        isClickdBestPlayersButton = false;
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", COMMOMN_ERROR);
      isClickdBestPlayersButton = false;
    }
  }
}
