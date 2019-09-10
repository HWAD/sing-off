import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutterkaraoke/model_song.dart';

class PlayKaraoke extends StatelessWidget {
  final TextEditingController controller = TextEditingController(text: 'START');
  final FlutterSound flutterSound = new FlutterSound();
  final ModelSong selectedSong;

  PlayKaraoke(this.selectedSong);

  Future _startAudio() async {
    print('Start Recorder');
    await flutterSound.startRecorder('sdcard/recorded.m4a');
    print('Start Player');
    print(selectedSong);
    try {
      print('Music is playing <3');
      var s = await flutterSound.startPlayer(selectedSong.downloadURL);
      print('Music should be finished playing <3');
    } catch (e) {
      print("Error! $e");
    }
  }

  Future _stopAudio() async {
    print('Stop Recorder');
    await flutterSound.stopRecorder();
    print('Stop Player');
    await flutterSound.stopPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (controller.text == 'START') {
          _startAudio();
          controller.text = 'STOP';
        } else if (controller.text == 'STOP') {
          _stopAudio();
          controller.text = 'START';
        }
      },
      child: TextField(enabled: false, controller: controller),
    );
  }
}
