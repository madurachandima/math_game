import 'package:math_game/Util.dart';
import 'package:math_game/interfaces/IOperater.dart';
import 'package:math_game/model/ResultModel.dart';

class OperaterImpl implements IOperotors {
  var answer = 0;
  Utills utill = new Utills();

  @override
  subtraction(val1, val2) {
    var value1 = val1;
    var value2 = val2;

    try {
      if (value1 >= value2) {
        answer = value1 - value2;

        return new ResultModel(value1, value2, answer);
      } else {
        while (value1 <= value2) {
          value1 = utill.generateRandomNumner(20, 99);
          value2 = utill.generateRandomNumner(32, 76);
        }

        if (value1 >= value2) {
          answer = value1 - value2;
          return new ResultModel(value1, value2, answer);
        } else {
          print("else value 1 ${value1}");
          print("else value 2 ${value2}");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  addition(value1, value2) {
    try {
      answer = value1 + value2;
      return new ResultModel(value1, value2, answer);
    } catch (e) {
      print(e);
    }
  }

  @override
  division(val1, val2) {
    try {
      var a;
      var value1 = val1;
      var value2 = val2;

      a = value1 / value2;

      bool isInteger(num value) => (value % 1) == 0;

      if (isInteger(a)) {
        answer = a.toInt();

        return new ResultModel(value1, value2, answer);
      }
      //  else if (a == 1) {
      //   return new ResultModel(45, 5, 9);
      // }
      else {
        while (!isInteger(a)) {
          value1 = utill.generateRandomNumner(1, 145);
          value2 = utill.generateRandomNumner(4, 123);

          a = value1 / value2;
        }
        if (isInteger(a)) {
          answer = a.toInt();

          return new ResultModel(value1, value2, answer);
        }
        // else if (a == 1) {
        //   return new ResultModel(45, 5, 9);
        // }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  multiplication(value1, value2) {
    try {
      answer = value1 * value2;
      return new ResultModel(value1, value2, answer);
    } catch (e) {
      print(e);
    }
  }
}