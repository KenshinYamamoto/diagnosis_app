import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  int questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      // 変化するものをsetState内に入れる。そうすると、状態が保持される。(StatefulWidgetでのみ使用可能)
      questionIndex++;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': ['Max', 'Max', 'Max', 'Max'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          // Columnで縦並び、Rowで横並び
          children: [
            // Columnでは、childrenの名前付き引数で、Listを渡す
            // Questionウィジェットに質問文(文字列)を渡す
            // この書き方で、List<Map<String, Object>>からkey指定してvalueを取ってくることが可能である。
            Question(questions[questionIndex]['questionText']),
            // Answerウィジェットに答えの文字列をmapで渡す
            // questionsのquestionIndex番号のMapの中から、answersをkeyとして持つものをList<String>として取得し、mapで回し、1つずつAnswerに渡す
            // スプレッド演算子で、Answerから返ってきたボタンを1つずつこのbodyのchildrenに追加する
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion,
                  answer); // Answerに渡すのはあくまで関数の「ポインタ」。なので、Answer側からquestionIndexにアクセス可能
            }).toList() // これがリストであることを確認してから生成されたAnswerWidgetをChildrenに追加する。その為のtoList()
          ],
        ),
      ),
    );
  }
}
