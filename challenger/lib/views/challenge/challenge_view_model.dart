import 'package:game_challenger/app/app_view_model.dart';
import 'package:game_challenger/core/models/challenge.dart';

class ChallengeViewModel extends AppViewModel{
  bool isLocked = false;
  int? index;
  bool correct = false;
  final Question currentQuestion;

  ChallengeViewModel({required this.currentQuestion});

  void locked(Option o, int choiceIndex){
    index = choiceIndex;
    if(isLocked == false){
      isLocked = true;
      notifyListeners();
      if(currentQuestion.answer == o.id){
        correct = true;
        notifyListeners();
      }else{
        return;
      }
    }else{
      return;
    }
    notifyListeners();
  }
}