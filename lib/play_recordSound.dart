import 'package:flutter/material.dart';

//Made the button clickable twice with this, but to make it prettier, it needs to be put in State (manager.dart).
//Will improve it. For now though, it works!

bool recordPlaying = false;

class PlayRecordSound extends StatelessWidget {
  final Function startAudio;
  final Function endAudio;
  final Function recordedAudio;

  PlayRecordSound(this.startAudio, this.endAudio, this.recordedAudio);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.blueAccent,
        onPressed: () {
          recordTime();
        },
        child: Text("Tap to record"));
  }

  recordTime() {
    if (recordPlaying == false) {
      startAudio();
      recordPlaying = true;
    } else {
      endAudio();
      recordPlaying = false;
      recordedAudio(true);
    }
  }
}
