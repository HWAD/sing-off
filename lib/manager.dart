import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';

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
  bool _isMenu = false;
  bool _isPlay = false;
  bool _isScore = false;
  bool _isRecorded = false;
  bool _isPlaying = false;
  String _playerTxt;

  @override
  void initState() {
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
  var _recorderSubscription;
  var _playerSubscription;

  Future _startAudio() async {
    String path = await flutterSound.startRecorder(null);
    print('startRecorder: $path');
    _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
      DateTime date =
          new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
      String txt = DateFormat('mm:ss:SS', 'en_US').format(date);
    });
    print(_recorderSubscription);
    return "x";
  }

  Future _endAudio() async {
    String result = await flutterSound.stopRecorder();
    print('stopRecorder: $result');

    if (_recorderSubscription != null) {
      _recorderSubscription.cancel();
      _recorderSubscription = null;
    }
    return "y";
  }

  Future _startPlayer() async {
    String path = await flutterSound.startPlayer(null);
    print('startPlayer: $path');

    _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
      if (e != null) {
        DateTime date =
            new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
        String txt = DateFormat('mm:ss:SS', 'en_US').format(date);
        this.setState(() {
          this._isPlaying = true;
          this._playerTxt = txt.substring(0, 8);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: MenuControl(_addMenu, _changeMenu, _changePlay),
          ),
          visible: _isMenu,
        ),
        Visibility(
          child: Menu(_menu),
          visible: _isMenu,
        ),
        Visibility(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: PlayControl(_addPlay, _changePlay, _changeScore),
          ),
          visible: _isPlay,
        ),
        Visibility(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: PlayRecordSound(_startAudio, _endAudio, _recordedAudio),
          ),
          visible: _isPlay,
        ),
        Visibility(
          child: Play(_play),
          visible: _isPlay,
        ),
        Visibility(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: ScoreControl(_addScore, _changeScore, _changeMenu),
          ),
          visible: _isScore,
        ),
        Visibility(
          child: Score(_score),
          visible: _isScore,
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
