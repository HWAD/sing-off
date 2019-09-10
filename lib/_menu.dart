import 'package:flutter/material.dart';
import 'package:flutterkaraoke/model_song.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'dart:async';

import "./_songData.dart";
import "./_model.dart";

String truncate(String title) {
  if (title.length < 25) {
    return title;
  } else {
    return title.substring(0, 22) + '...';
  }
}

class SongList extends StatelessWidget {
  // List<SongCard> _songCard;
  final List songs = [];
  // final FirebaseDatabase _database = FirebaseDatabase.instance;
  // Query _todoQuery;

  final titleController = TextEditingController();

// void initState() {
//   _todoQuery = _database
//         .reference()
//         .child("todo")
//         .orderByChild("userId")
//         .equalTo(widget.userId);
//     _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(_onEntryAdded);
//     _onTodoChangedSubscription = _todoQuery.onChildChanged.listen(_onEntryChanged);

// }

  Future<List> getData() async {
    const url = 'https://flutterkaraoke.firebaseio.com/songs.json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);

      Map<String, dynamic> myMap = json.decode(response.body);
      List<dynamic> returnable = myMap.values.toList();
      // for (var entry in myMap.entries) {
      //   returnable.add(entry);
      // }
      // return FirebaseDataClass.fromJson(json.decode(response.body));
      songs.add(returnable);
      print(returnable[0]);
      return returnable;
    } else {
      throw Exception('Failed to load post');
    }
  }

  void addSong(ModelSong upload) {
    // FirebaseDataClass song
    const url = 'https://flutterkaraoke.firebaseio.com/songs.json';
<<<<<<< HEAD
    http
        .post(
      url,
      body: json.encode(
          // {'title': song.title, 'artist': song.artist, 'url': song.url}),
          {
            "title": 'It\'s my life',
            "artist": "Bon Jovi",
            "downloadURL":
                'https://firebasestorage.googleapis.com/v0/b/flutterkaraoke.appspot.com/o/audioFiles%2Fits-my-life-bon-jovi-karaokewmv.mp3?alt=media&token=5da76dd0-bd9d-4b1e-8718-701f7bef3e1d',
            "image": 'assets/steppico.jpeg',
            "score": 100,
            "lyrics": """[Verse 1]
This ain't a song for the broken-hearted (woah oh, woah oh, oh)
No silent prayer for the faith-departed
I ain't gonna be just a face in the crowd
You're gonna hear my voice when I shout it out loud

[Chorus]
It's my life, it's now or never
I ain't gonna live forever
I just want to live while I'm alive
(It's my life) My heart is like an open highway
Like Frankie said, "I did it my way"
I just wanna live while I'm alive
It's my life

[Verse 2]
This is for the ones who stood their ground
For Tommy and Gina who never backed down
Tomorrow's getting harder make no mistake
Luck ain't even lucky, got to make your own breaks

[Chorus]
It's my life, it's now or never
I ain't gonna live forever
I just want to live while I'm alive
(It's my life) My heart is like an open highway
Like Frankie said, "I did it my way"
I just wanna live while I'm alive
'Cause it's my life

[Bridge]
Better stand tall when they're calling you out
Don't bend, don't break, baby, don't back down

[Chorus]
It's my life, it's now or never
I ain't gonna live forever
I just want to live while I'm alive
(It's my life) My heart is like an open highway
Like Frankie said, "I did it my way"
I just wanna live while I'm alive
It's my life and it's now or never
I ain't gonna live forever
I just want to live while I'm alive
(It's my life) My heart is like an open highway
Like Frankie said, "I did it my way"
I just wanna live while I'm alive
It's my life""",
            "isFavorite": false,
          }),
    )
        .then((response) {
=======
    http.post(url, body: json.encode(upload)).then((response) {
>>>>>>> b6039b5d81536b5bdd4c5d8dcbd890940f1bd6fe
      print('posted');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 5,
              ),
              padding: EdgeInsets.all(5),
              child: Card(
                color: Colors.blue,
                child: Text(
                  'Song Menu',
                  style: TextStyle(fontSize: 20),
                ),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      // onChanged: (String value) {
                      //   titleInput = value;
                      // },
                    ),
                    FlatButton(
                      child: Text('Search'),
                      textColor: Colors.purple,
                      onPressed: () {
                        print('Searching');
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Column(
                    children: songlist.map((element) {
                      return Card(
                          child: InkWell(
                              onTap: () async {
                                print('play this song!');
                                await getData();
                                print("async; " + songs.toString());
                              },
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 60,
                                    child: Container(
                                        alignment: Alignment.bottomRight,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1, horizontal: 1),
                                        child: Text(element.duration.toString(),
                                            style: TextStyle(
                                              fontSize: 7,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ))),
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.purple,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: new AssetImage(
                                            element.image.toString()),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(truncate(element.title),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        Text(element.artist,
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //not necessary unless songtitle string length is less than some value: I'm going to pad the string instead
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      // mainAxisSize: MainAxisSize.max,
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FlatButton(
                                          child: Text('Favorite',
                                              style: TextStyle()),
                                          textColor: Colors.blue,
                                          onPressed: () {
                                            print(
                                                'I just added this to favorites!');
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )));
                    }).toList(),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
