import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler; // 定数で宣言(Function型)
  // final VoidCallback selectHandler; // Functionではなく、VoidCallbackを使用する事も可能である
  final String answerText;

  Answer(this.selectHandler, this.answerText); // コンストラクタ

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity, // これでContainerが取得できる最大限のサイズを設定できる
      child: ElevatedButton(
        child: Text(answerText), // Buttonのtextを設定
        onPressed: selectHandler, // ボタンが押されたらselectHandlerを実行
        style: ButtonStyle(
          // ボタンのスタイル設定
          backgroundColor: MaterialStateProperty.all(Colors.pink), // 背景色設定
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ), // 文字列色設定
      ),
    );
  }
}
