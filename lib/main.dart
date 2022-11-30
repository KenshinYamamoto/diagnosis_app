import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp()); // runAppの中でMyAppをインスタンス化する
// }

void main() => runApp(_MyApp()); // アロー関数が存在しました

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<_MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 8},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 6}
      ],
    },
    {
      'questionText': 'What\'s your favorite game?',
      'answers': [
        {'text': 'Killing', 'score': 10},
        {'text': 'Roll Playing', 'score': 3},
        {'text': 'Fantasy', 'score': 5},
        {'text': 'Pazzle', 'score': 4}
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      // 変化するものをsetState内に入れる。そうすると、状態が保持される。(StatefulWidgetでのみ使用可能)
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    // 変数を変化させるので、setState内に記述することを忘れないでください。
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
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
