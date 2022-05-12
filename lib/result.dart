import 'dart:ffi';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHanler;

  Result(this.resultScore, this.resetHanler);

  String get resultPhrase {
    var resulttext = 'You did it';
    if (resultScore <= 100) {
      resulttext = "Meh, try again with better choices!";
    } else {
      resulttext = "Impressive";
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        )),
        FlatButton(
          onPressed: resetHanler,
          child: Text('Restart Quiz!'),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
