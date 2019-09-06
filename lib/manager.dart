import 'package:flutter/material.dart';

import './menu.dart';
import './menu_control.dart';
import './play.dart';
import './play_control.dart';
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

  void _changeScore(bool isScore) {
    setState(() {
      _isScore = isScore;
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
      ],
    );
  }
}
