import 'package:flutter/material.dart';
import './model_song.dart';

class ScoreBoard extends StatelessWidget {
  final ModelSong selectedSong;

  ScoreBoard(this.selectedSong);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 100,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          selectedSong.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'Score\n99',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    ]);
  }
}
