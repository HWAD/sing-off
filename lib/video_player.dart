import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String filePathToPlay;
  VideoPlayerScreen({Key key, @required this.filePathToPlay}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() =>
      _VideoPlayerScreenState(filePathToPlay);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  String filePathToPlay;
  Future<void> _initializeVideoPlayerFuture;

  _VideoPlayerScreenState(this.filePathToPlay);

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      filePathToPlay);
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
      height: MediaQuery.of(context).size.height*(8/10),
      child: Column(
        children: <Widget> [
          FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget> [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                  onPressed: () {
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
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      )
                  ,)
                ,
            ]
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
         ],
       ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
