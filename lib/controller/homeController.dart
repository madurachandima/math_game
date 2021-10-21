import 'dart:math';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var operaters = ["-", "/", "+", "x"];
  var operater = "".obs;
  var value1 = 0.obs;
  var value2 = 0.obs;
  var answer = 0;

  @override
  void onInit() {
    calculate();
    super.onInit();
  }

  getOperaterByRandom() {
    Random rnd;
    int min = 0;
    int max = 3;
    rnd = new Random();
    var r = min + rnd.nextInt(max - min);
    return operaters.elementAt(r);
  }

  getRandomeNumber() {
    Random rnd;
    int min = 0;
    int max = 100;
    rnd = new Random();
    return min + rnd.nextInt(max - min);
  }

  calculate() {
    var randValue1 = getRandomeNumber();
    var randValue2 = getRandomeNumber();

    switch (getOperaterByRandom()) {
      case "-":
        if (randValue1 > randValue2) {
          answer = randValue1 - randValue2;
        } else {
          while (randValue1 > randValue2) {
            randValue1 = getRandomeNumber();
            randValue2 = getRandomeNumber();
          }

          if (randValue1 > randValue2) {
            answer = randValue1 - randValue2;
          }
        }
        break;

      case "+":
        answer = randValue1 + randValue2;
        break;

      case "/":
        var a;
        a = value1.value / value2.value;

        bool isInteger(num value) => (value % 1) == 0;

        if (isInteger(a)) {
          answer = a.toInt();
        } else {
          while (isInteger(a)) {
            randValue1 = getRandomeNumber();
            randValue2 = getRandomeNumber();
            a = randValue1 / randValue2;
          }
          if (isInteger(a)) {
            answer = a;
          }
        }
        break;

      case "x":
        answer = randValue1 * randValue2;
        break;

      default:
    }
  }
}
