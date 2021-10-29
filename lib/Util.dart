import 'dart:math';

class Utills {
  generateRandomNumner(int min, int max) {
    var rnd = new Random();
    return min + rnd.nextInt(max - min);
  }
}
