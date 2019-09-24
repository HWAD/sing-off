import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './model_song.dart';
import 'package:share/share.dart';

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
      List<ModelSong> modelVideoList = [];
      for (int i = dynamicList.length - 1; i >= 0; i--) {
        modelVideoList.add(ModelSong(
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
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                        ),
                        Text("User")
                      ],
                    ),
                    onPressed: () {
                      // Scaffold.of(context)
                      //     .showSnackBar(SnackBar(content: Text('Tap')));
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
                  child: InkWell(
                    onTap: () {
                      changeFeed(false);
                      changeSongs(true);
                    },
                    child: Icon(
                      Icons.music_video,
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
                          // margin: EdgeInsets.only(bottom: 40),
                          color: Colors.black38,
                          child: InkWell(
                            onTap: () {
                              setFilePathToPlay(element.downloadURL);
                              changePlayer(true);
                              changeFeed(false);
                            },
                            onLongPress: () {
                              // showMenu(
                              //   items: <PopupMenuEntry>[
                              //     PopupMenuItem(
                              //       child: Text("Share this video",
                              //           style: TextStyle(color: Colors.black)),
                              /*value: */ shareMe(element) /*,*/;
                              //     ),
                              //   ],
                              //   context: context,
                              //   position:
                              // RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              // color: Colors.white,
                              // );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  color: Colors.grey[100],
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //add a photo as well.
                                      Text(
                                        element.category.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width: MediaQuery.of(context).size.width / 1,
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      element.score.toString(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        backgroundColor:
                                            Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        // color: Colors.grey[100],
                                        ),
                                    image: DecorationImage(
                                      image: NetworkImage(element.imageURL),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.grey[200],
                                  height: 25,
                                  child: Row(
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
                                      Text(
                                        element.artist,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   children: <Widget>[
                                  //     Container(
                                  //       child: InkWell(
                                  //           onTap: () {
                                  //             //here we do a plus one on the count.
                                  //             //then do some put request next time we
                                  //             //have a good chance.
                                  //           },
                                  //           child: Icon(
                                  //             Icons.thumb_up,
                                  //           )),
                                  //     ),
                                  //   ],
                                  // )
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
