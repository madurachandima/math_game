import 'package:math_game/helper/Util.dart';
import 'package:math_game/screens/homeScreen/model/ResultModel.dart';

class OperaterImpl {
  var answer = 0;
  Utills utill = new Utills();

  /*
  *Substraction two numbers
  *@param val1
  *@param val2
  *return ResultModel
  */
  subtraction(val1, val2) {
    var value1 = val1;
    var value2 = val2;

    try {
      // check if value1 is grater than value2
      if (value1 >= value2) {
        answer = value1 - value2;
        return new ResultModel(value1, value2, answer);
      } else {
        // create while loop for retun value1 grater than value2
        while (value1 <= value2) {
          //genarate two random numbers
          value1 = utill.generateRandomNumner(20, 99);
          value2 = utill.generateRandomNumner(32, 76);
        }

        // check if value1 is grater than value2
        if (value1 >= value2) {
          answer = value1 - value2;
          // return resultmodel type object
          return new ResultModel(value1, value2, answer);
        }
      }
    } catch (e) {
      print(e);
      // if Somthing gose wrong return static object
      return new ResultModel(15, 5, 10);
    }
  }

  /* 
  * Addition two numbers
  * @param value1
  * @param value2
  * return Resultmodel type object
  */
  addition(value1, value2) {
    try {
      answer = value1 + value2;
      return new ResultModel(value1, value2, answer);
    } catch (e) {
      print(e);
      // if Somthing gose wrong return static object
      return new ResultModel(20, 10, 30);
    }
  }

  /*
  *Devide two numbers
  *@param value1
  *@param value2
  *return Resultmodel type object
  */
  division(val1, val2) {
    try {
      var dynamicAnswer;
      var value1 = val1;
      var value2 = val2;

      dynamicAnswer = value1 / value2;

      // check if the dynamicAnswer is intiger or float
      if (utill.isInteger(dynamicAnswer)) {
        // convert answer to intiger
        answer = dynamicAnswer.toInt();
        //return Resultmodel type object
        return new ResultModel(value1, value2, answer);
      } else {
        //run while loop the dynamicanswer is intiger
        while (!utill.isInteger(dynamicAnswer)) {
          //generateRandomNumners
          value1 = utill.generateRandomNumner(1, 145);
          value2 = utill.generateRandomNumner(4, 123);

          dynamicAnswer = value1 / value2;
        }
        // check if the dynamicAnswer is intiger or float
        if (utill.isInteger(dynamicAnswer)) {
          // convert answer to intiger
          answer = dynamicAnswer.toInt();
          //return Resultmodel type object
          return new ResultModel(value1, value2, answer);
        }
      }
    } catch (e) {
      print(e);
      // if Somthing gose wrong return static object
      return new ResultModel(40, 5, 8);
    }
  }

  /*
  *Multiply two numbers
  *@param value1
  *@param value2
  *return Resultmodel type object
  */
  multiplication(value1, value2) {
    try {
      answer = value1 * value2;
      //return Resultmodel type object
      return new ResultModel(value1, value2, answer);
    } catch (e) {
      print(e);
      // if Somthing gose wrong return static object
      return new ResultModel(2, 5, 10);
    }
  }
}
