import 'package:flutter/material.dart';

class PlayControl extends StatelessWidget {
  final Function addPlay;
  final Function changePlay;
  final Function changeScore;

  PlayControl(this.addPlay, this.changePlay, this.changeScore);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.yellow,
      onPressed: () {
        addPlay('Add this line in Play');
        changePlay(false);
        changeScore(true);
      },
      child: Text('This is Play'),
    );
  }
}
