import 'package:flutter/material.dart';
import 'package:flutterkaraoke/model_song.dart';

class SongRow extends StatelessWidget {
  final Function setCategory;
  final Function changeSongs;
  final Function changeCategory;
  final Function changeFeed;
  final Function changeRecorder;
  final Function setSelectedSong;
  final List<ModelSong> allSongs;
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
              height: MediaQuery.of(context).size.height * (7 / 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: InkWell(
                        onTap: () {
                          changeFeed(true);
                          changeSongs(false);
                        },
                        child: Icon(
                          Icons.home,
                        )),
                  ),
                  Container(
                    child: Text(
                      'Sing-Off',
                    ),
                  ),
                  Container(
                    child: InkWell(
                        onTap: () {
                          changeSongs(false);
                          changeRecorder(true);
                          setSelectedSong(allSongs[0]);
                        },
                        child: Icon(
                          Icons.mood,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 3.75, //110,
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 60,
                        right: MediaQuery.of(context).size.width / 80),
                    child: Ink.image(
                      image: AssetImage("assets/all.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("All");
                        },
                        child: Center(
                          child: Text("All",
                              style: TextStyle(fontSize: 18, shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black),
                              ])),
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 60,
                        right: MediaQuery.of(context).size.width / 80),
                    child: Ink.image(
                      image: AssetImage("assets/christmas.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Christmas");
                        },
                        child: Center(
                          child: Text("Christmas",
                              style: TextStyle(fontSize: 18, shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black),
                              ])),
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 80),
                    child: Ink.image(
                      image: AssetImage("assets/drake.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Hip Hop");
                        },
                        child: Center(
                          child: Text("Hip Hop",
                              style: TextStyle(fontSize: 18, shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black),
                              ])),
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 80),
                    child: Ink.image(
                      image: AssetImage("assets/pop.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Pop");
                        },
                        child: Center(
                          child: Text("Pop",
                              style: TextStyle(fontSize: 18, shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black),
                              ])),
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 80),
                    child: Ink.image(
                      image: AssetImage("assets/bruce.jpg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Rock");
                        },
                        child: Center(
                          child: Text("Rock",
                              style: TextStyle(fontSize: 18, shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black),
                              ])),
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 80),
                    child: Ink.image(
                      image: AssetImage("assets/country.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Rock");
                        },
                        child: Center(
                          child: Text("Country",
                              style: TextStyle(fontSize: 18, shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black),
                              ])),
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 80),
                    child: Ink.image(
                      image: AssetImage("assets/soul.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Rock");
                        },
                        child: Center(
                          child: Text("Soul",
                              style: TextStyle(fontSize: 18, shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black),
                              ])),
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 60,
                        left: MediaQuery.of(context).size.width / 80),
                    child: Ink.image(
                      image: AssetImage("assets/bey.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Rock");
                        },
                        child: Center(
                          child: Text("Bey",
                              style: TextStyle(fontSize: 18, shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black),
                              ])),
                        ),
                      ),
                    )),
              ]),
            )
          ]),
    );
  }
}
