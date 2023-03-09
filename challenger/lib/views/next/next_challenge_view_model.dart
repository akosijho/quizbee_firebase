import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_challenger/app/app.router.dart';
import 'package:game_challenger/app/app_view_model.dart';
import 'package:game_challenger/core/models/challenge.dart';
import 'package:game_challenger/core/models/player.dart';
import 'package:game_challenger/utils/constants.dart';
import 'package:game_challenger/widgets/snackbar.dart';

class NextChallengeViewModel extends AppViewModel {
  bool isLocked = false;
  int? index;
  bool correct = false;
  final Question currentQuestion;
  Player player;
  Question? nextQuestion;

  NextChallengeViewModel({required this.currentQuestion, required this.player});

  Timer? timer;

  void init() async {
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) async {
      getNext();
      if (nextQuestion != null) {
        if (currentQuestion != nextQuestion) {
          timer!.cancel();
          await nav.pushReplacementNamed(Routes.new_challenge,
              arguments:
                  ChallengeArguments(player: player, question: nextQuestion!));
        }
      }
    });
  }

  Stream<Player> playerPoints() {
    return participantRef.doc(player.id).snapshots().map((event) {
      return player = Player.fromJson(event.data()!);
    });
  }

  void getNext() async {
    try {
      nextQuestion = await api.getQuestion();
    } on FirebaseException catch (e) {
      mySnackbar(title: "Oops", message: e.message!);
      rethrow;
    }
  }

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
