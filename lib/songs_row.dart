import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterkaraoke/model_song.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class SongRow extends StatelessWidget {
  final Function setCategory;
  final Function changeSongs;
  final Function changeCategory;
  final Function changeFeed;
  final Function changeRecorder;
  final Function setSelectedSong;
  final List<ModelSong> allSongs;
  final _controller = ScrollController();

  SongRow(
      this.setCategory,
      this.changeSongs,
      this.changeCategory,
      this.changeFeed,
      this.changeRecorder,
      this.setSelectedSong,
      this.allSongs);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onPressed: () {
                      changeFeed(true);
                      changeSongs(false);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.music_note,
                        ),
                        Text("Feed", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                Container(
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
                      changeSongs(false);
                      changeRecorder(true);
                      setSelectedSong(
                        allSongs[0],
                      );
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.mood,
                        ),
                        Text(
                          "Random",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.width / 3,
              margin: EdgeInsets.only(top: 8, left: 8),
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: FadingEdgeScrollView.fromScrollView(
                gradientFractionOnStart: 0.55,
                gradientFractionOnEnd: 0.55,
                child: ListView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 3.2,
                      child: Ink.image(
                        image: AssetImage("assets/all.jpeg"),
                        fit: BoxFit.fill,
                        child: InkWell(
                          onTap: () {
                            setCategory("All");
                          },
                          child: Center(
                            child: Text(
                              "All",
                              style: TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                      offset: Offset(-1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, 1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(-1.5, 1.5),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.2,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 60,
                          right: MediaQuery.of(context).size.width / 120),
                      child: Ink.image(
                        image: AssetImage("assets/christmas.jpeg"),
                        fit: BoxFit.fill,
                        child: InkWell(
                          onTap: () {
                            setCategory("Christmas");
                          },
                          child: Center(
                            child: Text(
                              "Christmas",
                              style: TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                      offset: Offset(-1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, 1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(-1.5, 1.5),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.2,
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 120),
                      child: Ink.image(
                        image: AssetImage("assets/drake.jpeg"),
                        fit: BoxFit.fill,
                        child: InkWell(
                          onTap: () {
                            setCategory("Hip Hop");
                          },
                          child: Center(
                            child: Text(
                              "Hip Hop",
                              style: TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                      offset: Offset(-1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, 1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(-1.5, 1.5),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.2,
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 120),
                      child: Ink.image(
                        image: AssetImage("assets/pop.jpeg"),
                        fit: BoxFit.fill,
                        child: InkWell(
                          onTap: () {
                            setCategory("Pop");
                          },
                          child: Center(
                            child: Text(
                              "Pop",
                              style: TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                      offset: Offset(-1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, 1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(-1.5, 1.5),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.2,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 120,
                          right: MediaQuery.of(context).size.width / 40),
                      child: Ink.image(
                        image: AssetImage("assets/bruce.jpg"),
                        fit: BoxFit.fill,
                        child: InkWell(
                          onTap: () {
                            setCategory("Rock");
                          },
                          child: Center(
                            child: Text(
                              "Rock",
                              style: TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                      offset: Offset(-1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(1.5, 1.5),
                                      color: Colors.black),
                                  Shadow(
                                      offset: Offset(-1.5, 1.5),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
