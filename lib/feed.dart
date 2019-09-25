import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:flutter_image/network.dart';

import 'dart:convert';

import './model_song.dart';

class Feed extends StatefulWidget {
  final List<ModelSong> _allVideos;
  final Function changeCategory;
  final Function changeFeed;
  final Function setFilePathToPlay;
  final Function changePlayer;
  final Function getAllVideos;
  final Function changeSongs;
  final String username;
  Feed(
      this._allVideos,
      this.changeCategory,
      this.changeFeed,
      this.setFilePathToPlay,
      this.changePlayer,
      this.getAllVideos,
      this.changeSongs,
      this.username);
  @override
  _Feed createState() {
    return _Feed(_allVideos, changeCategory, changeFeed, setFilePathToPlay,
        changePlayer, getAllVideos, changeSongs, username);
  }
}

class _Feed extends State<Feed> {
  List<ModelSong> allVideos = [];
  Function changeCategory;
  Function changeFeed;
  Function setFilePathToPlay;
  Function changePlayer;
  Function getAllVideos;
  Function changeSongs;
  String username;
  bool isFilterByUsername = false;
  List<ModelSong> filteredVideos = [];
  _Feed(
      this.allVideos,
      this.changeCategory,
      this.changeFeed,
      this.setFilePathToPlay,
      this.changePlayer,
      this.getAllVideos,
      this.changeSongs,
      this.username);
  Future<void> refresh() async {
    const url = 'https://flutterkaraoke.firebaseio.com/videos.json';
    await http.get(url).then((response) {
      Map<String, dynamic> mappedBody = json.decode(response.body);
      List<dynamic> dynamicList = mappedBody.values.toList();
      List<dynamic> dynamicKeys = mappedBody.keys.toList();
      List<ModelSong> modelVideoList = [];
      for (int i = dynamicList.length - 1; i >= 0; i--) {
        modelVideoList.add(ModelSong(
            id: dynamicKeys[i],
            title: dynamicList[i]["title"],
            artist: dynamicList[i]["artist"],
            downloadURL: dynamicList[i]["downloadURL"],
            length: dynamicList[i]["length"],
            category: dynamicList[i]["category"],
            imageURL: dynamicList[i]["imageURL"],
            score: dynamicList[i]["score"],
            isFavorite: dynamicList[i]["isFavorite"]));
      }
      setState(() {
        allVideos = modelVideoList;
      });
    });
  }

  void filter(bool setFilter) {
    setState(() {
      isFilterByUsername = setFilter;
    });
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  dynamic shareMe(dynamic element) {
    Share.share("check out my new video! ${element.downloadURL}");
  }

  void like(String id, int cur) {
    String url = 'https://flutterkaraoke.firebaseio.com/videos/' + id + '.json';
    int count = cur + 1;
    Map<String, dynamic> upload = {
      'score': count,
    };
    http.patch(url, body: json.encode(upload)).then((response) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * (10 / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    child: Column(
                      children: [
                        Icon(isFilterByUsername == true
                            ? Icons.person
                            : Icons.music_note),
                        Text(
                          isFilterByUsername == true ? "User" : "Feed",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    onPressed: () {
                      if (isFilterByUsername == true) {
                        filter(false);
                      } else {
                        filter(true);
                      }
                    },
                  ),
                ),
                Center(
                  child: Text(
                    'Sing-Off',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      changeFeed(false);
                      changeSongs(true);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.music_video,
                        ),
                        Text(
                          "Songs",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[800],
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: allVideos.where((video) {
                        if (isFilterByUsername == true) {
                          return video.category == username;
                        } else {
                          return true;
                        }
                      }).map((element) {
                        return Container(
                          color: Colors.black38,
                          child: InkWell(
                            onTap: () {
                              setFilePathToPlay(element.downloadURL);
                              changePlayer(true);
                              changeFeed(false);
                            },
                            onDoubleTap: () {
                              like(element.id, element.score);
                            },
                            onLongPress: () {
                              shareMe(element);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  color: Colors.grey[100],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Icon(Icons.person,
                                            color: Colors.black54),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                (28 / 100),
                                        child: Text(
                                          element.category.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              (50 / 100),
                                        ),
                                        padding:
                                            EdgeInsets.only(right: 2, left: 3),
                                        child: Icon(Icons.thumb_up,
                                            color: Colors.black54, size: 15),
                                      ),
                                      Text(
                                        element.score.toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.8,
                                  width: MediaQuery.of(context).size.width / 1,
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(bottom: 2, right: 2),
                                    alignment: Alignment.bottomRight,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    border: Border.all(
                                      color: Colors.grey[100],
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImageWithRetry(
                                          element.imageURL),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.grey[200],
                                  height: 45,
                                  padding: EdgeInsets.only(top: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              element.title,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              element.artist,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
