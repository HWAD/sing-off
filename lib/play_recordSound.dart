import 'package:flutter/material.dart';
import 'dart:async';

class PlayRecordSound extends StatelessWidget {
  final Function startAudio;
  final Function endAudio;

  PlayRecordSound(this.startAudio, this.endAudio);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: () {
        startAudio();
        Text("Recording started");
        Timer(Duration(seconds: 10), () => {endAudio()});
      },
      child: Text('Start recording'),
    );
  }
}
