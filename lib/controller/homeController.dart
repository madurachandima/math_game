import 'dart:async';

import 'package:get/get.dart';
import 'package:math_game/Util.dart';
import 'package:math_game/interfaces/Imethods.dart';
import 'package:math_game/business/OperaterImpl.dart';
import 'package:math_game/model/ResultModel.dart';

class HomeController extends GetxController implements Methods {
  var operaters = ["-", "/", "+", "x"];
  var numbers = [].obs;
  var operater = "".obs;
  var uiValue1 = 0.obs;
  var uiValue2 = 0.obs;
  var answer = 0.obs;
  var score = 0.obs;

  late Timer timer;
  var start = 10.obs;
  OperaterImpl opreterImpl = new OperaterImpl();
  Utills util = new Utills();

  @override
  void onInit() {
    calculate();
    startTimer();
    super.onInit();
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
  incrimentScore() {
    score.value = score.value + 10;
  }

  @override
  decrimentScore() {
    if (score.value > 0) {
      score.value = score.value - 5;
    }
  }
}
