import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function answered;
  final int totalScore;
  Result(this.answered, this.totalScore);

  String get textPhrase {
    String text;
    if (totalScore <= 6)
      text = 'You are very good and innocent guy.';
    else if (totalScore <= 14)
      text = 'You are an average person.';
    else
      text = 'You are bad.';

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            textPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          RaisedButton(
            child: Text(
              'Reset',
            ),
            onPressed: () {
              answered(reset: 1);
            },
          ),
        ],
      ),
    );
  }
}
