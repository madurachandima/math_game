import 'dart:async';

import 'package:get/get.dart';

import 'package:math_game/helper/Util.dart';

import 'package:math_game/screens/homeScreen/apiRequest/api_request.dart';
import 'package:math_game/screens/homeScreen/business/OperaterImpl.dart';

import 'package:math_game/screens/homeScreen/model/ResultModel.dart';
import 'package:math_game/screens/homeScreen/model/playerDetailsModel.dart';

import 'package:math_game/service/shared_preference.dart';

class HomeController extends GetxController {
  var operaters = ["-", "/", "+", "x"];
  var numbers = [].obs;
  var operater = "".obs;
  var uiValue1 = 0.obs;
  var uiValue2 = 0.obs;
  var uiAnswer = 0.obs;
  var score = 0;

  late Timer timer;
  var start = 10.obs;
  OperaterImpl opreterImpl = new OperaterImpl();
  Utills util = new Utills();

  var authId = "";
  var playerId = "";

  var playerDetailModel = PlayerDetailsModel().obs;

  var bestPlayersList = [].obs;

  var isClickdBestPlayersButton = false;

// on init function call when application is loaded
  @override
  void onInit() async {
    super.onInit();
    /*
    * call caluculate function
    */
    calculate();
    /*
    * start timer
    */
    startTimer();
    try {
      // get authId from shared_preference
      authId = await getGoogleAuthId();
      // get playerId from shared_preference;
      playerId = await getUserId();
    } catch (e) {
      authId = "";
      playerId = "";
    }

    /*
    * Get player details from API 
    *@param authId 
    */
    playerDetailModel.value = await new ApiRequest().getPlayerDetails(authId);
    /*
    * Get Bestplayers score from API 
    */
    await new ApiRequest().getBestPlayers();
  }

  // calcula the values
  calculate() async {
    // generate random numbers
    var randValue1 = util.generateRandomNumner(11, 110);
    var randValue2 = util.generateRandomNumner(10, 150);
    // shuffle the operaters array
    operaters.shuffle();
    //get operater
    operater.value = operaters.elementAt(util.generateRandomNumner(0, 3));

    switch (operater.value) {
      case "-":
        try {
          // call substraction function store the return result on ResultModel type object
          ResultModel resultModel =
              opreterImpl.subtraction(randValue1, randValue2);
          // call setUiValues function for set values to UI
          // get value 1 , value2 and answer from resultModel
          setUiValues(
              resultModel.uiValue1, resultModel.uiValue2, resultModel.answer);
          // call createAnswersArray function
          await createAnswersArray();
        } catch (e) {
          print("-------$e");
        }

        break;

      case "+":
        try {
          // call addition function and store the return result on ResultModel type object
          ResultModel resultModel =
              opreterImpl.addition(randValue1, randValue2);
          // call setUiValues function for set values to UI
          // get value 1 , value2 and answer from resultModel
          setUiValues(
              resultModel.uiValue1, resultModel.uiValue2, resultModel.answer);
          // call createAnswersArray function
          await createAnswersArray();
        } catch (e) {
          print("++++++$e");
        }

        break;

      case "/":
        try {
          // call division function and store the return result on ResultModel type object
          ResultModel resultModel =
              opreterImpl.division(randValue1, randValue2);

          // call setUiValues function for set values to UI
          // get value 1 , value2 and answer from resultModel
          setUiValues(
              resultModel.uiValue1, resultModel.uiValue2, resultModel.answer);
          // call createAnswersArray function
          await createAnswersArray();
        } catch (e) {
          print("/ $e");
        }
        break;

      case "x":
        try {
          // call multiplication function and store the return result on ResultModel type object
          ResultModel resultModel =
              opreterImpl.multiplication(randValue1, randValue2);
          // call setUiValues function for set values to UI
          // get value 1 , value2 and answer from resultModel
          setUiValues(
              resultModel.uiValue1, resultModel.uiValue2, resultModel.answer);
          // call createAnswersArray function
          await createAnswersArray();
        } catch (e) {
          print("xxxxxx $e");
        }
        break;

      default:
    }
  }

  /*
  *Create randome numbers for set to the UI button
   */
  createAnswersArray() async {
    //clear number array
    numbers.clear();
    //crate max value
    var maxValue = uiAnswer.value + 10;
    //create min value
    var minValue = uiAnswer.value;
    print("MaxValue 1 $maxValue" + "Minvalue 2 $minValue");

    // generate twenty of randome numbers
    for (var i = 0; i < 20; i++) {
      var number = util.generateRandomNumner(minValue, maxValue);
      //check if the number equals to the answer
      if (number != uiAnswer.value) {
        // if not add to the numbers array
        numbers.add(number);
      }
    }

    // create uniq number list using number array
    var uniqueList = numbers.toSet().toList();
    // clear number array
    numbers.clear();
    //get five numbers from uniq numbers array list
    for (var i = 0; i < 5; i++) {
      // set five uniq numbers to numbers array
      numbers.add(uniqueList[i]);
    }
    // add answer to number array
    numbers.add(uiAnswer.value);
    //shuffle the array
    numbers.shuffle();
    print(numbers);
  }

  /*
  *set valeue1 , value2 and answer to the UI
  *@param valeue1
  *@param valeue2
  *@param answer 
   */
  setUiValues(value1, value2, answer) {
    uiValue1.value = value1;
    uiValue2.value = value2;
    uiAnswer.value = answer;
  }

  /*
  * check the user given answer and correct answer is equal
  *@param yourAnswer
  *return boolean
  */
  checkAnswer(yourAnswer) {
    if (yourAnswer == uiAnswer.value) {
      return true;
    } else {
      return false;
    }
  }

  /*
  * create countdown timer
  * reference : https://stackoverflow.com/questions/54610121/flutter-countdown-timer
  */
  startTimer() {
    //* timer
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

  /*
  *when app dispose cancel timer
  */
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  /*
  *Incriment the score when user gave the correct answer.
  *Store the score on database 
  *Get best players scores 
  *Get player details
  */
  incrimentScore() async {
    //incrimentScore
    score = score + 10;
    // Call bestPlayerScore function
    //@param authId
    //@param playerId
    //@param score
    await new ApiRequest().postPlayerScore(authId, playerId, score);

    // call getBestplaeyers function
    await new ApiRequest().getBestPlayers();

    // call getPlayerDetails function
    //@param authId
    // return PlayerDetailsModel
    playerDetailModel.value = await new ApiRequest().getPlayerDetails(authId);
  }

  /*
  *Decriment player score
  */
  decrimentScore() {
    if (score > 0) {
      score = score - 5;
    }
  }
}
