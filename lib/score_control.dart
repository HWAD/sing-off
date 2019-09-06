import 'package:flutter/material.dart';

class ScoreControl extends StatelessWidget {
  final Function addScore;
  final Function changeScore;
  final Function changeMenu;

  ScoreControl(this.addScore, this.changeScore, this.changeMenu);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        addScore('Add this line in Score');
        changeScore(false);
        changeMenu(true);
      },
      child: Text('This is Score'),
    );
  }
}
