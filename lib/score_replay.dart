import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class ScoreReplay extends StatelessWidget {
  final TextEditingController controller = TextEditingController(text: 'REPLAY');
  final FlutterSound flutterSound = new FlutterSound();

  ScoreReplay();

  Future _startReplay() async {
    try {
      await flutterSound.startPlayer('sdcard/recorded.m4a');
    } catch (e) {
      print("Error! $e");
    }
  }

  Future _stopReplay() async {
    await flutterSound.stopPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            if (controller.text == 'REPLAY') {
              _startReplay();
              controller.text = 'STOP';
            } else if (controller.text == 'STOP') {
              _stopReplay();
              controller.text = 'REPLAY';
            }
          },
          child: TextField(enabled: false, controller: controller),
        ),
      ],
    );
  }
}
