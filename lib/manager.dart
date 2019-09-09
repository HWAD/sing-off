import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutterkaraoke/model_song.dart';
import 'package:intl/intl.dart';

import './model_song.dart';
import './menu.dart';
import './menu_control.dart';
import './play.dart';
import './play_control.dart';
import './play_recordSound.dart';
import './play_playSound.dart';
import './score.dart';
import './score_control.dart';

class Manager extends StatefulWidget {
  final String startingMenu;

  Manager({this.startingMenu = 'Default Value'});

  @override
  State<StatefulWidget> createState() {
    return _Manager();
  }
}

class _Manager extends State<Manager> {
  List<String> _menu = [];
  List<String> _play = [];
  List<String> _score = [];
  List<ModelSong> _allSongs = [];
  ModelSong _selectedSong = ModelSong();
  bool _isMenu = true;
  bool _isPlay = false;
  bool _isScore = false;
  bool _isRecorded = false;
  bool _isPlaying = false;
  String _playerTxt;

  @override
  void initState() {
    // Ryohei can get songs from Firebase into _modelSong.
    // Here are samples.
    ModelSong sample1 = ModelSong();
    sample1.title = 'Ti Amo';
    sample1.artist = 'Steppico';
    sample1.score = 100;
    sample1.isFavorite = false;
    sample1.image = null;
    sample1.original = '/storage/emulated/0/sample1.m4a';
    sample1.record = '/storage/emulated/0/default.m4a';
    ModelSong sample2 = ModelSong();
    sample2.title = 'The Greatest Harmony';
    sample2.artist = 'Grafenberg';
    sample2.score = 0;
    sample2.isFavorite = true;
    sample2.image = null;
    sample2.original = '/storage/emulated/0/sample2.m4a';
    sample2.record = '/storage/emulated/0/default.m4a';
    _allSongs.add(sample1);
    _allSongs.add(sample2);
    _menu.add(widget.startingMenu);
    _isMenu = true;
    super.initState();
  }

  void _addMenu(String menu) {
    setState(() {
      _menu.add(menu);
    });
  }

  void _addPlay(String play) {
    setState(() {
      _play.add(play);
    });
  }

  void _addScore(String score) {
    setState(() {
      _score.add(score);
    });
  }

  void _changeMenu(bool isMenu) {
    setState(() {
      _isMenu = isMenu;
    });
  }

  void _changePlay(bool isPlay) {
    setState(() {
      _isPlay = isPlay;
    });
  }

  void _recordedAudio(bool isRecorded) {
    setState(() {
      _isRecorded = isRecorded;
    });
  }

  void _changeScore(bool isScore) {
    setState(() {
      _isScore = isScore;
    });
  }

  FlutterSound flutterSound = new FlutterSound();

  Future _startAudio() async {
    String path = await flutterSound.startRecorder(null);
    setState(() {
      _allSongs[1].record = path;
    });
  }

  Future _endAudio() async {
    await flutterSound.stopRecorder();
  }

  Future _startPlayer() async {
    await flutterSound.startPlayer(_allSongs[1].record);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: _isMenu,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: MenuControl(_addMenu, _changeMenu, _changePlay),
              ),
              //RYOHEI CHANGED THIS LINE TO INTEGRATE MENU PAGE
              Menu(_menu),
            ]
          ),
        ),
        Visibility(
          visible: _isPlay,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: PlayControl(_addPlay, _changePlay, _changeScore),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: PlayRecordSound(_startAudio, _endAudio, _recordedAudio),
              ),
              Play(_play),
            ],
          ),
        ),
        Visibility(
          visible: _isScore,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: ScoreControl(_addScore, _changeScore, _changeMenu),
              ),
              Score(_score),
            ],
          ),
        ),
        Visibility(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: PlayPlaySound(_startPlayer),
            ),
            visible: _isScore && _isRecorded),
      ],
    );
  }
}
