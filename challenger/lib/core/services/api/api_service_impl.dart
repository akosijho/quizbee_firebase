import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_challenger/app/app.locator.dart';
import 'package:game_challenger/core/services/shared/shared_preference.dart';
import 'package:game_challenger/utils/constants.dart';
import 'package:game_challenger/views/challenge/challenge.dart';
import 'package:injectable/injectable.dart';
import '../../models/challenge.dart';
import '../../models/player.dart';
import 'api_service.dart';

@LazySingleton(as: ApiService)
class ApiServiceImpl implements ApiService {

  final shared = locator<SharedPreference>();
  
  @override
  Future<void> checkAnswer(String answer, String id) {
    // TODO: implement checkAnswer
    throw UnimplementedError();
  }

  @override
  Future<int?> finish() {
    // TODO: implement finish
    throw UnimplementedError();
  }

  @override
  Future<Question> getQuestion() async {
    try{
      final QuerySnapshot<Map<String, dynamic>> questionQuery = await questionRef.where('status', isEqualTo: '1').limit(1).get();
      final q = questionQuery.docs.map((question) => Question.fromSnapshot(question));
      final QuerySnapshot<Map<String, dynamic>> choicesQuery = await questionRef.doc(q.first.id).collection('choices').get();
      final c = choicesQuery.docs.map((e) => Option.fromSnapshot(e)).toList();
      return Question(id: q.first.id, question: q.first.question, status: q.first.status, choices: c.toList());
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<List<Player>?> getTops() {
    // TODO: implement getTops
    throw UnimplementedError();
  }

  @override
  Future<int?> playerPoints(String id) {
    // TODO: implement playerPoints
    throw UnimplementedError();
  }

  @override
  Future<Player?> register(String name) async {
    var player = Player(name: name, score: 0);
    try{
      participantRef.doc().set(player.toJson());
      QuerySnapshot snapshot = await participantRef.where('name', isEqualTo: name).get();
      participantRef.doc(snapshot.docs.first.id).set({'id': snapshot.docs.first.id}, SetOptions(merge: true));
      player = Player(id: snapshot.docs.first.id, name: name);
      shared.setUser(player);
      return player;
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<int?> start() {
    // TODO: implement start
    throw UnimplementedError();
  }

}