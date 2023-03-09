import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String? id;
  final String? question;
  final String? answer;
  final List<Option>? choice;

  const Question({this.id, this.question, this.choice, this.answer});

  @override
  List<Object?> get props => [id, question, choice, answer];

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json["id"] as String?,
        question: json['question'] as String?,
        choice: json['choices'] as List<Option>?,
        answer: json['answer']);
  }
}

class Option extends Equatable {
  final String? id;
  final String? value;

  const Option({this.id, this.value});

  @override
  List<Object?> get props => [id, value];

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
        id: json['id'] as String?,
        value: json['question_id'] as String?,);
  }
}
