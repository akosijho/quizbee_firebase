import 'package:firebase_core/firebase_core.dart';
import 'package:game_challenger/app/app_view_model.dart';
import 'package:game_challenger/core/models/challenge.dart';
import 'package:game_challenger/core/models/player.dart';
import 'package:game_challenger/utils/constants.dart';
import 'package:game_challenger/widgets/snackbar.dart';

class ChallengeViewModel extends AppViewModel {
  bool isLocked = false;
  int? index;
  bool correct = false;
  final Question currentQuestion;
  Player player;

  ChallengeViewModel({required this.currentQuestion, required this.player});

  Stream<Player> playerPoints() => participantRef
      .doc(player.id)
      .snapshots()
      .map((event) {
    return player = Player.fromJson(event.data()!);
  });

  void locked(Option o, int choiceIndex) {
    index = choiceIndex;
    if (isLocked == false) {
      isLocked = true;
      notifyListeners();
      if (currentQuestion.answer == o.id) {
        correct = true;
        notifyListeners();
        addPoint(player.id!);
      } else {
        return;
      }
    } else {
      return;
    }
    notifyListeners();
  }

  void addPoint(
    String playerId,
  ) async {
    try {
      await api.playerPoints(playerId, (player.score ?? 0) + 2);
    } on FirebaseException catch (e) {
      mySnackbar(title: 'Oops', message: e.message!);
      rethrow;
    }
  }
}
