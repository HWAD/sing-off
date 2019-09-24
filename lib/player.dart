import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final String filePathToPlay;
  final Function changeSongs;
  final Function changeRecorder;
  final Function changePlayer;
  final Function changeFeed;

  Player({
    Key key,
    @required this.filePathToPlay,
    @required this.changeSongs,
    @required this.changeRecorder,
    @required this.changePlayer,
    @required this.changeFeed,
  }) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState(
      filePathToPlay, changeSongs, changeRecorder, changePlayer, changeFeed);
}

class _PlayerState extends State<Player> {
  VideoPlayerController _controller;
  String filePathToPlay;
  Function changeSongs;
  Function changeRecorder;
  Function changePlayer;
  Function changeFeed;
  Future<void> _initializeVideoPlayerFuture;

  _PlayerState(this.filePathToPlay, this.changeSongs, this.changeRecorder,
      this.changePlayer, this.changeFeed);

  @override
  void initState() {
    _controller = VideoPlayerController.network(filePathToPlay);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15),
            color: Colors.black,
            height: MediaQuery.of(context).size.height * (10 / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      changePlayer(false);
                      changeFeed(true);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.music_note,
                        ),
                        Text("Feed",
                        style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Sing-Off',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Center(
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      changePlayer(false);
                      changeSongs(true);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.music_video),
                        Text("Songs",
                        style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * (80 / 100),
                      child: VideoPlayer(_controller),
                    )
                  ],
                );
              } else {
                return Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * (80 / 100),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  ],
                );
              }
            },
          ),
          Container(
            color: Colors.grey[400].withOpacity(0.9),
            height: MediaQuery.of(context).size.height * (7 / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // If the video is playing, pause it.
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // If the video is paused, play it.
                          _controller.play();
                        }
                      });
                    },
                    // Display the correct icon depending on the state of the player.
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
