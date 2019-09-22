import 'package:flutter/material.dart';

class SongRow extends StatelessWidget {
  final Function setCategory;
  final Function changeSongs;
  final Function changeCategory;
  final Function changeUserPage;
  SongRow(this.setCategory, this.changeSongs, this.changeCategory,
      this.changeUserPage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Row(
              children: [
                Container(
                  height: 30,
                  child: InkWell(
                      onTap: () {
                        changeCategory(true);
                        changeSongs(false);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                      )),
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.only(top: 20, left: 50),
                  child: Text('Genre',
                      style: TextStyle(
                        fontSize: 18,
                        // shadows: [
                        //   Shadow(
                        //       // bottomLeft
                        //       offset: Offset(-1.5, -1.5),
                        //       color: Colors.black),
                        //   Shadow(
                        //       // bottomRight
                        //       offset: Offset(1.5, -1.5),
                        //       color: Colors.black),
                        //   Shadow(
                        //       // topRight
                        //       offset: Offset(1.5, 1.5),
                        //       color: Colors.black),
                        //   Shadow(
                        //       // topLeft
                        //       offset: Offset(-1.5, 1.5),
                        //       color: Colors.black),
                        // ],
                      ),
                      textAlign: TextAlign.left),
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 30),
                  child: InkWell(
                    child: Icon(Icons.music_video),
                    onTap: () {
                      changeUserPage(true);
                      changeCategory(false);
                      changeSongs(false);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width / 3.75, //110,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(top: 6, bottom: 6),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
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
                        child: Text(
                          "Bey",
                          style: TextStyle(
                            fontSize: 18,
                            shadows: [
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
