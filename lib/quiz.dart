import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int question_index;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.question_index,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[question_index]["questionText"].toString()),
      ...(questions[question_index]["answers"] as List<Map<String,Object>>).map((answer) {
        return Answer(() => answerQuestion(answer["score"]), answer["text"].toString());
      }).toList(),
    ]);
  }
}
