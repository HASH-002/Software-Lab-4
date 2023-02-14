import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final questions;
  final ValueChanged<int> answerQuestion;
  final int _index;

  Quiz(
    @required this.answerQuestion,
    @required this.questions,
    @required this._index,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[_index]["question"] as String,
        ),
        ...questions[_index]["options"]
            .map((option) => Answer(
                () => answerQuestion(
                    questions[_index]["options"].indexOf(option)),
                option))
            .toList()
      ],
    );
  }
}
