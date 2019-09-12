import 'package:flutter/material.dart';

class ScoreGoToOther extends StatelessWidget {
  final Function changeMenu;
  final Function changePlay;
  final Function changeScore;

  ScoreGoToOther(this.changeMenu, this.changePlay, this.changeScore);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RaisedButton(
        color: Colors.blue,
        onPressed: () {
          changeScore(false);
          changeMenu(true);
        },
        child: Text('Go Album'),
      ),
      RaisedButton(
        color: Colors.blue,
        onPressed: () {
          changeScore(false);
          changePlay(true);
        },
        child: Text('Try Again'),
      )
    ]);
  }
}
