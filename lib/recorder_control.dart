import 'dart:async';

import 'package:flutter/material.dart';

class RecorderControl extends StatelessWidget {
  final Function changeRecorder;
  final Function changePlayer;
  final Function changeSongs;
  final Function changeFeed;

  RecorderControl(this.changeRecorder, this.changePlayer, this.changeSongs,
      this.changeFeed);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * (10 / 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {
                changeRecorder(false);
                changeFeed(true);
              },
              child: Column(
                children: [
                  Icon(Icons.music_note),
                  Text("Feed",
                  style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          Container(
            child: Text('Sing-Off', style: TextStyle(fontSize: 18)),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {
                changePlayer(false);
                changeSongs(true);
                changeRecorder(false);
              },
              child: Column(
                children: [
                  Icon(
                    Icons.music_video,
                  ),
                  Text("Songs",
                  style: TextStyle(fontSize: 12))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
