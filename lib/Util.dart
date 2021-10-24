import 'dart:math';

class Utills {
  generateRandomNumner(int max, int min) {
    int min = 0;
    int max = 3;
    var rnd = new Random();
    return min + rnd.nextInt(max - min);
  }
}
