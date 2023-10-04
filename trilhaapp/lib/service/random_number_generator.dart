import 'dart:math';

class RandomNumberGeneratorService {
    static int generateRandomNumber(int maxNumber) {
    Random aleatoryNumber = Random();
    return aleatoryNumber.nextInt(maxNumber);
  }
}