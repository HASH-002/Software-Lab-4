import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0, _score = 0;
  final _questions = [
    {
      "question": "Which of the following is not a programming language?",
      "options": ["C++", "Python", "Java", "English"],
      "correct": 3
    },
    {
      "question": "Which of the following is not a datatype in C?",
      "options": ["double", "real", "int", "char"],
      "correct": 1
    }
  ];

  Widget build(BuildContext context) {
    answerQuestion(int index) {
      if (_index < _questions.length) {
        setState(() {
          if (index == _questions[_index]['correct']) _score += 1;
          _index = _index + 1;
        });
      }
    }

    _refreshQuiz() {
      setState(() {
        _index = 0;
        _score = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _index < _questions.length
            ? Quiz(
                answerQuestion,
                _questions,
                this._index,
              )
            : Result(_refreshQuiz, _score),
      ),
    );
  }
}
