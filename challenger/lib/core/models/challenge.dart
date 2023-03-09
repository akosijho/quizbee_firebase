import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String? id;
  final String? question;
  final String? answer;
  final String? status;
  final List<Option>? choices;

  const Question({this.id, this.question, this.status, this.choices, this.answer});

  @override
  List<Object?> get props => [id, question, choices, answer, status];

  factory Question.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snap){
    return Question(
      id: snap.id,
      question: snap['question'],
      answer: snap['answer'],
      choices: [],
      status: snap['status']
    );
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json["id"] as String?,
        question: json['question'] as String?,
        choices: json['choices'] as List<Option>?,
        answer: json['answer']);
  }
}

class Option extends Equatable {
  final String? id;
  final String? value;

  const Option({this.id, this.value});

  @override
  List<Object?> get props => [id, value];

  factory Option.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    return Option(
      id: snap['id'] as String?,
      value: snap['value'] as String?,);
  }

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
        id: json['id'] as String?,
        value: json['question_id'] as String?,);
  }
}
