import 'package:flutter/material.dart';

//Made the button clickable twice with this, but to make it prettier, it needs to be put in State (manager.dart).
//Will improve it. For now though, it works!

bool recordPlaying = false;

class PlayRecordSound extends StatelessWidget {
  final Function startAudio;
  final Function endAudio;

  PlayRecordSound(this.startAudio, this.endAudio);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.blueAccent,
        onPressed: () {
          recordTime();
        },
        child: Text("For changing fixed recorded sound"));
  }

  recordTime() {
    if (recordPlaying == false) {
      print('Start changing fixed recorded sound');
      startAudio();
      recordPlaying = true;
    } else {
      print('Stop changing fixed recorded sound');
      endAudio();
      recordPlaying = false;
    }
  }
}
