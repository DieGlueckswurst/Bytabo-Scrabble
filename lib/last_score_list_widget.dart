import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrabble_score_estimator/last_score.dart';

class LastScoreWidget extends StatelessWidget {
  final LastScore lastScore;

  const LastScoreWidget({Key key, this.lastScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5),
          Text("Word: " + lastScore.word),
          SizedBox(
            height: 2,
          ),
          Text("Score: " + lastScore.score.toString()),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
