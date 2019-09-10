import 'package:flutter/material.dart';

bool recordPlaying = false;

class PlayPlaySound extends StatelessWidget {
  final Function startPlayer;

  PlayPlaySound(this.startPlayer);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.lightGreen,
        onPressed: () {
          startPlayer();
        },
        child: Text("Play!"));
  }
}
