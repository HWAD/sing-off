import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final String filePathToPlay;
  final Function changeSongs;
  final Function changeRecorder;
  final Function changePlayer;

  Player({Key key, @required this.filePathToPlay, @required this.changeSongs, @required this.changeRecorder, @required this.changePlayer}) : super(key: key);

  @override
  _PlayerState createState() =>
      _PlayerState(filePathToPlay, changeSongs, changeRecorder, changePlayer);
}

class _PlayerState extends State<Player> {
  VideoPlayerController _controller;
  String filePathToPlay;
  Function changeSongs;
  Function changeRecorder;
  Function changePlayer;
  Future<void> _initializeVideoPlayerFuture;

  _PlayerState(this.filePathToPlay, this.changeSongs,  this.changeRecorder,  this.changePlayer);

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
      height: MediaQuery.of(context).size.height * (93 / 100),
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * (80 / 100),
                    child: VideoPlayer(_controller),
                  ),
                  
                  Container(
      color: Colors.grey[800],

      child: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Container( 
              height: MediaQuery.of(context).size.height * (10 / 100),
              child:InkWell(
                onTap: () {
                  changePlayer(false);
                  changeRecorder(true);
                },
                child: Icon(Icons.arrow_back_ios)), 
            ),
            Container(
              height: 60,
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
            Container(
              height: 60,
              child: InkWell(
              onTap: () {
                changePlayer(false);
                changeSongs(true);
              },
              child: Icon(Icons.home,)
            ), 
            ),
          ])]),
    )]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
