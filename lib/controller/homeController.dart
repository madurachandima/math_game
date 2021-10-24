import 'dart:math';

import 'package:get/get.dart';
import 'package:math_game/Util.dart';
import 'package:math_game/Methods.dart';

class HomeController extends GetxController implements Methods {
  var operaters = ["-", "/", "+", "x"];
  var numbers = [].obs;
  var operater = "".obs;
  var value1 = 0.obs;
  var value2 = 0.obs;
  var answer = 0.obs;

  @override
  void onInit() {
    calculate();
    super.onInit();
  }

  @override
  calculate() {
    var randValue1 = new Utills().generateRandomNumner(11, 110);
    var randValue2 = new Utills().generateRandomNumner(10, 150);
    var operrator =
        operaters.elementAt(new Utills().generateRandomNumner(0, 3));

    // var randValue1 = 3;
    // var randValue2 = 10;
    // var operrator = "-";

    print("operator $operrator");
    // print("Value 1 $randValue1" + "value 2 $randValue2");

    switch (operrator) {
      case "-":
        if (randValue1 > randValue2) {
          answer.value = randValue1 - randValue2;
          createAnswersArray();
          print("answer - 1 ${answer.value}");
        } else {
          while (randValue1 < randValue2) {
            randValue1 = new Utills().generateRandomNumner(20, 99);
            randValue2 = new Utills().generateRandomNumner(32, 76);
          }

          if (randValue1 > randValue2) {
            print("Value 1 $randValue1" + "value 2 $randValue2");
            answer.value = randValue1 - randValue2;
            createAnswersArray();
            print("answer - 2${answer.value}");
          }
        }
        break;

      case "+":
        answer.value = randValue1 + randValue2;
        createAnswersArray();
        print("answer + ${answer.value}");
        break;

      case "/":
        var a;
        a = randValue1 / randValue2;
        print(a);
        bool isInteger(num value) => (value % 1) == 0;

        if (isInteger(a)) {
          answer.value = a.toInt();
          createAnswersArray();
          print("answer / 1 ${answer.value}");
        } else {
          while (!isInteger(a)) {
            randValue1 = new Utills().generateRandomNumner(45, 145);
            randValue2 = new Utills().generateRandomNumner(32, 123);
            a = randValue1 / randValue2;
          }
          if (isInteger(a)) {
            print("Value 1 $randValue1" + "value 2 $randValue2");
            answer.value = a.toInt();
            createAnswersArray();
            print("answer / 2 ${answer.value}");
          }
        }
        break;

      case "x":
        answer.value = randValue1 * randValue2;
        print("answer * ${answer.value}");
        createAnswersArray();
        break;

      default:
    }
  }

  @override
  createAnswersArray() {
    var maxValue = answer.value + 10;
    var minValue = answer.value + 10;
    print("MaxValue 1 $maxValue" + "Minvalue 2 $maxValue");

    for (var i = 0; i < 5; i++) {
      var number = new Utills().generateRandomNumner(maxValue, minValue);
      numbers.add(number);
      numbers.shuffle();
    }

    numbers.add(answer.value);
    numbers.shuffle();
    print(numbers);
  }
}
