import 'package:firebase_database/firebase_database.dart';

class FirebaseDataClass {
  String title;
  String artist;
  String url;

  FirebaseDataClass({this.title, this.artist, this.url});

  factory FirebaseDataClass.fromJson(Map<String, dynamic> json) {

    var a = FirebaseDataClass(
      title: json['title'],
      artist: json['artist'],
      url: json['url'],
    );
    return a;
  }
}
