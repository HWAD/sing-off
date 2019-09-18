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
import './score_goToOther.dart';
import './score_player.dart';
import './video_recorder.dart';

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
  bool _isVideo = false;
  bool _isScore = false;
  String _selectedCategory = "Hip Hop";
  List<int> _decibels = [];

  String filePathToPlay;

  @override
  void initState() {
    super.initState();
    _karaokeButton = "KARAOKE";
    _isCategory = true;
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

  void _changeVideo(bool isVideo) {
    setState(() {
      _isVideo = isVideo;
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
      _changeCategory(false);
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

  void _setDecibels(int decibel) {
    setState(() {
      _decibels.add(decibel);
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
            MenuAlbum(_changeMenu, _changeVideo, _allSongs, _setSelectedSong,
                _selectedCategory),
          ]),
        ),
        Visibility(
          visible: _isVideo,
          child: Column(
            children: [
              VideoRecorder(
                setFilePathToPlay: _setFilePathToPlay,
                currentLyric: _currentLyric,
                flutterSound: _flutterSound,
                selectedSong: _selectedSong,
                setCurrentLyric: _setCurrentLyric,
                karaokeButton: _karaokeButton,
                setKaraokeButton: _setKaraokeButton,
                setDecibels: _setDecibels,),
                Container(
                child: PlayControl(
                  _changeVideo,
                  _changeScore,
                  _changeMenu,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: _isScore,
          child: Column(
            children: [
              VideoPlayerScreen(filePathToPlay: filePathToPlay),
              ScoreGoToOther(_changeMenu, _changeVideo, _changeScore),
            ],
          ),
        ),
      ],
    );
  }
}
