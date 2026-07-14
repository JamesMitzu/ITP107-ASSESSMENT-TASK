import 'dart:io';
import 'dart:math';

void main() {
  bool notExit = true;
  List<int> gameHistory = [];
  int gamecount = 0;
  List<String> gameHistoryResult = [];
  List<int> attemptsHistory = [];
  List<String> playerHistory = [];
  String result;

  while (notExit) {
    print("1. PLAY GUESS GAME ");
    print("2. SEE GAME HISTORY ");
    print("0. EXIT ");
    stdout.write("ENTER CHOICE: ");
    try {
      int choice = int.tryParse(stdin.readLineSync() ?? '-1') ?? -1;

      switch (choice) {
        case 1:
          int attempts = 0;
          print("\n===== WELCOME TO NUMBER GUESS =====");

          stdout.write("ENTER PLAYER NAME:");
          String? name = stdin.readLineSync();
          String plyerName = (name == null || name.trim().isEmpty) ? 'PLAYER' : name;
          playerHistory.add(plyerName);

          print("YOU HAVE 10 TRIES TO GUESS THE NUMBER. LET'S START! ");

          int guessNum = Random().nextInt(101);
          bool winner = false;

          try {
            for (int i = 10; i > 0; i--) {
              stdout.write("Enter guess ${10 - (i - 1)}: ");
              int guess = int.parse(stdin.readLineSync()!);

              if (guess < guessNum) {
                print("TOO LOW! TRY AGAIN. (${i - 1} TRIES LEFT)");
                attempts++;
              } else if (guess > guessNum) {
                print("TOO HIGH! TRY AGAIN. (${i - 1} TRIES LEFT)");
                attempts++;
              } else {
                winner = true;
                attempts++;
                break;
              }
            }

            if (winner == true) {
              print("CONGRATULATIONS! YOU GOT IT!");
              print("============================");
              gamecount++;
              gameHistory.add(gamecount);
              result = "WINNER";
              gameHistoryResult.add(result);
            } else {
              print("\nGAME OVER! RIGHT ANSWER IS $guessNum!");
              print("============================");
              gamecount++;
              gameHistory.add(gamecount);
              result = "LOSER";
              gameHistoryResult.add(result);
            }
          } catch (numberFormatException) {
            print("\nENTER A VALID INTEGER!");
          }
          attemptsHistory.add(attempts);
          break;
        
        case 2:
          if(gameHistory.isEmpty){
            print("\nNO GAME YET!");
          }else{
              print("\n=========HISTORY=========");
            for(int i = 0; i < gameHistory.length; i++){
              print("GAME ${i + 1} - PLAYER: ${playerHistory[i].toUpperCase()} || RESULT: ${gameHistoryResult[i]} || ATTEMPTS: ${attemptsHistory[i]}");
            }
          }
        break;

        case 0:
        notExit = false;
        print("PROGRAM ENDED!");
          break;
        default:
          print("NOT A VALID CHOICE");
          break;
      }
    } catch (numberFormatException) {
      print("NOT A VALID INPUT");
    }
  }
}
