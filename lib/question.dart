import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; // 定数で宣言

  Question(this.questionText); // コンストラクタで質問文を取得し、定数に設定

  @override
  Widget build(BuildContext context) {
    return Container(
      // Containerで囲まないと、テキストのスペースが短いままとなってしまう
      width: double.infinity, // これでContainerが取得できる最大限のサイズを設定できる
      margin: EdgeInsets.all(10), // margin: 10pxの設定
      child: Text(
        questionText, // questionTextを表示
        style: TextStyle(fontSize: 28), // フォントサイズ変更
        textAlign: TextAlign.center, // 中央揃え
      ), // Textウィジェットを返す
    );
  }
}
