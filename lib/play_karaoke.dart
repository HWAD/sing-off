import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class PlayKaraoke extends StatelessWidget {
  final Function setKaraokeButton;
  final String karaokeButton;

  PlayKaraoke(this.setKaraokeButton, this.karaokeButton);

  final FlutterSound flutterSound = new FlutterSound();
  bool _hasPlayed = false;

  Future _startAudio() async {
    print('Start Recorder');
    await flutterSound.startRecorder('sdcard/recorded.m4a');
    print('Start Player');
    await flutterSound.startPlayer('sdcard/default.m4a');
    // setKaraokeButton('assets/stop.jpeg');
  }

  Future _stopAudio() async {
    print('Stop Recorder');
    await flutterSound.stopRecorder();
    print('Stop Player');
    await flutterSound.stopPlayer();
    // setKaraokeButton('assets/start.jpeg');
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (_hasPlayed == false) {
          _startAudio();
          // setKaraokeButton(_startAudio());
          _hasPlayed = true;
        } else {
          _stopAudio();
          // setKaraokeButton(_stopAudio());
          _hasPlayed = false;
        }
      },
      child: Text(karaokeButton),
    );
  }
}
