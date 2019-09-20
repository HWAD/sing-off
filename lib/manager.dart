import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutterkaraoke/model_song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './model_song.dart';
import './songs_search.dart';
import './songs_album.dart';
import './songs_row.dart';
import './recorder_control.dart';
import './animation.dart';
import './player.dart';
import './recorder.dart';

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
  // List<Duration> _highlightDurations = new List<Duration>();
  String _karaokeButton = "";
  bool _isCategory = false;
  bool _isSongs = false;
  bool _isRecorder = false;
  bool _isPlayer = false;
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

  void _changeSongs(bool isSongs) {
    setState(() {
      _isSongs = isSongs;
    });
  }

  void _changeRecorder(bool isRecorder) {
    setState(() {
      _isRecorder = isRecorder;
    });
  }

  void _changeCategory(bool isCategory) {
    setState(() {
      _isCategory = isCategory;
    });
  }

  void _changePlayer(bool isPlayer) {
    setState(() {
      _isPlayer = isPlayer;
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
      _changeSongs(true);
    });
  }

  void _setCurrentLyric(String line) {
    setState(() {
      _currentLyric = line;
    });
  }

  // void _setHighlightDurations(List<Duration> durations) {
  //   setState(() {
  //     _highlightDurations = durations;
  //   });
  // }

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
            SongSearch(_setCategory),
          ]),
        ),
        Visibility(
          visible: _isSongs,
          child: Column(children: [
            SongRow(_setCategory, _changeSongs, _changeCategory),
            SongAlbum(_changeSongs, _changeRecorder, _allSongs, _setSelectedSong,
                _selectedCategory),
          ]),
        ),
        Visibility(
          visible: _isRecorder,
          child: Column(
            children: [
              VideoRecorder(
                setFilePathToPlay: _setFilePathToPlay,
                currentLyric: _currentLyric,
                flutterSound: _flutterSound,
                selectedSong: _selectedSong,
                setCurrentLyric: _setCurrentLyric,
                // highlightDurations: _highlightDurations,
                karaokeButton: _karaokeButton,
                setKaraokeButton: _setKaraokeButton,
                setDecibels: _setDecibels,
              ),

              /// ANIMATION. FOR NOW IS DISABLED. TO TOGGLE IN ONLY IF PITCH IS AVAILABLE.
              // WaveAnimation(_decibels),
              Container(
                child: RecorderControl(
                  _changeRecorder,
                  _changePlayer,
                  _changeSongs,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: _isPlayer,
          child: Column(
            children: [
              VideoPlayerScreen(
                  filePathToPlay: filePathToPlay,
                  changeSongs: _changeSongs,
                  changeRecorder: _changeRecorder,
                  changePlayer: _changePlayer),
              // ScoreGoToOther(_changeSongs, _changePlay, _changeScore),
            ],
          ),
        ),
      ],
    );
  }
}
