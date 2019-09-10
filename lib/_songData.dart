 import 'package:flutter/material.dart';
 
  class SongCard {
  final String id;
  final String title;
  final String artist;
  final double duration;
  final String kURL;
  final String url;
  final String image;
  final DateTime date;


  SongCard(
      {@required this.id,
      @required this.artist,
      @required this.title,
      @required this.image,
      @required this.duration,
      @required this.url,
      @required this.kURL,
      @required this.date});
}




final List<SongCard> songlist = [
    SongCard(
        id: "0",
        title: "a20",
        artist: "Steppico1",
        image: 'assets/steppico.jpeg',
        kURL:
            "gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3",
        duration: 2.60,
        url:
            "https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6",
        date: DateTime.now()),
    SongCard(
        id: "1",
        title: "SongTitle2",
        artist: "Steppico2",
        image: 'assets/steppico.jpeg',
        kURL:
            "gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3",
        duration: 2.61,
        url:
            "https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6",
        date: DateTime.now()),
    SongCard(
        id: "2",
        title: "SongTitle3",
        artist: "Steppico3",
        image: 'assets/steppico.jpeg',
        kURL:
            "gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3",
        duration: 2.60,
        url:
            "https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6",
        date: DateTime.now()),
    SongCard(
        id: "t2",
        title: "SongTitle4",
        artist: "Steppico4",
        image: 'assets/steppico.jpeg',
        kURL:
            "gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3",
        duration: 2.61,
        url:
            "https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6",
        date: DateTime.now()),
    SongCard(
        id: "t1",
        title: "SongTitle5",
        artist: "Steppico5",
        image: 'assets/steppico.jpeg',
        kURL:
            "gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3",
        duration: 2.60,
        url:
            "https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6",
        date: DateTime.now()),
    SongCard(
        id: "t2",
        title: "SongTitle6",
        artist: "Steppico6",
        image: 'assets/steppico.jpeg',
        kURL:
            "gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3",
        duration: 2.61,
        url:
            "https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6",
        date: DateTime.now()),
    SongCard(
        id: "t1",
        title: "SongTitle7",
        artist: "Steppico7",
        image: 'assets/steppico.jpeg',
        kURL:
            "gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3",
        duration: 2.60,
        url:
            "https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6",
        date: DateTime.now()),
    SongCard(
        id: "t2",
        title: "SongTitle8",
        artist: "Steppico8",
        image: 'assets/steppico.jpeg',
        kURL:
            "gs://flutterkaraoke.appspot.com/audioFiles/Cambo_-_01_-_Coffee.mp3",
        duration: 2.61,
        url:
            "https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2FCambo_-_01_-_Coffee.mp3?alt=media&token=4d831051-1439-4f96-a2cc-8088d54b8fb6",
        date: DateTime.now()),
  ];
