import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutterkaraoke/model_song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './model_song.dart';
import './menu_search.dart';
import './menu_album.dart';
import './play_control.dart';
import './play_karaoke.dart';
import './score_board.dart';
import './score_replay.dart';
import './score_goToOther.dart';

class Manager extends StatefulWidget {
  final String startingMenu;

  Manager({this.startingMenu = 'Default Value'});

  @override
  State<StatefulWidget> createState() {
    return _Manager();
  }
}

class _Manager extends State<Manager> {
  List<ModelSong> _allSongs = [];
  FlutterSound _flutterSound = new FlutterSound();
  ModelSong _selectedSong = new ModelSong(
      title: "none",
      artist: "none",
      downloadURL: "none",
      image: "none",
      lyrics: "[00:00:00]Lyrics",
      score: 0,
      isFavorite: false);
  String _currentLyric = "Lyrics Come Here!!";
  String _karaokeButton = "";
  bool _isMenu = false;
  bool _isPlay = false;
  bool _isScore = false;
  String _selectedCategory = "Hip Hop";
  List<int> _decibels = [];

  @override
  void initState() {
    super.initState();
    _karaokeButton = "KARAOKE";
    _isMenu = true;
    _getAllSongs();
  }

  Future<void> _getAllSongs() async {
    const url = 'https://flutterkaraoke.firebaseio.com/songs.json';
    http.get(url).then((response) {
      Map<String, dynamic> mappedBody = json.decode(response.body);
      List<dynamic> dynamicList = mappedBody.values.toList();
      List<ModelSong> modelSongList = [];
      for (int i = 0; i < dynamicList.length; i++) {
        modelSongList.add(ModelSong(
            title: dynamicList[i]["title"],
            artist: dynamicList[i]["artist"],
            downloadURL: dynamicList[i]["downloadURL"],
            category: dynamicList[i]["category"],
            image: dynamicList[i]["image"],
            score: dynamicList[i]["score"],
            lyrics: dynamicList[i]["lyrics"],
            isFavorite: dynamicList[i]["isFavorite"]));
      }
      setState(() {
        _allSongs = modelSongList;
      });
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

  void _setCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _setCurrentLyric(String line) {
    setState(() {
      _currentLyric = line;
    });
  }

  void _setKaraokeButton(String text) {
    setState(() {
      _karaokeButton = text;
    });
  }

  void _setDecibels(int decibel) {
    setState(() {
      _decibels.add(decibel);
    });
    print("Insert Decibel");
    print(_decibels.last);
    print(_decibels.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: _isMenu,
          child: Column(children: [
            MenuSearch(_setCategory),
            MenuAlbum(_changeMenu, _changePlay, _allSongs, _setSelectedSong,
                _selectedCategory),
          ]),
        ),
        Visibility(
          visible: _isPlay,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: PlayControl(_changePlay, _changeScore),
              ),
              Text(_currentLyric),
              PlayKaraoke(_flutterSound, _selectedSong, _setCurrentLyric,
                  _karaokeButton, _setKaraokeButton, _setDecibels),
            ],
          ),
        ),
        Visibility(
          visible: _isScore,
          child: Column(
            children: [
              ScoreBoard(),
              ScoreReplay(),
              ScoreGoToOther(_changeMenu, _changePlay, _changeScore),
            ],
          ),
        ),
      ],
    );
  }
}
