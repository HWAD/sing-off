import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PlayKaraoke extends StatelessWidget {
  final TextEditingController controller = TextEditingController(text: 'START');
  final FlutterSound flutterSound = new FlutterSound();

  final StorageReference storageReference = FirebaseStorage().ref();

  Future<String> _uploadAudio([String audioFileName]) async {
    if (audioFileName == null) {
      audioFileName = "RyoheiRecorded2.m4a";
    }
    // if (audioFile == null) {
    // audioFile = "sdcard/recorded.m4a";
    File audioFile = File("sdcard/recorded.m4a");
    // }
    StorageUploadTask ref = storageReference
        .child("audioFiles/" + audioFileName)
        .putFile(audioFile);
    String location = await (await ref.onComplete).ref.getDownloadURL();
    print(location.toString());
    return location;
  }

  Future _startAudio() async {
    print('Start Recorder');
    await flutterSound.startRecorder('sdcard/recorded.m4a');
    print('Start Player');
    await flutterSound.startPlayer('sdcard/testmp3.mp3');
  }

  Future _stopAudio() async {
    print('Stop Recorder');
    await flutterSound.stopRecorder();
    print('Stop Player');
    await flutterSound.stopPlayer();
    print('Upload to Firebase');
    await _uploadAudio();
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
