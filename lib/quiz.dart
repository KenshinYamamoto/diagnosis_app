import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Columnで縦並び、Rowで横並び
      children: [
        // Columnでは、childrenの名前付き引数で、Listを渡す
        // Questionウィジェットに質問文(文字列)を渡す
        // この書き方で、List<Map<String, Object>>からkey指定してvalueを取ってくることが可能である。
        Question(questions[questionIndex]['questionText']),
        // Answerウィジェットに答えの文字列をmapで渡す
        // questionsのquestionIndex番号のMapの中から、answersをkeyとして持つものをList<String>として取得し、mapで回し、1つずつAnswerに渡す
        // スプレッド演算子で、Answerから返ってきたボタンを1つずつこのbodyのchildrenに追加する
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']),
              answer[
                  'text']); // Answerに渡すのはあくまで関数の「ポインタ」。なので、Answer側からquestionIndexにアクセス可能
        }).toList() // これがリストであることを確認してから生成されたAnswerWidgetをChildrenに追加する。その為のtoList()
      ],
    );
  }
}
