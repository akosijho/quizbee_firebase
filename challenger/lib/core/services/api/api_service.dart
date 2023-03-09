
import '../../models/challenge.dart';
import '../../models/player.dart';

abstract class ApiService{

  //register challenger
  Future<Player?> register(String name);

  //  get player points
  Future<void> playerPoints(String id, int score);

  //getquestion
  Future<Question> getQuestion();

  //  answer checking
  Future<void> checkAnswer(String answer, String id);

//  start room
  Future<int?> start();

  Future<int?> finish();

  Future<List<Player>?> getTops();
}