import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String? id;
  final String? name;
  final int? score;

  const Player({this.id, this.name, this.score});

  @override
  List<Object?> get props => [id, name, score];

  factory Player.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    return Player(
      id: snap['id'] as String?,
      name: snap['name'] as String?,
      score: snap['score'] as int?,
    );
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as String?,
      name: json['name'] as String?,
      score: json['score'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        if (name != null) "name": name,
        if (score != null) "points": score
      };
}
