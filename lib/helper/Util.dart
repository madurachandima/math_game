import 'dart:math';

class Utills {
  /*
  * Generates a random number
   * @param minmum value 
   * @param maxmum value 
   * 
   * return  intiger randome number
   * 
   * reference : https://stackoverflow.com/questions/11674820/how-do-i-generate-random-numbers-in-dart 
  */

  generateRandomNumner(int min, int max) {
    var rnd = new Random();
    return min + rnd.nextInt(max - min);
  }
  /*
  * check is anser is intiger or not
  *@param answere value
  *
  * return boolean answer
  *
  *reference : https://stackoverflow.com/questions/58010627/dart-flutter-check-if-value-is-an-integer-whole-number
  */

  bool isInteger(num value) => (value % 1) == 0;
}
