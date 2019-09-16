import 'dart:io';
import 'dart:async';
import 'dart:collection';

import './model_song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:camera/camera.dart';


import './model_song.dart';
import './video_recorder.dart';

class PlayKaraoke extends StatelessWidget {
  final ModelSong selectedSong;
  final Function setCurrentLyric;
  final LinkedHashMap<String, String> mappedLyrics;
  final String karaokeButton;
  final Function setKaraokeButton;

  PlayKaraoke(ModelSong selectedSong, Function setCurrentLyric, String karaokeButton, Function setKaraokeButton)
      : this.selectedSong = selectedSong,
        this.setCurrentLyric = setCurrentLyric,
        this.mappedLyrics = selectedSong.lyrics.split('[').fold(
            new LinkedHashMap<String, String>(), (accumuLines, currentLine) {
          if (currentLine != "") {
            accumuLines[currentLine.split(']')[0]] = currentLine.split(']')[1];
          }
          return accumuLines;
        }),
        this.karaokeButton = karaokeButton,
        this.setKaraokeButton = setKaraokeButton;

  final TextEditingController controller =
      TextEditingController(text: 'KARAOKE');
  final FlutterSound flutterSound = new FlutterSound();
  StreamSubscription<PlayStatus> _playerSubscription;

  final StorageReference storageReference = FirebaseStorage().ref();

  Future<String> uploadAudio(
      [String audioFileName, String audioTitle, String artist]) async {
    if (audioFileName == null) {
      audioFileName = "RyoheiRecorded2.m4a";
    }
    File audioFile = File("sdcard/recorded.m4a");
    StorageUploadTask ref = storageReference
        .child("audioFiles/" + audioFileName)
        .putFile(audioFile);
    String location = await (await ref.onComplete).ref.getDownloadURL();
    return location;
  }

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
    await flutterSound.startRecorder('sdcard/recorded.m4a');
    try {
      print("lyrics? ${selectedSong.lyrics}");
      await flutterSound.startPlayer(selectedSong.downloadURL);
      DateTime lyricStartTime = DateFormat('mm:ss:SS', 'en_US')
          .parseUTC(mappedLyrics.keys.first.padRight(9, "0"));
      String lyricLine = mappedLyrics[mappedLyrics.keys.first];
      mappedLyrics.remove(mappedLyrics.keys.first);
      _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
          DateTime currentTime = new DateTime.fromMillisecondsSinceEpoch(
              e.currentPosition.toInt(), isUtc: true);
          DateTime lyricStopTime = DateFormat('mm:ss:SS', 'en_US')
              .parseUTC(mappedLyrics.keys.first.padRight(9, "0"));
          if (lyricStartTime.isBefore(currentTime) &&
              currentTime.isBefore(lyricStopTime)) {
            print(lyricLine);
            setCurrentLyric(lyricLine);
            lyricStartTime = lyricStopTime;
            lyricLine = mappedLyrics[mappedLyrics.keys.first];
            mappedLyrics.remove(mappedLyrics.keys.first);
          }
      });
    } catch (e) {
      print("Error! $e");
    }
  }

  Future _stopAudio() async {
    await flutterSound.stopRecorder();
    await flutterSound.stopPlayer()
    // .then((value) {
    //   if (_playerSubscription != null) {
    //     _playerSubscription.cancel();
    //     _playerSubscription = null;
    //   }
    // })
    ;
    // _playerSubscription.cancel();
    await uploadAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            if (karaokeButton == 'KARAOKE') {
              _startAudio();
              setKaraokeButton('STOP');
            } else if (karaokeButton == 'STOP') {
              _stopAudio();
              setKaraokeButton('KARAOKE');
            }
          },
          child: Text(karaokeButton),
        ),
      ],
    );
  }
}
