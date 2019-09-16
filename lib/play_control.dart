import 'package:flutter/material.dart';

class PlayControl extends StatelessWidget {
  final Function changePlay;
  final Function changeScore;

  PlayControl(this.changePlay, this.changeScore);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.yellow,
      onPressed: () {
        changePlay(false);
        changeScore(true);
      },
      child: Text('Go to Score'),
    );
  }
}
