import 'package:get/get.dart';
import 'package:math_game/Util.dart';
import 'package:math_game/Methods.dart';
import 'package:math_game/business/Operater.dart';
import 'package:math_game/model/ResultModel.dart';

class HomeController extends GetxController implements Methods {
  var operaters = ["-", "/", "+", "x"];
  var numbers = [].obs;
  var operater = "".obs;
  var uiValue1 = 0.obs;
  var uiValue2 = 0.obs;
  var answer = 0.obs;

  @override
  void onInit() {
    calculate();
    super.onInit();
  }

  @override
  calculate() async {
    var randValue1 = new Utills().generateRandomNumner(11, 110);
    var randValue2 = new Utills().generateRandomNumner(10, 150);
    operaters.shuffle();
    operater.value =
        operaters.elementAt(new Utills().generateRandomNumner(0, 3));

    switch (operater.value) {
      case "-":
        try {
          ResultModel resultModel =
              Operater().subtraction(randValue1, randValue2);
          answer.value = resultModel.answer;
          setUiValues(resultModel.uiValue1, resultModel.uiValue2);
          await createAnswersArray();
        } catch (e) {
          print("-------$e");
        }

        break;

      case "+":
        try {
          ResultModel resultModel = Operater().addition(randValue1, randValue2);
          answer.value = resultModel.answer;
          setUiValues(resultModel.uiValue1, resultModel.uiValue2);
          await createAnswersArray();
        } catch (e) {
          print("++++++$e");
        }

        break;

      case "/":
        try {
          ResultModel resultModel = Operater().division(randValue1, randValue2);
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
              Operater().multiplication(randValue1, randValue2);
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
      var number = new Utills().generateRandomNumner(minValue, maxValue);
      if (number != answer.value) {
        numbers.add(number);
      }
    }

    // numbers.shuffle();

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
    if (yourAnswer == answer.value)
      return true;
    else
      return false;
  }
}
