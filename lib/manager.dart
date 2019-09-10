import 'package:flutter/material.dart';
import 'package:flutterkaraoke/model_song.dart';

import './model_song.dart';
import './menu_search.dart';
import './menu_album.dart';
import './play.dart';
import './play_control.dart';
import './play_karaoke.dart';
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
  List<String> _play = [];
  List<String> _score = [];
  List<ModelSong> _allSongs = [];
  ModelSong _selectedSong = ModelSong();
  bool _isMenu = false;
  bool _isPlay = false;
  bool _isScore = false;

  @override
  void initState() {
    // Ryohei can get songs from Firebase into _modelSong.
    // Here are samples.
    _allSongs = [
      ModelSong(
        id: 1,
        title: 'Ti Amo',
        artist: "Steppico1",
        locatedURL:
            'gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3',
        downloadURL:
            'https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6',
        image: 'assets/steppico.jpeg',
        score: 100,
        isFavorite: false,
      ),
      ModelSong(
        id: 2,
        title: 'Ti Amo2',
        artist: "Steppico2",
        locatedURL:
            'gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3',
        downloadURL:
            'https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6',
        image: 'assets/steppico.jpeg',
        score: 100,
        isFavorite: false,
      ),
    ];
    _isMenu = true;
    super.initState();
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

  void _setSelectedSong(ModelSong song) {
    setState(() {
      _selectedSong = song;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: _isMenu,
          child: Column(children: [
            MenuSearch(),
            MenuAlbum(_changeMenu, _changePlay, _allSongs, _setSelectedSong),
          ]),
        ),
        Visibility(
          visible: _isPlay,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: PlayControl(_addPlay, _changePlay, _changeScore),
              ),
              Play(_play),
              PlayKaraoke(_selectedSong),
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
      ],
    );
  }
}
