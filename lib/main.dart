import 'package:flutter/material.dart';
import 'package:practice/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = [
    {
      'questionText': 'what is your fav colour?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 17},
        {'text': 'purple', 'score': 20},
        {'text': 'green', 'score': 19},
        {'text': 'white', 'score': 25}
      ]
    },
    {
      'questionText': 'what is your fav animal?',
      'answers': [
        {'text': 'lion', 'score': 2},
        {'text': 'tiger', 'score': 3},
        {'text': 'dog', 'score': 100},
        {'text': 'cat', 'score': 70},
        {'text': 'zebra', 'score': -1}
      ]
    },
    {
      'questionText': 'Why you are learning flutter?',
      'answers': [
        {'text': 'It is Cool', 'score': 100},
        {'text': 'it is new', 'score': 75},
        {'text': 'its easy to learn', 'score': 75},
        {'text': 'Internship opportunities', 'score': 90}
      ]
    },
  ];

  void _answerQuestion(int score) {
    // var aBool = true;
    //aBool = false
    _totalScore += score;
    print(_totalScore);
    if (_questionIndex < _questions.length) {
      print("we have more questionss");
    }

    setState(() {
      _questionIndex++;
    });
    print('answer chosen');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
