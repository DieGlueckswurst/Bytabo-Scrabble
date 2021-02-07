class EstimatorService {
  int _calculateScoreForCharacter(String character) {
    switch (character) {
      case "A":
      case "E":
      case "I":
      case "O":
      case "U":
      case "L":
      case "N":
      case "R":
      case "S":
      case "T":
        return 1;
      case "D":
      case "G":
        return 2;
      case "B":
      case "C":
      case "M":
      case "P":
        return 3;
      case "F":
      case "H":
      case "V":
      case "W":
      case "Y":
        return 4;
      case "K":
        return 5;
      case "J":
      case "X":
        return 8;
      case "Q":
      case "Z":
        return 10;
        break;
      default:
        // invalid input
        return 0;
    }
  }

  int calculateScore(String scrabbleWordToTest) {
    int score = 0;
    for (var character in scrabbleWordToTest.split('')) {
      score += _calculateScoreForCharacter(character);
    }
    return score;
  }

  bool isValidInput(String addedCharacter) {
    String validLetters = "ABCDEFGHIJKLMNOPQERSTUVWXYZ";
    return validLetters.contains(addedCharacter);
  }
}
