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
    },
    {
      "question": "What is required in each C program?",
      "options": ["The program does not require any function",
                  "The program must have at least one function",
                  "Input data", "Output data"],
      "correct": 2
    },
    {
      "question": "Which of the following comment is correct when a macro definition includes arguments?",
      "options": ["The opening parenthesis should immediately follow the macro name",
                  "There should be at least one blank between the macro name and the opening parenthesis",
                  "There should be only one blank between the macro name and the opening parenthesis",
                  "All the above comments are correct"],
      "correct": 1
    },
    {
      "question": "What is a lint?",
      "options": ["C compiler", "Interactive debugger", "Analyzing tool", "C interpreter"],
      "correct": 3
    },
    {
      "question": 'What is the output of this statement "printf("%d", (a++))"?',
      "options": ["The value of (a + 1)", "The current value of a", "Error message", "Garbage"],
      "correct": 2
    },
    {
      "question": "Why is a macro used in place of a function?",
      "options": ["It reduces execution time", "It reduces code size", "It increases execution time",
                  "It increases code size"],
      "correct": 4
    },
    {
      "question": "In the C language, the constant is defined ____",
      "options": ["Before main", "After main", "Anywhere, but starting on a new line",
                  "None of the these"],
      "correct": 3
    },
    {
      "question": "A pointer is a memory address. Suppose the pointer variable has p address 1000, "
          "and that p is declared to have type int*, and an int is 4 bytes long. What address is "
          "represented by expression p + 2?",
      "options": ["1002", "1004", "1006", "1008"],
      "correct": 4
    },
    {
      "question": "Which one of the following is a loop construct that will always be executed once?",
      "options": ["for", "while", "switch", "do while"],
      "correct": 4
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
