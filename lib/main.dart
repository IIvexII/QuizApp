import 'package:flutter/material.dart';
import 'package:quiz/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  // Global variables
  var _questionIndex = 0;
  var _totalScore = 0;
  var _questions = [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 2},
        {'text': 'Blue', 'score': 5},
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 8},
        {'text': 'Markhor', 'score': 3},
        {'text': 'Elephant', 'score': 6},
      ]
    },
    {
      'questionText': 'Which subject do you like?',
      'answers': [
        {'text': 'Mathematics', 'score': 3},
        {'text': 'Programming', 'score': 1},
        {'text': 'Physics', 'score': 3},
      ]
    },
  ];
  // Methods
  void answered({int reset = 0, int score = 0}) {
    _totalScore += score;

    setState(() {
      if (reset != 1)
        _questionIndex++;
      else {
        _questionIndex = 0;
        _totalScore = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        // If operatpr used to check if user answered all questions.
        body: _questionIndex < _questions.length
            ? Quiz(
                _questions,
                _questionIndex,
                answered,
              )
            : Result(answered, _totalScore),
      ),
    );
  }
}
