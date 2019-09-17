import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutterkaraoke/model_song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './model_song.dart';
import './menu_search.dart';
import './menu_album.dart';
import './menu_row.dart';
import './play_control.dart';
import './play_karaoke.dart';
import './score_board.dart';
import './score_replay.dart';
import './score_goToOther.dart';
import './video_player.dart';

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
  bool _isCategory = false;
  bool _isMenu = false;
  bool _isPlay = false;
  bool _isScore = false;
  String _selectedCategory = "Hip Hop";

  String filePathToPlay;

  @override
  void initState() {
    super.initState();
    _karaokeButton = "KARAOKE";
    _isCategory = true;
    _getAllSongs();
  }

  Future<void> _getAllSongs() async {
    print('in get all songs');
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

  void _changeCategory(bool isCategory) {
    setState(() {
      _isCategory = isCategory;
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
      // _isCategory = false;
      _changeCategory(false);
      // _isMenu = true;
      _changeMenu(true);
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

  void _setFilePathToPlay(String text) {
    setState(() {
      filePathToPlay = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: _isCategory,
          child: Column(children: [
            MenuSearch(_setCategory),
          ]),
        ),
        Visibility(
          visible: _isMenu,
          child: Column(children: [
            MenuRow(_setCategory, _changeMenu, _changeCategory),
            MenuAlbum(_changeMenu, _changePlay, _allSongs, _setSelectedSong,
                _selectedCategory),
          ]),
        ),
        Visibility(
          visible: _isPlay,
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.all(10.0),
                child: PlayControl(_changePlay, _changeScore, _changeMenu,),
              ),
              Text(
                _currentLyric,
                style: TextStyle(fontSize: 20),
                maxLines: 1,
              ),
              PlayKaraoke(_flutterSound, _selectedSong, _setCurrentLyric,
                  _karaokeButton, _setKaraokeButton, _setFilePathToPlay),
            ],
          ),
        ),
        Visibility(
          visible: _isScore,
          child: Column(
            children: [
              // ScoreBoard(),
              // // ScoreReplay(),
              ScoreGoToOther(_changeMenu, _changePlay, _changeScore),
              VideoPlayerScreen(filePathToPlay: filePathToPlay)
            ],
          ),
        ),
      ],
    );
  }
}
